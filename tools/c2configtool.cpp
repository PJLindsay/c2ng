/**
  *  \file tools/c2configtool.cpp
  */

#include <memory>
#include "afl/sys/environment.hpp"
#include "afl/io/filesystem.hpp"
#include "util/application.hpp"
#include "afl/sys/standardcommandlineparser.hpp"
#include "util/configurationfile.hpp"
#include "afl/io/textfile.hpp"
#include "afl/string/format.hpp"
#include "util/translation.hpp"
#include "version.hpp"
#include "util/string.hpp"
#include "game/v3/structures.hpp"
#include "game/config/hostconfiguration.hpp"
#include "game/v3/hconfig.hpp"
#include "afl/sys/log.hpp"

namespace {
    class ConsoleConfigApplication : public util::Application {
     public:
        ConsoleConfigApplication(afl::sys::Environment& env, afl::io::FileSystem& fs)
            : Application(env, fs)
            { }

        virtual void appMain();

     private:
        void showHelp();
        void loadHConfig(util::ConfigurationFile& out, afl::io::Stream& in);
        void saveHConfig(const util::ConfigurationFile& in, afl::io::Stream& out);
    };

    class ConfigurationReference {
     public:
        ConfigurationReference()
            : m_p()
            { }

        util::ConfigurationFile& operator()()
            {
                if (m_p.get() == 0) {
                    m_p.reset(new util::ConfigurationFile());
                }
                return *m_p;
            }

        void replaceOrMerge(std::auto_ptr<util::ConfigurationFile> other)
            {
                if (m_p.get() == 0) {
                    m_p = other;
                } else {
                    m_p->merge(*other);
                }
            }

     private:
        std::auto_ptr<util::ConfigurationFile> m_p;
    };

    String_t limit11(String_t in)
    {
        size_t i = 0;
        int n = 0;
        while (i < in.size()) {
            if (in[i] == ',') {
                if (++n == game::v3::structures::NUM_PLAYERS) {
                    in.erase(i);
                    break;
                }
            }
            ++i;
        }
        return in;
    }
}

void
ConsoleConfigApplication::appMain()
{
    ConfigurationReference subject;
    afl::sys::StandardCommandLineParser cmdl(environment().getCommandLine());
    bool hadAction = false;
    bool option;
    String_t text;
    while (cmdl.getNext(option, text)) {
        if (option) {
            if (text == "help" || text == "h") {
                showHelp();
            } else if (text == "empty") {
                // --empty
                subject();
            } else if (text == "load-hconfig") {
                // --load-hconfig=FILE
                String_t fileName = cmdl.getRequiredParameter(text);
                afl::base::Ref<afl::io::Stream> thisStream(fileSystem().openFile(fileName, afl::io::FileSystem::OpenRead));
                loadHConfig(subject(), *thisStream);                
            } else if (text == "D") {
                // -D KEY=VALUE
                String_t kv = cmdl.getRequiredParameter(text);
                String_t::size_type eq = kv.find('=');
                if (eq == String_t::npos) {
                    errorExit(_("expecting \"KEY=VALUE\" for option \"-D\""));
                }
                subject().set(kv.substr(0, eq), kv.substr(eq+1));
            } else if (text == "U") {
                // -U KEY
                String_t key = cmdl.getRequiredParameter(text);
                while (subject().remove(key)) {
                    // nix
                }
            } else if (text == "o") {
                // -o FILE
                String_t fileName = cmdl.getRequiredParameter(text);
                afl::base::Ref<afl::io::Stream> thisStream(fileSystem().openFile(fileName, afl::io::FileSystem::Create));
                afl::io::TextFile thisText(*thisStream);
                subject().save(thisText);
                thisText.flush();
                hadAction = true;
            } else if (text == "stdout") {
                // --stdout
                subject().save(standardOutput());
                hadAction = true;
            } else if (text == "get") {
                // --get=KEY
                String_t key = afl::string::strUCase(cmdl.getRequiredParameter(text));
                if (const util::ConfigurationFile::Element* ele = subject().findElement(util::ConfigurationFile::Assignment, key)) {
                    standardOutput().writeLine(ele->value);
                } else {
                    standardOutput().writeLine(String_t());
                }
                hadAction = true;
            } else if (text == "save-hconfig") {
                // --save-hconfig=FILE
                String_t fileName = cmdl.getRequiredParameter(text);
                afl::base::Ref<afl::io::Stream> thisStream(fileSystem().openFile(fileName, afl::io::FileSystem::Create));
                saveHConfig(subject(), *thisStream);
                hadAction = true;
            } else {
                errorExit(afl::string::Format(_("invalid option specified. Use \"%s -h\" for help").c_str(), environment().getInvocationName()));
            }
        } else {
            // Just a file name: load it
            afl::base::Ref<afl::io::Stream> thisStream(fileSystem().openFile(text, afl::io::FileSystem::OpenRead));
            afl::io::TextFile thisText(*thisStream);
            std::auto_ptr<util::ConfigurationFile> thisConfig(new util::ConfigurationFile());
            thisConfig->load(thisText);
            subject.replaceOrMerge(thisConfig);
        }
    }

    if (!hadAction) {
        errorOutput().writeLine(translator().translateString("warning: no action specified"));
    }
}

void
ConsoleConfigApplication::showHelp()
{
    afl::io::TextWriter& w = standardOutput();
    w.writeLine(afl::string::Format(_("Configuration Tool v%s - (c) 2018 Stefan Reuther").c_str(), PCC2_VERSION));
    w.writeText(afl::string::Format(_("\n"
                                      "Usage:\n"
                                      "  %s [-OPTIONS|FILES...]\n"
                                      "\n"
                                      "%s"
                                      "\n"
                                      "Report bugs to <Streu@gmx.de>\n").c_str(),
                                    environment().getInvocationName(),
                                    util::formatOptions(_("General:\n"
                                                          "--help\tshow help\n"
                                                          "\n"
                                                          "Load/Modify:\n"
                                                          "FILE\tload text file\n"
                                                          "--empty\tload empty file\n"
                                                          "--load-hconfig=FILE\tload binary HConfig file\n"
                                                          "-DKEY=VALUE\tset value\n"
                                                          "-UKEY\tunset value\n"
                                                          "\n"
                                                          "Actions:\n"
                                                          "-o FILE\tsave result to file\n"
                                                          "--stdout\tsend result to stdout\n"
                                                          "--get=OPTION\tget option value\n"
                                                          "--save-hconfig=FILE\tsave binary HConfig file\n"))));
    exit(0);
}

void
ConsoleConfigApplication::loadHConfig(util::ConfigurationFile& out, afl::io::Stream& in)
{
    // Load file
    game::v3::structures::HConfig data;
    size_t size = in.read(afl::base::fromObject(data));

    // Convert to internal format
    game::config::HostConfiguration config;
    game::v3::unpackHConfig(data, size, config, game::config::ConfigurationOption::User);

    // Convert that into result
    afl::base::Ref<game::config::Configuration::Enumerator_t> e(*config.getOptions());
    game::config::Configuration::OptionInfo_t oi;
    while (e->getNextElement(oi)) {
        if (oi.second != 0 && oi.second->getSource() == game::config::ConfigurationOption::User) {
            out.set("PHOST", oi.first, limit11(oi.second->toString()));
        }
    }
}

void
ConsoleConfigApplication::saveHConfig(const util::ConfigurationFile& in, afl::io::Stream& out)
{
    // Convert to internal format
    game::config::HostConfiguration config;
    for (size_t i = 0, n = in.getNumElements(); i < n; ++i) {
        if (const util::ConfigurationFile::Element* pElem = in.getElementByIndex(i)) {
            if (pElem->key.compare(0, 6, "PHOST.", 6) == 0) {
                try {
                    config.setOption(pElem->key.substr(6), pElem->value, game::config::ConfigurationOption::User);
                }
                catch (std::exception& e) {
                    log().write(afl::sys::Log::Warn, "config", pElem->key, e);
                }
            }
        }
    }

    // Convert to hconfig format
    game::v3::structures::HConfig data;
    game::v3::packHConfig(data, config);

    // Write file
    out.fullWrite(afl::base::fromObject(data));
}


int main(int, char** argv)
{
    afl::sys::Environment& env = afl::sys::Environment::getInstance(argv);
    afl::io::FileSystem& fs = afl::io::FileSystem::getInstance();
    return ConsoleConfigApplication(env, fs).run();
}

