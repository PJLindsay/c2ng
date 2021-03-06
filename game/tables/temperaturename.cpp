/**
  *  \file game/tables/temperaturename.cpp
  */

#include "game/tables/temperaturename.hpp"
#include "util/translation.hpp"

game::tables::TemperatureName::TemperatureName(afl::string::Translator& tx)
    : m_translator(tx)
{ }

String_t
game::tables::TemperatureName::get(int temp) const
{
    // ex game/tables.h:getTemperatureName
    if (temp <= 14) {
        return m_translator.translateString("arctic");
    } else if (temp <= 39) {
        return m_translator.translateString("cool");
    } else if (temp <= 64) {
        return m_translator.translateString("warm");
    } else if (temp <= 84) {
        return m_translator.translateString("tropical");
    } else {
        return m_translator.translateString("desert");
    }
}

bool
game::tables::TemperatureName::getFirstKey(int& a) const
{
    a = 0;
    return true;
}

bool
game::tables::TemperatureName::getNextKey(int& a) const
{
    if (a <= 14) {
        a = 15;
        return true;
    } else if (a <= 39) {
        a = 40;
        return true;
    } else if (a <= 64) {
        a = 65;
        return true;
    } else if (a <= 84) {
        a = 85;
        return true;
    } else {
        return false;
    }
}
