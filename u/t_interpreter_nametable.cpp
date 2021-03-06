/**
  *  \file u/t_interpreter_nametable.cpp
  *  \brief Test for interpreter::NameTable
  */

#include <cstdio>               // sprintf
#include "interpreter/nametable.hpp"

#include "t_interpreter.hpp"

/** Test lookupName(). */
void
TestInterpreterNameTable::testLookup()
{
    static const interpreter::NameTable tab[] = {
        { "B", 0, 0, 0 },
        { "C", 0, 0, 0 },
        { "D", 0, 0, 0 },
        { "E", 0, 0, 0 },
        { "F", 0, 0, 0 },
        { "G", 0, 0, 0 },
        { "H", 0, 0, 0 },
        { "I", 0, 0, 0 },
        { "J", 0, 0, 0 },
        { "K", 0, 0, 0 },
    };
    const size_t SIZE = sizeof(tab) / sizeof(tab[0]);

    static const char*const failTab[] = {
        "A",
        "B1",
        "F1",
        "K1",
        "Z"
    };

    typedef afl::base::Memory<const interpreter::NameTable> NameTable_t;
    for (size_t start = 0; start < SIZE; ++start) {
        for (size_t end = start; end < SIZE; ++end) {
            // Test all elements in the table; they must be found correctly
            interpreter::Context::PropertyIndex_t index;
            for (size_t i = 0; i < SIZE; ++i) {
                char testCaseName[100];
                std::sprintf(testCaseName, "'%s' in [%d,%d)", tab[i].name, int(start), int(end));
                // int32_t result = interpreter::lookupName(tab[i].name, &tab[start], end - start);
                if (i < start || i >= end) {
                    TSM_ASSERT(testCaseName, !interpreter::lookupName(tab[i].name, NameTable_t(tab).subrange(start, end - start), index));
                } else {
                    TSM_ASSERT(testCaseName, interpreter::lookupName(tab[i].name, NameTable_t(tab).subrange(start, end - start), index));
                    TSM_ASSERT_EQUALS(testCaseName, index, i - start);
                }

            }

            // Test elements that should not be found
            for (size_t i = 0; i < sizeof(failTab)/sizeof(failTab[0]); ++i) {
                char testCaseName[100];
                std::sprintf(testCaseName, "'%s' in [%d,%d)", tab[i].name, int(start), int(end));
                TSM_ASSERT(testCaseName, !interpreter::lookupName(failTab[i], NameTable_t(tab).subrange(start, end - start), index));
            }
        }
    }
}
