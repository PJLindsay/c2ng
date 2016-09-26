/**
  *  \file game/timestamp.hpp
  */
#ifndef C2NG_GAME_TIMESTAMP_HPP
#define C2NG_GAME_TIMESTAMP_HPP

#include <cstring>
#include "afl/base/types.hpp"
#include "afl/string/string.hpp"

namespace game {

    /** Timestamp.
        This class contains a VGAP host timestamp and operations to work with it.
        Timestamps are used at multiple places to identify turns.
        We use the classic VGAP format everywhere even if the host has a different format. */
    class Timestamp {
     public:
        static const size_t SIZE = 18;

        typedef char (&Data_t)[SIZE];
        typedef const char (&ConstData_t)[SIZE];

        /** Construct from binary representation.
            Makes a timestamp from an 18-byte ASCII timestamp field. */
        Timestamp(ConstData_t data);

        /** Construct from parts. */
        Timestamp(int year, int month, int day,
                  int hour, int minute, int second);

        /** Construct empty timestamp. */
        Timestamp();

        /** Get whole timestamp (18 characters) as string.
            Note that although timestamps usually do not contain high-ASCII characters,
            this may produce UTF-8 characters if the original timestamp contains characters outside the valid range.
            Callers expect to receive valid UTF-8 from us. */
        String_t getTimestampAsString() const;

        /** Get time (8 characters, hh:mm:ss) as string.
            \see getTimestampAsString */
        String_t getTimeAsString() const;

        /** Get date (10 characters, mm-dd-yyyy) as string.
            \see getTimestampAsString */
        String_t getDateAsString() const;

        /** Get raw data. */
        ConstData_t getRawData() const;

        /** Store raw data in data field (array of 18 chars).
            \param out data goes here */
        void storeRawData(Data_t data) const;

        bool operator==(const Timestamp& rhs) const;
        bool operator==(ConstData_t rhs) const;
        bool operator!=(const Timestamp& rhs) const;
        bool operator!=(ConstData_t rhs) const;

        /** Compare two timestamps.
            \return true if this timestamp is earlier than the other. */
        bool isEarlierThan(const Timestamp& rhs) const;

        // FIXME: remove. Unsafe prototype and doesn't seem to be used in PCC2 (only un-trn).
        //     void copyFrom(const char* p)
        //         { std::memcpy(this->data, p, SIZE); }

        /** Check validity.
            A timestamp is valid if it is not the null timestamp (default constructor). */
        bool isValid() const;
        
     private:
        char m_data[SIZE];
    };

}

#endif