/**
  *  \file util/plugin/consoleapplication.cpp
  */

#include "util/plugin/consoleapplication.hpp"
#include "afl/except/fileproblemexception.hpp"
#include "afl/io/directoryentry.hpp"
#include "afl/io/nullstream.hpp"
#include "afl/string/format.hpp"
#include "util/plugin/installer.hpp"
#include "util/plugin/manager.hpp"
#include "util/translation.hpp"
#include "version.hpp"

using afl::string::Format;

namespace {
    class NullDirectory : public afl::io::Directory {
     public:
        NullDirectory()
            { }
        ~NullDirectory()
            { }
        virtual afl::base::Ref<afl::io::DirectoryEntry> getDirectoryEntryByName(String_t name)
            { return *new Entry(*this, name); }
        virtual afl::base::Ref<afl::base::Enumerator<afl::base::Ptr<afl::io::DirectoryEntry> > > getDirectoryEntries()
            { return *new Enum(); }
        virtual afl::base::Ptr<Directory> getParentDirectory()
            { return new NullDirectory(); }
        virtual String_t getDirectoryName()
            { return String_t(); }
        virtual String_t getTitle()
            { return String_t(); }
     private:
        class Enum : public afl::base::Enumerator<afl::base::Ptr<afl::io::DirectoryEntry> > {
         public:
            bool getNextElement(afl::base::Ptr<afl::io::DirectoryEntry>&)
                { return false; }
        };

        class Entry : public afl::io::DirectoryEntry {
         public:
            Entry(afl::base::Ref<afl::io::Directory> parent, String_t name)
                : DirectoryEntry(),
                  m_name(name),
                  m_parent(parent)
                { }
            virtual String_t getTitle()
                { return m_name; }
            virtual String_t getPathName()
                { return String_t(); }
            virtual afl::base::Ref<afl::io::Stream> openFile(afl::io::FileSystem::OpenMode mode)
                {
                    if (mode == afl::io::FileSystem::Create) {
                        return *new afl::io::NullStream();
                    } else {
                        throw afl::except::FileProblemException(m_name, _("No such file"));
                    }
                }
            virtual afl::base::Ref<afl::io::Directory> openDirectory()
                { return *new NullDirectory(); }
            virtual afl::base::Ref<Directory> openContainingDirectory()
                { return m_parent; }
            virtual void updateInfo(uint32_t)
                { }
            virtual void doRename(String_t)
                { }
            virtual void doErase()
                { }
            virtual void doCreateAsDirectory()
                { }
            virtual void doSetFlag(FileFlag /*flag*/, bool /*value*/)
                { }
         private:
            String_t m_name;
            afl::base::Ref<afl::io::Directory> m_parent;
        };
    };

    bool checkRemovePlugin(afl::io::TextWriter& out, util::plugin::Installer& inst, util::plugin::Plugin& plug)
    {
        String_t msg;
        if (inst.checkRemovePreconditions(plug, afl::string::Translator::getSystemInstance()).get(msg)) {
            out.writeLine(msg);
            return false;
        }
        return true;
    }

    bool checkPreconditions(afl::io::TextWriter& out, util::plugin::Installer& inst)
    {
        String_t msg;
        if (inst.checkInstallPreconditions(afl::string::Translator::getSystemInstance()).get(msg)) {
            out.writeLine(msg);
            return false;
        }
        return true;
    }
}


struct util::plugin::ConsoleApplication::Command {
    const char* name;
    void (ConsoleApplication::*func)(afl::sys::Environment::CommandLine_t& cmdl);
};


util::plugin::ConsoleApplication::ConsoleApplication(afl::sys::Environment& env, afl::io::FileSystem& fs)
    : Application(env, fs),
      profile(env, fs, translator(), log())
{
    consoleLogger().setConfiguration("*@-Debug=drop");
}

void
util::plugin::ConsoleApplication::appMain()
{
    // Find command
    afl::base::Ref<afl::sys::Environment::CommandLine_t> cmdl = environment().getCommandLine();
    String_t command;
    if (!cmdl->getNextElement(command)) {
        errorExit(_("No command specified. Use 'c2plugin -h' for help."));
    } else if (const Command* cmd = findCommand(command)) {
        (this->*(cmd->func))(*cmdl);
        exit(0);
    } else {
        errorExit(_("Invalid command specified. Use 'c2plugin -h' for help."));
    }
}

void
util::plugin::ConsoleApplication::doList(afl::sys::Environment::CommandLine_t& cmdl)
{
    // We do not take arguments
    enum { Default, Long, Short } f = Default;
    bool ordered = false;
    String_t arg;
    while (cmdl.getNextElement(arg)) {
        const char* p = arg.c_str();         // FIXME
        if (*p == '-') {
            while (const char ch = *++p) {
                switch (ch) {
                 case 'l': f = Long; break;
                 case 'b': f = Short; break;
                 case 'o': ordered = true; break;
                 default:
                 {
                     char str[3] = {'-',ch,0};
                     errorExit(Format(_("Unknown option `%s'").c_str(), str));
                 }
                }
            }
        } else {
            errorExit(_("too many arguments"));
        }
    }

    // Create plugin manager
    Manager mgr(translator(), log());
    mgr.findPlugins(*profile.open()->openDirectory("plugins"));

    // List them
    std::vector<Plugin*> them;
    mgr.enumPlugins(them, ordered);
    if (f != Short) {
        standardOutput().writeLine(Format(_("%d plugin%!1{s%} installed.").c_str(), them.size()));
    }
    for (size_t i = 0, n = them.size(); i < n; ++i) {
        const Plugin& p = *them[i];
        if (f == Short) {
            standardOutput().writeLine(p.getId());
        } else {
            standardOutput().writeLine("--------");
            standardOutput().writeLine(Format(_("Plugin '%s': %s").c_str(), p.getId(), p.getName()));
            if (!p.getDescription().empty()) {
                standardOutput().writeLine();
                standardOutput().writeLine(p.getDescription());
            }

            if (f == Long) {
                const Plugin::ItemList& items = p.getItems();
                bool did = false;
                for (size_t ii = 0, nn = items.size(); ii < nn; ++ii) {
                    if (items[ii].type != Plugin::Command) {
                        if (!did) {
                            standardOutput().writeLine();
                            standardOutput().writeLine(Format(_("Files (in '%s'):").c_str(), p.getBaseDirectory()));
                            did = true;
                        }
                        standardOutput().writeLine("  " + items[ii].name);
                    }
                }
            }
        }
    }
}

void
util::plugin::ConsoleApplication::doAdd(afl::sys::Environment::CommandLine_t& cmdl)
{
    // Create plugin directory
    afl::base::Ref<afl::io::DirectoryEntry> pluginDirEntry = profile.open()->getDirectoryEntryByName("plugins");
    if (pluginDirEntry->getFileType() != afl::io::DirectoryEntry::tDirectory) {
        pluginDirEntry->createAsDirectory();
    }
    afl::base::Ref<afl::io::Directory> pluginDir = pluginDirEntry->openDirectory();

    // Create plugin manager
    Manager mgr(translator(), log());
    mgr.findPlugins(*pluginDir);

    Installer installer(mgr, fileSystem(), *pluginDir);

    // Iterate
    bool dry = false;
    bool did = false;
    bool err = false;
    bool force = false;
    String_t option;
    while (cmdl.getNextElement(option)) {
        if (option == "-n") {
            dry = true;
        } else if (option == "-f") {
            force = true;
        } else if (!option.empty() && option[0] == '-') {
            errorExit(Format(_("Unknown option `%s'").c_str(), option));
        } else {
            did = true;
            try {
                Plugin* plug = installer.prepareInstall(option);
                if (!plug) {
                    errorOutput().writeLine(Format(_("%s: Unknown file type").c_str(), option));
                    err = true;
                } else {
                    if (mgr.getPluginById(plug->getId())) {
                        standardOutput().writeLine(Format(_("Updating plugin '%s'...").c_str(), plug->getId()));
                    } else {
                        standardOutput().writeLine(Format(_("Installing plugin '%s'...").c_str(), plug->getId()));
                    }
                    if (force || checkPreconditions(errorOutput(), installer)) {
                        installer.doInstall(dry);
                    } else {
                        err = true;
                    }
                }
            }
            catch (afl::except::FileProblemException& e) {
                errorOutput().writeLine(Format("%s: %s", e.getFileName(), e.what()));
                err = true;
            }
            catch (std::exception& e) {
                errorOutput().writeLine(e.what());
                err = true;
            }
        }
    }
    if (!did) {
        errorExit(Format(_("Missing name plugin or file to install. '%s -h' for help.").c_str(), environment().getInvocationName()));
    }
    if (err) {
        exit(1);
    }
}

void
util::plugin::ConsoleApplication::doRemove(afl::sys::Environment::CommandLine_t& cmdl)
{
    // Create plugin manager
    Manager mgr(translator(), log());

    // FIXME: this relies on us being able to create a Directory instance for a nonexistant directory.
    afl::base::Ref<afl::io::Directory> dir = profile.open()->openDirectory("plugins");
    mgr.findPlugins(*dir);

    Installer installer(mgr, fileSystem(), *dir);

    // Iterate
    bool dry = false;
    bool did = false;
    bool err = false;
    bool force = false;
    String_t opt;
    while (cmdl.getNextElement(opt)) {
        if (opt == "-n") {
            dry = true;
        } else if (opt == "-f") {
            force = true;
        } else if (!opt.empty() && opt[0] == '-') {
            errorExit(Format(_("Unknown option `%s'").c_str(), opt));
        } else {
            did = true;
            if (Plugin* pPlug = mgr.getPluginById(afl::string::strUCase(opt))) {
                if (force || checkRemovePlugin(errorOutput(), installer, *pPlug)) {
                    standardOutput().writeLine(Format(_("Removing plugin '%s'...").c_str(), pPlug->getId()));
                    installer.doRemove(pPlug, dry);
                } else {
                    err = true;
                }
            } else {
                errorOutput().writeLine(Format(_("Plugin '%s' is not known.").c_str(), opt));
                err = true;
            }
        }
    }
    if (!did) {
        errorExit(Format(_("Missing name of plugin to uninstall. '%s -h' for help.").c_str(), environment().getInvocationName()));
    }
    if (err) {
        exit(1);
    }
}

void
util::plugin::ConsoleApplication::doTest(afl::sys::Environment::CommandLine_t& cmdl)
{
    // Dummy path
    afl::base::Ref<afl::io::Directory> dir = *new NullDirectory();

    // Iterate
    bool did = false;
    bool err = false;
    bool verbose = false;
    String_t p;
    while (cmdl.getNextElement(p)) {
        if (p == "-v") {
            verbose = true;
        } else if (!p.empty() && p[0] == '-') {
            errorExit(Format(_("Unknown option `%s'").c_str(), p));
        } else {
            // Create plugin manager and installer separately for each item
            Manager mgr(translator(), log());
            Installer installer(mgr, fileSystem(), *dir);
            did = true;

            try {
                Plugin* plug = installer.prepareInstall(p);
                if (!plug) {
                    errorOutput().writeLine(Format(_("%s: Unknown file type").c_str(), p));
                    err = true;
                } else {
                    installer.doInstall(false);
                    if (verbose) {
                        standardOutput().writeLine(Format(_("%s: Plugin '%s' (%s) tested successfully.").c_str(), p, plug->getName(), plug->getId()));
                    }
                }
            }
            catch (afl::except::FileProblemException& e) {
                if (p == e.getFileName()) {
                    errorOutput().writeLine(Format("%s: %s", p, e.what()));
                } else {
                    errorOutput().writeLine(Format("%s: %s: %s", p, e.getFileName(), e.what()));
                }
                err = true;
            }
            catch (std::exception& e) {
                errorOutput().writeLine(Format("%s: %s", p, e.what()));
                err = true;
            }
        }
    }
    if (!did) {
        errorExit(Format(_("Missing name plugin or file to test. '%s -h' for help.").c_str(), environment().getInvocationName()));
    }
    if (err) {
        exit(1);
    }
}

void
util::plugin::ConsoleApplication::doHelp(afl::sys::Environment::CommandLine_t& /*cmdl*/)
{
    standardOutput().writeText(Format(_("PCC2 Plugin Manager v%s - (c) 2015-2018 Stefan Reuther\n").c_str(), PCC2_VERSION));
    standardOutput().writeText(Format(_("\n"
                                        "Usage:\n"
                                        "  %s -h|help\n"
                                        "                  This help message\n"
                                        "  %$0s list|ls [-l|-b] [-o]\n"
                                        "                  List installed plugins\n"
                                        "  %$0s add|install [-n] [-f] FILE.c2p...\n"
                                        "                  Install given plugins\n"
                                        "  %$0s remove|rm|uninstall [-n] [-f] ID...\n"
                                        "                  Remove given plugins\n"
                                        "  %$0s test [-v] FILE.c2p...\n"
                                        "                  Test given plugins\n"
                                        "\n"
                                        "Options:\n"
                                        " -l               List more details\n"
                                        " -b               List fewer details\n"
                                        " -o               List in load order (default: alphabetical)\n"
                                        " -n               Dry run (don't modify anything, just check)\n"
                                        " -f               Ignore dependencies/requirements\n"
                                        " -v               Verbose\n"
                                        "\n"
                                        "Report bugs to <Streu@gmx.de>\n").c_str(),
                                      environment().getInvocationName()));
    exit(0);
}

const util::plugin::ConsoleApplication::Command*
util::plugin::ConsoleApplication::findCommand(const String_t& name)
{
    static struct Command commands[] = {
        { "ls",        &ConsoleApplication::doList },
        { "list",      &ConsoleApplication::doList },
        { "add",       &ConsoleApplication::doAdd },
        { "install",   &ConsoleApplication::doAdd },
        { "rm",        &ConsoleApplication::doRemove },
        { "remove",    &ConsoleApplication::doRemove },
        { "uninstall", &ConsoleApplication::doRemove },
        { "test",      &ConsoleApplication::doTest },
        { "-h",        &ConsoleApplication::doHelp },
        { "--help",    &ConsoleApplication::doHelp },
        { "-help",     &ConsoleApplication::doHelp },
        { "help",      &ConsoleApplication::doHelp },
    };

    afl::base::Memory<const Command> c(commands);
    while (const Command* p = c.eat()) {
        if (p->name == name) {
            return p;
        }
    }
    return 0;
}
