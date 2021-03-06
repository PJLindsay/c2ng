/**
  *  \file game/turnloader.hpp
  */
#ifndef C2NG_GAME_TURNLOADER_HPP
#define C2NG_GAME_TURNLOADER_HPP

#include "afl/base/deletable.hpp"
#include "afl/base/refcounted.hpp"
#include "afl/bits/smallset.hpp"
#include "afl/charset/charset.hpp"
#include "afl/string/translator.hpp"
#include "game/playerset.hpp"

namespace game {

    class Turn;
    class Game;
    class Root;
    class Session;

    class TurnLoader : public afl::base::Deletable, public afl::base::RefCounted {
     public:
        enum PlayerStatus {
            /** This player's data is available.
                This bit must be set for this player to be accessible.
                If it is not set, other bits are ignored. */
            Available,

            /** This player's data is playable.
                If it is not set, data is only viewable (historic/finished game or alliance data, maybe). */
            Playable,

            /** This is primary data.
                The idea is to point out the default data to load.
                It does not otherwise affect us.
                An example use would be that this is the player's primary race whereas the others are allies. */
            Primary
        };
        typedef afl::bits::SmallSet<PlayerStatus> PlayerStatusSet_t;


        enum HistoryStatus {
            /** History is known to not be available. */
            Negative,

            /** We are optimistic that history is available, but verifying it would be very expensive.
                For example: we need network access to verify it. */
            WeaklyPositive,

            /** We are certain that history is available.
                For example: we checked that the required files exist. */
            StronglyPositive
        };

        enum Property {
            LocalFileFormatProperty,
            RemoteFileFormatProperty,
            RootDirectoryProperty
        };

        /** Get player status.
            Valid player numbers can be taken from the PlayerList.
            If an invalid player number is passed in, this function must return an empty status and empty \c extra.

            Note that "valid player number" means that this number theoretically exists, not that it exists now.
            A VGAP3 game with, say, a current player7.rst and a previous player3.rst will report player 3 as unavailable
            (empty status), but player 3 is on the PlayerList, and TurnLoader can still produce a helpful message in \c extra.

            \param player [in] Player to inquiry.
            \param extra [out] Extra information. Free-form text to describe this player's data (e.g. "RST", "RST+TRN", "Conflict").
            \param tx [in] Translator used to create the \c extra field.
            \return player status */
        virtual PlayerStatusSet_t getPlayerStatus(int player, String_t& extra, afl::string::Translator& tx) const = 0;

        /** Load current turn.

            The resulting playability game's status will be set by the caller.

            \param turn [out] Turn to load. Should be completely initialized.
            \param game [in/out] Game object. May be updated with planet/ship score definitions, turn scores.
            \param player [in] Player number.
            \param root [in/out] Root. May be updated with configuration. */
        virtual void loadCurrentTurn(Turn& turn, Game& game, int player, Root& root, Session& session) = 0;

        /** Save current turn.
            This will save the current game, create and/or upload a turn file, etc.
            This function must honor read/write mode restrictions defined by session.getEditableAreas().

            \param turn [in] Turn to save.
            \param game [in] Game object.
            \param player [in] Player number.
            \param root [in] Root. */
        virtual void saveCurrentTurn(Turn& turn, Game& game, int player, Root& root, Session& session) = 0;

        /** Get history status.
            This function determines whether a number of turns have history information.

            Multiple turns can be queried at once.
            The \c status parameter provides room for one or more turns.
            It will be populated with status for this turn and following ones.

            \param player [in] Player number.
            \param turn [in] First turn number to inquire.
            \param status [out] Status goes here
            \param root [in] Root FIXME: change to UserConfiguration? */
        virtual void getHistoryStatus(int player, int turn, afl::base::Memory<HistoryStatus> status, const Root& root) = 0;

        /** Load history turn.
            \param turn [out] Target turn object
            \param game [in] Game object. May be updated with planet/ship score definitions, turn scores.
            \param player [in] Player number
            \param turnNumber [in] Turn number
            \param root [in] Root object. Should not need updating.

            If this function fails to load history data, it can throw an exception.
            Caller must deal with that. */
        virtual void loadHistoryTurn(Turn& turn, Game& game, int player, int turnNumber, Root& root) = 0;

        virtual String_t getProperty(Property p) = 0;


        /*
         *  Utility Methods
         */

        /** Pick default player.
            Chooses a default player if there is one for this situation.
            \param baseSet set of players to check; pass in PlayerList::getAllPlayers().
            \return default player number if there is one; 0 if there is none or it's ambiguous */
        int getDefaultPlayer(PlayerSet_t baseSet) const;

     protected:
        /** Load current turn databases.
            This method should be called by the loadCurrentTurn() method, with the same parameters,
            to load the databases that are common to all versions:
            - starchart (chartX.cc)
            - scores (scoreX.cc)
            FIXME: script VM? probably not here. */
        void loadCurrentDatabases(Turn& turn, Game& game, int player, Root& root, Session& session, afl::charset::Charset& charset);

        /** Load history turn databases.
            This method should be called by the loadHistoryTurn() method, with the same parameters,
            to load the databases that are common to all versions:
            - starchart (chartX.cc)
            - scores (scoreX.cc) */
        void loadHistoryDatabases(Turn& turn, Game& game, int player, int turnNumber, Root& root, afl::charset::Charset& charset);

        void saveCurrentDatabases(Turn& turn, Game& game, int player, Root& root, Session& session, afl::charset::Charset& charset);
    };

}

#endif
