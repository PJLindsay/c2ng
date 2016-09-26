/**
  *  \file util/string.hpp
  */
#ifndef C2NG_UTIL_STRING_HPP
#define C2NG_UTIL_STRING_HPP

#include "afl/string/string.hpp"

namespace util {

    /** String Match, PHost way.
        \param pattern  Pattern we want to match against. Consists of
        an initial sequence of capital letters, followed
        by a sequence of other letters. Lower-case letters
        are optional, the rest is mandatory.
        \param tester   The string to test against the pattern.

        Matching is case-insensitive.

        Example: stringMatch("ENglish", p) matches if p is
        "english", or any abbreviation of "english" up to "en". */
    bool stringMatch(const char* pattern, const char* tester);
    bool stringMatch(const char* pattern, const String_t& tester);

    bool eatWord(const char*& tpl, String_t& word);

    /** Parse a range. Syntax is one of
        - "nn", means set min=max=nn
        - "nn-", means set min=nn, do not modify max
        - "nn-mm", means set min=nn, max=mm

        Note that this function does not enforce that the result actually is a real range with min<=max,
        and does not enforce that the returned range is a subrange of [min,max].
        It just parses the numbers, and min/max are only default values.

        \param s    [in] User input
        \param min  [in/out] Default range start
        \param max  [in/out] Default range end
        \param pos  [out] Position where parsing stopped if return value is false
        \return true iff input was completely valid, false otherwise (min,max unmodified, pos set) */
    bool parseRange(const String_t& s, int& min, int& max, String_t::size_type& pos);

    /** Parse a player character.
        Characters are '0'..'9' for players 0-9, 'a'-'z' (or 'A'-'Z') for 10-35.
        Typically not all values are valid players, it is up to the caller to decide.
        \param ch [in] User input
        \param number [out] Player number
        \return true if character was parsed correctly, false on error */
    bool parsePlayerCharacter(const char ch, int& number);

}

#endif