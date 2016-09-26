/**
  *  \file game/config/configuration.cpp
  *  \brief Class game::config::Configuration
  */

#include "game/config/configuration.hpp"
#include "game/config/stringoption.hpp"

// FIXME: signal for changes

// Constructor.
game::config::Configuration::Configuration()
{ }

// Destructor.
game::config::Configuration::~Configuration()
{ }

// Get option, given a name.
game::config::ConfigurationOption*
game::config::Configuration::getOptionByName(String_t name) const
{
    // ex Config::getConfigOption
    return m_options[name];
}

// Set option.
void
game::config::Configuration::setOption(String_t name, String_t value, ConfigurationOption::Source source)
{
    ConfigurationOption* opt = getOptionByName(name);
    if (opt == 0) {
        opt = m_options.insertNew(name, new StringOption(""));
    }
    opt->setAndMarkUpdated(value, source);
}

// Mark all options unset.
void
game::config::Configuration::markAllOptionsUnset()
{
    // ex Config::markAllOptionsUnset
    for (Map_t::iterator i = m_options.begin(), e = m_options.end(); i != e; ++i) {
        i->second->setSource(ConfigurationOption::Default);
    }
}

void
game::config::Configuration::notifyListeners()
{
    bool needed = false;
    for (Map_t::iterator i = m_options.begin(), e = m_options.end(); i != e; ++i) {
        if (i->second->isChanged()) {
            i->second->markChanged(false);
            needed = true;
        }
    }
    if (needed) {
        sig_change.raise();
    }
}