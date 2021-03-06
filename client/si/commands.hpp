/**
  *  \file client/si/commands.hpp
  */
#ifndef C2NG_CLIENT_SI_COMMANDS_HPP
#define C2NG_CLIENT_SI_COMMANDS_HPP

#include "game/session.hpp"
#include "interpreter/arguments.hpp"

namespace client { namespace si {

    class UserSide;
    class ScriptSide;
    class RequestLink1;

    void IFLoadResource(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);
    void IFLoadHelpFile(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);
    void IFMessageBox(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);
    void IFSystemExitClient(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);
    void IFSystemExitRace(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);

    void IFCCViewCombat(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);
    void IFCCViewInbox(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);

    void IFUIChooseObject(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);
    void IFUIChooseTurn(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);
    void IFUIEditAlliances(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);
    void IFUIEndDialog(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);
    void IFUIGotoScreen(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);
    void IFUIInput(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);
    void IFUIListShips(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);
    void IFUIMessage(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);
    void IFUIPopupConsole(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);
    void IFUIUpdate(game::Session& session, ScriptSide& si, RequestLink1 link, interpreter::Arguments& args);

    void registerCommands(UserSide& ui);

} }

#endif
