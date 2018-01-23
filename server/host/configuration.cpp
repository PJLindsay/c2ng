/**
  *  \file server/host/configuration.cpp
  *  \brief Structure server::host::Configuration
  */

#include "server/host/configuration.hpp"
#include "server/ports.hpp"

// Default constructor.
server::host::Configuration::Configuration()
    : timeScale(60),
      workDirectory(),
      useCron(true),
      unpackBackups(false),
      hostFileAddress(DEFAULT_ADDRESS, HOSTFILE_PORT)
{ }

// Convert time.
int32_t
server::host::Configuration::getUserTimeFromTime(Time_t t) const
{
    // ex getUserTimeFromTime
    return t*timeScale/60;
}