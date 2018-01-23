/**
  *  \file server/host/exec.cpp
  *  \brief Execution of Host/Master
  *
  *  FIXME: this is a very straight port and probably needs to be improved
  */

#include "server/host/exec.hpp"
#include "afl/base/ref.hpp"
#include "afl/bits/int16le.hpp"
#include "afl/bits/value.hpp"
#include "afl/except/fileproblemexception.hpp"
#include "afl/except/filetooshortexception.hpp"
#include "afl/io/constmemorystream.hpp"
#include "afl/io/directory.hpp"
#include "afl/io/directoryentry.hpp"
#include "afl/io/filesystem.hpp"
#include "afl/net/redis/stringfield.hpp"
#include "afl/string/format.hpp"
#include "afl/string/nulltranslator.hpp"
#include "afl/sys/mutexguard.hpp"
#include "afl/sys/thread.hpp"
#include "game/v3/resultfile.hpp"
#include "game/v3/structures.hpp"
#include "server/host/exporter.hpp"
#include "server/host/game.hpp"
#include "server/host/gamecreator.hpp"
#include "server/host/rank/levelhandler.hpp"
#include "server/host/rank/scorefilereader.hpp"
#include "server/host/rank/victory.hpp"
#include "server/host/resultsender.hpp"
#include "server/host/root.hpp"
#include "server/host/talkadapter.hpp"
#include "server/interface/baseclient.hpp"
#include "server/interface/filebaseclient.hpp"

using server::host::Game;
using server::interface::HostGame;
using server::interface::BaseClient;
using server::interface::FileBaseClient;

namespace {
    const char LOG_NAME[] = "host.exec";

    struct TurntimeFile {
        uint8_t timestamp[18];
        afl::bits::Value<afl::bits::Int16LE> turnNumber;
    };


    void doRunHost(util::ProcessRunner& runner, server::host::Root& root, String_t workDirectory, String_t gameDir, int32_t gameId, int32_t turnNumber)
    {
        // Wait before running host to avoid generating duplicate timestamps
        afl::sys::Thread::sleep(2000);

        // Build command line
        root.log().write(afl::sys::LogListener::Info, LOG_NAME, afl::string::Format("game %d: running host", gameId));

        util::ProcessRunner::Command cmd;
        cmd.command.push_back("/bin/sh");
        cmd.command.push_back("bin/runhost.sh");
        cmd.command.push_back(gameDir);
        cmd.command.push_back(afl::string::Format("%03d", turnNumber));
        cmd.workDirectory = workDirectory;

        // Run it
        String_t output;
        int32_t error = runner.run(cmd, output);
        if (error != 0) {
            String_t err = afl::string::Format("Host failed with error %d. Output follows:\n", error, output);
            throw std::runtime_error(err.c_str());
        }
    }


    /** Import scores for a game.
        \param file Host filer
        \param gameDir Game directory
        \param score Place scores in this hash
        \param description Description hash */
    void importGameScores(server::interface::FileBase& file,
                          String_t gameDir,
                          afl::net::redis::HashKey score,
                          afl::net::redis::HashKey description)
    {
        // ex planetscentral/host/import.cc:importGameScores
        using server::host::rank::Score_t;
        using server::host::rank::packScore;

        Score_t capital, freighters, planets, bases, timscore;

        /* Import scores from the result files. This is less work than
           parsing score.log. It is also less work than scanning
           bdata/pdata/ship.hst (which would mean that we also have to
           read auxdata.hst to handle remote control). However, we have to
           read *all* result files, because if score blanking is enabled,
           every player only sees his own score. */
        for (int i = 1; i <= Game::NUM_PLAYERS; ++i) {
            capital[i-1] = freighters[i-1] = planets[i-1] = bases[i-1] = timscore[i-1] = -1;

            // @change c2host-classic would ignore a result file that does not parse.
            // We will fail the import.
            afl::base::Optional<String_t> rstContent(file.getFileNT(afl::string::Format("%s/player%d.rst", gameDir, i)));
            if (const String_t* p = rstContent.get()) {
                afl::io::ConstMemoryStream ms(afl::string::toBytes(*p));
                afl::string::NullTranslator tx;
                game::v3::ResultFile rst(ms, tx);

                afl::io::Stream::FileSize_t pos;
                if (rst.getSectionOffset(rst.GenSection, pos)) {
                    ms.setPos(pos);
                    game::v3::structures::ResultGen gen;
                    ms.fullRead(afl::base::fromObject(gen));

                    const game::v3::structures::GenScore& sc = gen.scores[i-1];
                    capital[i-1]    = sc.numCapitalShips;
                    freighters[i-1] = sc.numFreighters;
                    planets[i-1]    = sc.numPlanets;
                    bases[i-1]      = sc.numBases;
                    timscore[i-1]   = 120*sc.numBases + 10*(sc.numCapitalShips + sc.numPlanets) + sc.numFreighters;
                }
            }
        }

        /* Store scores */
        score.stringField("capital").set(packScore(capital));
        score.stringField("freighters").set(packScore(freighters));
        score.stringField("planets").set(packScore(planets));
        score.stringField("bases").set(packScore(bases));
        score.stringField("timscore").set(packScore(timscore));
        description.stringField("capital").set(String_t());
        description.stringField("freighters").set(String_t());
        description.stringField("planets").set(String_t());
        description.stringField("bases").set(String_t());
        description.stringField("timscore").set(String_t());

        /* Read plug-in scores */
        afl::base::Optional<String_t> scoreFileContent = file.getFileNT(gameDir + "/c2score.txt");
        if (const String_t* p = scoreFileContent.get()) {
            afl::io::ConstMemoryStream ms(afl::string::toBytes(*p));
            server::host::rank::ScoreFileReader reader(score, description);
            reader.parseFile(ms);
            reader.flush();
        }
    }

    void respawnGame(server::host::Root& root, Game& game)
    {
        // Get the game this is a copy of
        int32_t copyOfId = game.getConfigInt("copyOf");
        if (!copyOfId) {
            return;
        }
        Game copyOf(root, copyOfId);

        // If this is a respawn cycle, get that Id
        int32_t newSourceId = copyOf.getConfigInt("copyNext");
        if (newSourceId == 0) {
            newSourceId = copyOfId;
        }
        Game newSource(root, newSourceId);

        // Finally, create the new game
        server::host::GameCreator creator(root);
        int32_t newId = creator.createNewGame();
        creator.copyGame(newSourceId, newId);
        creator.finishNewGame(newId, HostGame::Joining, game.getType());

        // Log
        root.log().write(afl::sys::LogListener::Info, LOG_NAME, afl::string::Format("game %d: respawned %d as copy of %d", game.getId(), newId, newSourceId));
    }

    int32_t unimportGameData(server::host::Root& root, Game& game)
    {
        // Remove bytime association (nobody will upload turns now anyway)
        String_t turnTime = game.getConfig("timestamp");
        root.gameRoot().subtree("bytime").intKey(turnTime).remove();

        return game.turnNumber().get();
    }

    void importGameData(server::host::Root& root, Game& game)
    {
        String_t gamedir = game.getDirectory();

        // Adapters
        FileBaseClient hostFile(root.hostFile());
        BaseClient(root.hostFile()).setUserContext(String_t());

        // The game has hosted, so, obviously, master has run and the game is running.
        // Also, we're starting a new turn for which host has not run.
        game.setConfigInt("masterHasRun", 1);
        game.setConfigInt("hostHasRun", 0);
        game.setState(HostGame::Running, root.getForum(), root);

        game.clearCache();

        // Check pending copy
        if (game.getConfigInt("copyPending")) {
            // For copying a game, we need database access, which we have.
            // We're not going to modify games, so we do not need to lock them,
            // even if there is an ongoing transaction on them.
            game.setConfigInt("copyPending", 0);
            try {
                respawnGame(root, game);
            }
            catch (std::exception& e) {
                // This handler will be hit if the game refers to a non-existant game as its copy-source.
                root.log().write(afl::sys::LogListener::Error, LOG_NAME, afl::string::Format("game %d: respawn failed, %s", game.getId(), e.what()));
            }
        }

        // Read timestamp and turn number
        String_t nextturnData = hostFile.getFile(gamedir + "/data/nextturn.hst");
        if (nextturnData.size() < sizeof(TurntimeFile)) {
            throw afl::except::FileTooShortException("nextturn.hst");
        }
        TurntimeFile nextturnFile;
        afl::base::fromObject(nextturnFile).copyFrom(afl::string::toBytes(nextturnData));

        String_t      turnTime(afl::string::fromBytes(nextturnFile.timestamp));
        const int16_t turnNr(nextturnFile.turnNumber);

        game.turnNumber().set(turnNr);
        game.setConfig("timestamp", turnTime);
        root.gameRoot().subtree("bytime").intKey(turnTime).set(game.getId());

        // Times
        server::Time_t now = root.getTime();
        game.lastHostTime().set(now);
        game.lastTurnSubmissionTime().set(0);

        // Track history:
        // - players
        Game::Turn turn(game.turn(turnNr));
        for (int32_t i = 1; i <= Game::NUM_PLAYERS; ++i) {
            turn.playerId().stringField(afl::string::Format("%d", i)).set(game.getSlot(i).players()[0]);
        }

        // - scores
        importGameScores(hostFile, gamedir + "/data", turn.scores(), game.scoreDescriptions());

        // - turn status; also reset turn status
        afl::bits::Value<afl::bits::Int16LE> turnStatus[Game::NUM_PLAYERS];
        String_t timScore = turn.scores().stringField("timscore").get();
        for (int i = 1; i <= Game::NUM_PLAYERS; ++i) {
            afl::net::redis::IntegerField statusField = game.getSlot(i).turnStatus();
            int32_t slotStatus = game.getSlot(i).slotStatus().get();
            int32_t status = statusField.get();
            if (timScore.size() >= size_t(i)*4
                && afl::bits::Int32LE::unpack(*reinterpret_cast<const afl::bits::Int32LE::Bytes_t*>(timScore.data() + 4*(i-1))) == 0)
            {
                statusField.set(Game::TurnDead);
            } else {
                statusField.set(Game::TurnMissing);
            }
            turnStatus[i-1] = int16_t(slotStatus ? status : -1);
        }
        turn.info().intField("time").set(now);
        turn.info().stringField("timestamp").set(turnTime);
        turn.info().stringField("turnstatus").set(afl::string::fromBytes(afl::base::fromObject(turnStatus)));

        // - victory check
        if (server::host::rank::checkVictory(root, gamedir + "/data", game)) {
            server::host::rank::computeGameRankings(root, game);
            game.setState(HostGame::Finished, root.getForum(), root);
        }

        // Reset filer: no longer needed in c2host-ng.
        // c2host-classic would call forgetDirectory() here.
        // Since we're using copy-in/copy-out, this is no longer required.
    }

    /** Import missing turns.
        \param runner ProcessRunner, used to check turns
        \param root Service root
        \param workdir Working directory in file system
        \param gameDir Game directory in host filer
        \param gameId Game Id
        \param slot Slot */
    void importMissingTurns(util::ProcessRunner& runner, server::host::Root& root, afl::io::Directory& workdir, String_t gameDir, int32_t gameId, int32_t slot)
    {
        // Look for players
        Game game(root, gameId, Game::NoExistanceCheck);
        Game::Slot gameSlot(game.getSlot(slot));
        afl::data::StringList_t players;
        {
            afl::sys::MutexGuard g(root.mutex());
            root.configureReconnect();
            int32_t existingState = gameSlot.turnStatus().get() & Game::TurnStateMask;
            if (existingState == Game::TurnYellow || existingState == Game::TurnGreen) {
                // Turn is there
                return;
            }
            game.listPlayers(slot, players);
        }

        // Fetch actual game directory in HostFile
        String_t hostFileDir = game.getDirectory();

        // When we're here, there is no turn, but we may have some players
        for (size_t i = 0; i < players.size(); ++i) {
            afl::sys::MutexGuard g(root.mutex());
            root.configureReconnect();

            // Check whether user has a game directory configured
            // FIXME: should work backwards! current player is last on list!
            String_t userGameDir = game.getPlayerConfig(players[i], "gameDir");
            if (userGameDir.empty()) {
                continue;
            }

            // Check whether user has a turn file
            try {
                // Load from userfile
                root.tryCloseRouterSessions(afl::string::Format("WDIR=%s", userGameDir));
                BaseClient(root.userFile()).setUserContext(players[i]);
                String_t trnData = FileBaseClient(root.userFile()).getFile(afl::string::Format("%s/player%d.trn", userGameDir, slot));

                root.log().write(afl::sys::LogListener::Info, LOG_NAME, afl::string::Format("game %d: trying turn from 'user:%s'", game.getId(), userGameDir));

                // Store on hostfile
                BaseClient(root.hostFile()).setUserContext(players[i]);
                FileBaseClient(root.hostFile()).putFile(afl::string::Format("%s/in/new/player%d.trn", hostFileDir, slot), trnData);

                // Store in workdir
                workdir.openFile(afl::string::Format("%s/in/new/player%d.trn", gameDir, slot), afl::io::FileSystem::Create)->fullWrite(afl::string::toBytes(trnData));

                // Run checkturn
                util::ProcessRunner::Command cmd;
                cmd.command.push_back("/bin/sh");
                cmd.command.push_back("bin/checkturn.sh");
                cmd.command.push_back(gameDir);
                cmd.command.push_back(afl::string::Format("%d", slot));
                cmd.workDirectory = workdir.getDirectoryName();
                String_t output;
                int32_t code = runner.run(cmd, output);
                int32_t newState = (code + 1);
                if (newState == Game::TurnGreen || newState == Game::TurnYellow) {
                    // Success!
                    root.log().write(afl::sys::LogListener::Info, LOG_NAME, afl::string::Format("game %d: turn file from 'user:%s' succeeded", game.getId(), userGameDir));
                    gameSlot.turnStatus().set(newState);

                    // Do not update replacements. We're currently sweeping together fragments
                    // of a partially played turn to minimize damages, so don't damage things
                    // even more by changing subscriptions. Plus, it'd be quite a nightmare to
                    // start messing around with subscriptions at this point, which would also
                    // update game directories beneath our back.
                    break;
                }
            }
            catch (...) {
                // Ignore any errors
            }
        }
    }

    /** Process an unplayed slot.
        This gives penalties to the players who abandoned the slot.
        \param game Game to work on
        \param slot Slot number
        \param playerValues [in/out] Place players in this map (any value does); used for processing updates
        \param hdl LevelHandler */
    void processUnplayedSlot(Game& game, const int slot, std::map<String_t, uint32_t>& playerValues, server::host::rank::LevelHandler& hdl)
    {
        /* We want 3 unplayed turns. */
        const int32_t DROPOUT_DELAY = 3;

        /* Note that this is run when the game still points to the previous turn.
           We know that the current turn is unplayed. We require this situation:


           -2         played
           -1         unplayed    \
           -0         unplayed     > DROPOUT_DELAY
           [current   unplayed]   /

           If there are fewer unplayed slots, it's not yet time for a penalty.
           If there are more unplayed slots, the penalty has already been given. */
        int32_t turn = game.turnNumber().get();

        // Do we have room?
        if (turn < DROPOUT_DELAY) {
            return;
        }

        // Do we have unplayed slots?
        String_t slotName(afl::string::Format("%d", slot));
        for (int i = 0; i < DROPOUT_DELAY-1; ++i) {
            String_t player = game.turn(turn - i).playerId().stringField(slotName).get();
            if (!player.empty()) {
                return;
            }
        }

        // We must now find a played slot
        String_t player = game.turn(turn - (DROPOUT_DELAY-1)).playerId().stringField(slotName).get();
        if (player.empty()) {
            return;
        }

        // This player took the arschkarte and gets penalized
        hdl.handlePlayerDrop(player, game, slot);
        playerValues[player] = 0;
    }

    void processTurnStatus(server::host::Root& root, int32_t gameId)
    {
        Game game(root, gameId, Game::NoExistanceCheck);

        // No ranking if it is disabled or this is a test game
        if (game.isRankingDisabled()) {
            return;
        }

        std::map<String_t, uint32_t> playerValues;
        const uint32_t nil = uint32_t(-1);

        game::PlayerSet_t unplayedSlots;

        // Process all slots
        for (int slot = 1; slot <= Game::NUM_PLAYERS; ++slot) {
            // Get status and players
            int32_t state = game.getSlot(slot).turnStatus().get() & Game::TurnStateMask;
            afl::data::StringList_t players;
            game.listPlayers(slot, players);

            if (players.empty()) {
                // Slot is unplayed. If it is still open, remember for later.
                if (game.getSlot(slot).slotStatus().get() != 0) {
                    unplayedSlots += slot;
                }
            } else {
                // Collect player values. Backwards, current player is last of list!
                for (size_t i = 0; i < players.size(); ++i) {
                    const String_t& thisPlayer = players[players.size()-1-i];
                    const uint32_t thisPlayerValue = (state == Game::TurnGreen || state == Game::TurnYellow || state == Game::TurnDead) ? nil : uint32_t(i);

                    // Player gets maximum possible penalty earned this turn. Maximum possible
                    // penalty is thisPlayerValue=0 (missed a turn as primary player), minimum
                    // is nil (submitted a turn). Thus we're looking for the minimum thisPlayerValue.
                    std::map<String_t, uint32_t>::iterator it = playerValues.find(thisPlayer);
                    if (it != playerValues.end()) {
                        it->second = std::min(it->second, thisPlayerValue);
                    } else {
                        playerValues.insert(std::make_pair(thisPlayer, thisPlayerValue));
                    }
                }
            }
        }

        // Process turn submission reliability changes
        server::host::rank::LevelHandler hdl(root);
        for (std::map<String_t, uint32_t>::const_iterator it = playerValues.begin(); it != playerValues.end(); ++it) {
            if (it->second != nil) {
                // Miss
                hdl.handlePlayerTurn(it->first, false, it->second);
            } else {
                // Submit
                hdl.handlePlayerTurn(it->first, true, 0);
            }
        }

        // Check unplayed slots.
        for (int slot = 1; slot <= Game::NUM_PLAYERS; ++slot) {
            // Slot must be unplayed
            if (unplayedSlots.contains(slot)) {
                processUnplayedSlot(game, slot, playerValues, hdl);
            }
        }

        // Process rank changes
        for (std::map<String_t, uint32_t>::const_iterator it = playerValues.begin(); it != playerValues.end(); ++it) {
            hdl.handlePlayerRankChanges(it->first);
        }
    }
}

// Run host on a game.
void
server::host::runHost(util::ProcessRunner& runner, Root& root, int32_t gameId)
{
    // ex planetscentral/host/exec.h:runHost

    // Build base directory
    afl::base::Ref<afl::io::DirectoryEntry> workdirEntry =
        root.fileSystem().openDirectory(root.config().workDirectory)->getDirectoryEntryByName("host");
    try {
        workdirEntry->createAsDirectory();
    }
    catch (std::exception&)
    { }
    afl::base::Ref<afl::io::Directory> workdir = workdirEntry->openDirectory();

    // Export environment
    String_t gameDir;
    int32_t turnNr;
    {
        afl::sys::MutexGuard g(root.mutex());
        root.configureReconnect();
        Game game(root, gameId, Game::NoExistanceCheck);
        turnNr = unimportGameData(root, game);
        gameDir = Exporter(root.hostFile(), root.fileSystem(), root.log()).exportGame(game, root, workdirEntry->getPathName());
    }

    // Locate missing turns
    // FIXME: should come before export so it does not have to maintain two copies
    for (int32_t i = 1; i <= Game::NUM_PLAYERS; ++i) {
        importMissingTurns(runner, root, *workdir, gameDir, gameId, i);
    }
    BaseClient(root.hostFile()).setUserContext(String_t());

    // Run host
    doRunHost(runner, root, workdirEntry->getPathName(), gameDir, gameId, turnNr+1);

    // Re-import VGAP data
    {
        afl::sys::MutexGuard g(root.mutex());
        root.configureReconnect();
        Game game(root, gameId, Game::NoExistanceCheck);
        Exporter(root.hostFile(), root.fileSystem(), root.log()).importGame(game, root, workdirEntry->getPathName());
        processTurnStatus(root, gameId);
        importGameData(root, game);
        ResultSender(root, game).sendAllResults();
    }

    root.log().write(afl::sys::LogListener::Info, LOG_NAME, afl::string::Format("game %d: host completed", gameId));
}

// Run master on a game.
void
server::host::runMaster(util::ProcessRunner& runner, Root& root, int32_t gameId)
{
    // ex planetscentral/host/exec.h:runMaster
    // Build base directory
    afl::base::Ref<afl::io::DirectoryEntry> workdirEntry =
        root.fileSystem().openDirectory(root.config().workDirectory)->getDirectoryEntryByName("host");
    try {
        workdirEntry->createAsDirectory();
    }
    catch (std::exception&)
    { }

    // Export environment
    String_t gameDir;
    {
        afl::sys::MutexGuard g(root.mutex());
        root.configureReconnect();
        Game game(root, gameId, Game::NoExistanceCheck);
        gameDir = Exporter(root.hostFile(), root.fileSystem(), root.log()).exportGame(game, root, workdirEntry->getPathName());
    }

    // Run it
    {
        root.log().write(afl::sys::LogListener::Info, LOG_NAME, afl::string::Format("game %d: running master", gameId));

        util::ProcessRunner::Command cmd;
        cmd.command.push_back("/bin/sh");
        cmd.command.push_back("bin/runmaster.sh");
        cmd.command.push_back(gameDir);
        cmd.workDirectory = workdirEntry->getPathName();

        String_t output;
        int32_t error = runner.run(cmd, output);
        if (error != 0) {
            String_t err = afl::string::Format("Master failed with error %d. Output follows:\n%s", error, output);
            throw std::runtime_error(err.c_str());
        }
    }

    // OK, proceed with running host
    doRunHost(runner, root, workdirEntry->getPathName(), gameDir, gameId, 1);

    // Re-import VGAP data
    {
        afl::sys::MutexGuard g(root.mutex());
        root.configureReconnect();
        Game game(root, gameId, Game::NoExistanceCheck);
        Exporter(root.hostFile(), root.fileSystem(), root.log()).importGame(game, root, workdirEntry->getPathName());
        importGameData(root, game);
        ResultSender(root, game).sendAllResults();
    }

    root.log().write(afl::sys::LogListener::Info, LOG_NAME, afl::string::Format("game %d: master completed", gameId));
}
