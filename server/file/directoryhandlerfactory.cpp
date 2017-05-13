/**
  *  \file server/file/directoryhandlerfactory.cpp
  *  \brief Class server::file::DirectoryHandlerFactory
  */

#include "server/file/directoryhandlerfactory.hpp"
#include "afl/except/fileproblemexception.hpp"
#include "server/file/ca/root.hpp"
#include "server/file/filesystemhandler.hpp"
#include "server/file/internaldirectoryhandler.hpp"
#include "afl/base/deletable.hpp"
#include "afl/net/url.hpp"
#include "afl/net/networkstack.hpp"
#include "afl/net/resp/client.hpp"
#include "server/file/clientdirectoryhandler.hpp"

namespace {
    struct InternalRoot : public afl::base::Deletable {
        server::file::InternalDirectoryHandler::Directory dir;
        server::file::InternalDirectoryHandler handler;
        InternalRoot()
            : dir(""),
              handler("int:", dir)
            { }
    };

    server::file::DirectoryHandler* findDirectory(server::file::DirectoryHandler& dir, const String_t& name, afl::base::Deleter& del)
    {
        server::file::DirectoryHandler::Info info;
        if (dir.findItem(name, info) && info.type == server::file::DirectoryHandler::IsDirectory) {
            return &del.addNew(dir.getDirectory(info));
        } else {
            return 0;
        }
    }
}

// Constructor.
server::file::DirectoryHandlerFactory::DirectoryHandlerFactory(afl::io::FileSystem& fs, afl::net::NetworkStack& net)
    : m_deleter(),
      m_cache(),
      m_clientCache(),
      m_fs(fs),
      m_networkStack(net)
{ }

// Create a DirectoryHandler.
server::file::DirectoryHandler&
server::file::DirectoryHandlerFactory::createDirectoryHandler(const String_t& str)
{
    // Check cache
    Cache_t::iterator it = m_cache.find(str);
    if (it != m_cache.end() && it->second != 0) {
        // Found in cache
        return *it->second;
    } else {
        // No, this one is new
        DirectoryHandler* result;
        String_t::size_type p;
        if (str.size() >= 9 && str.compare(0, 9, "c2file://", 9) == 0) {
            // Managed remote
            afl::net::Url u;
            if (!u.parse(str)) {
                throw afl::except::FileProblemException(str, "Invalid URL");
            }

            // Process the path
            String_t path = u.getPath();
            if (!path.empty() && path[0] == '/') {
                path.erase(0, 1);
            }
            if (!path.empty() && path[path.size()-1] == '/') {
                path.erase(path.size()-1);
            }

            // Make or re-use the connection.
            // We use the URL without path as a cache key.
            afl::net::Url keyUrl = u;
            keyUrl.setPath("/");
            afl::net::CommandHandler*& client = m_clientCache[keyUrl.toString()];
            if (client == 0) {
                client = &m_deleter.addNew(new afl::net::resp::Client(m_networkStack, u.getName("9998")));
            }

            // Build the result
            ClientDirectoryHandler& handler = m_deleter.addNew(new ClientDirectoryHandler(*client, path));
            if (!u.getUser().empty()) {
                handler.setUser(u.getUser());
            }
            result = &handler;
        } else if ((p = str.find('@')) != String_t::npos) {
            // PATH @ BACKEND form
            DirectoryHandler& backend = createDirectoryHandler(str.substr(p+1));
            result = &backend;

            // Walk the path
            String_t::size_type n = 0;
            String_t::size_type e;
            while (n < p && (e = str.find_first_of("/@", n)) != String_t::npos) {
                result = findDirectory(*result, str.substr(n, e-n), m_deleter);
                if (result == 0) {
                    throw afl::except::FileProblemException(str, "File not found");
                }
                n = e+1;
            }
        } else {
            // Just a path or URL
            if (str.size() > 3 && str.compare(0, 3, "ca:", 3) == 0) {
                // Content-addressable
                DirectoryHandler& backend = createDirectoryHandler(str.substr(3));
                server::file::ca::Root& root = m_deleter.addNew(new server::file::ca::Root(backend));
                result = &m_deleter.addNew(root.createRootHandler());
            } else if (str.size() >= 4 && str.compare(0, 4, "int:", 4) == 0) {
                // Internal
                InternalRoot& root = m_deleter.addNew(new InternalRoot());
                result = &root.handler;
            } else {
                result = &m_deleter.addNew(new FileSystemHandler(m_fs, str));
            }
        }

        // Produce result
        m_cache.insert(Cache_t::value_type(str, result));
        return *result;
    }
}

// Build a path name.
String_t
server::file::DirectoryHandlerFactory::makePathName(const String_t& backendPath, const String_t& child)
{
    String_t::size_type p = backendPath.find('@');
    if (p == String_t::npos) {
        // No @, so this is just a backend ("/foo/bar", "ca:/foo", etc.)
        return child + "@" + backendPath;
    } else {
        // Got a @, so this is PATH@BACKEND. Build PATH/child@BACKEND.
        return backendPath.substr(0, p) + "/" + child + backendPath.substr(p);
    }
}