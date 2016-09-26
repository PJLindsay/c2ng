/**
  *  \file client/si/commands.cpp
  */

#include "client/si/commands.hpp"
#include "client/si/control.hpp"
#include "client/si/requestlink1.hpp"
#include "client/si/requestlink2.hpp"
#include "client/si/scriptprocedure.hpp"
#include "client/si/scriptside.hpp"
#include "client/si/userside.hpp"
#include "client/si/usertask.hpp"
#include "interpreter/arguments.hpp"
#include "interpreter/values.hpp"
#include "ui/dialogs/messagebox.hpp"
#include "ui/widgets/inputline.hpp"
#include "util/translation.hpp"
#include "game/interface/richtextvalue.hpp"
#include "game/interface/richtextfunctions.hpp"
#include "util/rich/text.hpp"
#include "afl/base/optional.hpp"
#include "client/dialogs/objectselectiondialog.hpp"
#include "game/game.hpp"
#include "game/exception.hpp"
#include "util/rich/parser.hpp"
#include "afl/string/string.hpp"
#include "afl/charset/utf8.hpp"
#include "game/map/objecttype.hpp"
#include "client/dialogs/turnlistdialog.hpp"

using client::si::UserTask;
using client::si::UserSide;
using client::si::Control;
using client::si::OutputState;
using client::si::RequestLink1;
using client::si::RequestLink2;
using client::si::ScriptSide;

namespace {
    class StateChangeTask : public UserTask {
     public:
        StateChangeTask(OutputState::Target target)
            : m_target(target)
            { }
        void handle(UserSide& ui, Control& ctl, RequestLink2 link)
            { ctl.handleStateChange(ui, link, m_target); }
     private:
        OutputState::Target m_target;
    };

    class PopupConsoleTask : public UserTask {
     public:
        PopupConsoleTask()
            { }
        void handle(UserSide& ui, Control& ctl, RequestLink2 link)
            { ctl.handlePopupConsole(ui, link); }
    };

    class MessageBoxTask : public UserTask {
     public:
        MessageBoxTask(game::interface::RichTextValue::Ptr_t pContent, String_t heading)
            : m_content(*pContent), m_heading(heading)
            { }
        MessageBoxTask(util::rich::Text content, String_t heading)
            : m_content(content), m_heading(heading)
            { }
        void handle(UserSide& ui, Control& ctl, RequestLink2 link)
            {
                ui::dialogs::MessageBox(m_content, m_heading, ctl.root()).doOkDialog();
                ui.continueProcess(link);
            }
     private:
        util::rich::Text m_content;
        String_t m_heading;
    };

    void enterScreen(int screen, OutputState::Target target, int32_t obj, game::Session& session, ScriptSide& si, RequestLink1 link)
    {
        if (session.getGame().get() == 0) {
            throw game::Exception(game::Exception::eUser);
        }
        if (obj != 0) {
            game::map::ObjectType* ty = session.getGame()->cursors().getTypeByNumber(screen);
            if (!ty || ty->getObjectByIndex(obj) == 0) {
                throw interpreter::Error::rangeError();
            }
            game::map::ObjectCursor* cu = session.getGame()->cursors().getCursorByNumber(screen);
            if (!cu) {
                throw interpreter::Error::rangeError();
            }
            cu->setCurrentIndex(obj);
        }

        // Do it
        si.postNewTask(link, new StateChangeTask(target));
    }

    // /* @q MessageBox text:Str, Optional heading:Str (Global Command)
    //    Display a message.
    //    In the graphical interface, displays an "OK" message box.
    //    In console mode, just prints out a message and continues.
    //    @see UI.Message
    //    @since PCC 1.0.6, PCC2 1.99.9 */
    // \change c2ng accepts rich text as text.
    void doMessageBox(game::Session& /*session*/, client::si::ScriptSide& si, client::si::RequestLink1 link, interpreter::Arguments& args)
    {
        // Validate arguments
        args.checkArgumentCount(1, 2);

        game::interface::RichTextValue::Ptr_t pContent;
        String_t heading = _("Message");
        if (!game::interface::checkRichArg(pContent, args.getNext())) {
            return;
        }
        interpreter::checkStringArg(heading, args.getNext());

        // Do it
        si.postNewTask(link, new MessageBoxTask(pContent, heading));
    }

    // /* @q System.ExitClient (Global Command)
    // Leave PCC2.
    // Saves the game and closes the program.
    // This command will also terminate the current process (as if the {End} command had been used).
    // @since PCC2 1.99.26 */
    void doSystemExitClient(game::Session& /*session*/, client::si::ScriptSide& si, client::si::RequestLink1 link, interpreter::Arguments& args)
    {
        // ex IFSystemExitClient
        args.checkArgumentCount(0);
        si.postNewTask(link, new StateChangeTask(OutputState::ExitProgram));
    }

    // /* @q System.ExitRace (Global Command)
    //    Leave current race.
    //    Saves the game and returns to the <a href="pcc2:gamesel">game selection</a> menu.
    //    @since PCC2 1.99.10 */
    void doSystemExitRace(game::Session& /*session*/, client::si::ScriptSide& si, client::si::RequestLink1 link, interpreter::Arguments& args)
    {
        // ex IFSystemExitRace
        args.checkArgumentCount(0);
        si.postNewTask(link, new StateChangeTask(OutputState::ExitGame));
    }

// /* @q UI.ChooseObject screen:Int (Global Command)
//    Choose game object.
//    You specify a screen number to choose the object for:
//    <table>
//     <tr><td width="4">1, 11</td><td width="10">Own starships</td></tr>
//     <tr><td width="4">2, 12</td><td width="10">Own planets</td></tr>
//     <tr><td width="4">3, 13</td><td width="10">Own starbases</td></tr>
//     <tr><td width="4">6</td>    <td width="10">History starships</td></tr>
//     <tr><td width="4">10</td>   <td width="10">Fleets</td></tr>
//    </table>

//   For example, <tt>UI.ChooseObject 1</tt> does the same as the <kbd>F1</kbd> key in most screens.
//   When there is just one ship, no dialog is displayed.

//   The chosen object Id is returned in {UI.Result}; the result is
//   EMPTY if the user canceled.
//   This command does not work in text mode.

//   @since PCC 1.1.1, PCC2 1.99.9 */
    void doUIChooseObject(game::Session& session, client::si::ScriptSide& si, client::si::RequestLink1 link, interpreter::Arguments& args)
    {
        class Task : public UserTask {
         public:
            Task(const client::dialogs::ObjectSelectionDialog& def)
                : m_def(def)
                { }
            void handle(UserSide& iface, Control& ctl, RequestLink2 link)
                {
                    // Perform dialog
                    OutputState out;
                    int n = client::dialogs::doObjectSelectionDialog(m_def, iface, ctl, out);

                    // Produce result for calling process
                    std::auto_ptr<afl::data::Value> result;
                    if (n != 0) {
                        result.reset(interpreter::makeIntegerValue(n));
                    }
                    iface.setVariable(link, "UI.RESULT", result);

                    // Finish
                    // - if out has no process, joinProcess() is a no-op
                    // - if out has no target, handleStateChange() will just resume
                    iface.joinProcess(link, out.getProcess());
                    ctl.handleStateChange(iface, link, out.getTarget());
                }
         private:
            const client::dialogs::ObjectSelectionDialog& m_def;
        };

        // Parse args
        int32_t screen;
        args.checkArgumentCount(1);
        if (!interpreter::checkIntegerArg(screen, args.getNext())) {
            return;
        }

        const client::dialogs::ObjectSelectionDialog* def;
        switch (screen) {
         case 1:
         case 11:
            def = &client::dialogs::SHIP_SELECTION_DIALOG;
            break;

         case 2:
         case 12:
            def = &client::dialogs::PLANET_SELECTION_DIALOG;
            break;

         case 3:
         case 13:
            def = &client::dialogs::BASE_SELECTION_DIALOG;
            break;

//      case 6:
//         /* This needs a GPoint. iuiChartX is always valid even on the player screen,
//            unless we're on a control screen of an object that has no position, where
//            it returns EMPTY. We want it to be 0 for invalid positions, and on the player
//            screen, where there is no user-perceived valid position. */
//         {
//             IntUserInterfaceBinding& ui = IntUserInterfaceBinding::get();
//             std::auto_ptr<IntValue> vx(ui.getProperty(iuiChartX));
//             std::auto_ptr<IntValue> vy(ui.getProperty(iuiChartY));
//             std::auto_ptr<IntValue> vs(ui.getProperty(iuiScreenNumber));
//             int32_t x, y, screen;
//             if (checkIntArg(x, vx.get()) && checkIntArg(y, vy.get()) && checkIntArg(screen, vs.get()) && screen > 0) {
//                 result = chooseHistoryShip(GPoint(x, y));
//             } else {
//                 result = chooseHistoryShip(GPoint(0, 0));
//             }
//         }
//         break;
//      case 10:
//         result = chooseFleet();
//         break;

         default:
            def = 0;
        }

        if (!def) {
            throw interpreter::Error::rangeError();
        }

        if (game::Game* g = session.getGame().get()) {
            game::map::ObjectCursor* c = g->cursors().getCursorByNumber(def->screenNumber);
            if (c == 0 || c->getCurrentIndex() == 0) {
                // No ship selected means no ship present; clear UI.Result and show a message
                link.getProcess().setVariable("UI.RESULT", 0);
                si.postNewTask(link, new MessageBoxTask(util::rich::Parser::parseXml(_(def->failMessageUT)), _(def->titleUT)));
            } else {
                game::map::ObjectType* ty = c->getObjectType();
                if (ty != 0 && ty->isUnit()) {
                    // We have only one of this kind. Do not show a dialog; directly select it.
                    std::auto_ptr<afl::data::Value> result(interpreter::makeIntegerValue(c->getCurrentIndex()));
                    link.getProcess().setVariable("UI.RESULT", result.get());
                } else {
                    // Regular task
                    si.postNewTask(link, new Task(*def));
                }
            }
        } else {
            throw game::Exception(game::Exception::eUser, _("No race loaded"));
        }
    }

// /* @q UI.ChooseTurn [delta:Int] (Global Command)
//    Choose a turn from the game history.
//    You can optionally specify an initial scroll position (e.g. -1 to place the cursor on the previous turn).

//    The chosen turn number is returned in {UI.Result}; the result is EMPTY if the user canceled.
//    This command does not work in text mode.

//    @since PCC2 2.40 */
    void doUIChooseTurn(game::Session& session, client::si::ScriptSide& si, client::si::RequestLink1 link, interpreter::Arguments& args)
    {
        class Task : public UserTask {
         public:
            Task(int delta)
                : m_delta(delta)
                { }
            void handle(UserSide& iface, Control& ctl, RequestLink2 link)
                {
                    // Execute dialog
                    int n = client::dialogs::TurnListDialog(ctl.root(), ctl.translator(), iface.gameSender(), m_delta).run();

                    // Produce result for calling process
                    std::auto_ptr<afl::data::Value> result;
                    if (n != 0) {
                        result.reset(interpreter::makeIntegerValue(n));
                    }
                    iface.setVariable(link, "UI.RESULT", result);

                    // Finish
                    iface.continueProcess(link);
                }
         private:
            const int m_delta;
        };

        // Parse args
        int32_t delta = 0;
        args.checkArgumentCount(0, 1);
        interpreter::checkIntegerArg(delta, args.getNext());

        if (session.getGame().get() != 0) {
            // Regular task
            si.postNewTask(link, new Task(delta));
        } else {
            throw game::Exception(game::Exception::eUser, _("No race loaded"));
        }
    }

    /* @q UI.EndDialog Optional code:Int (Global Command)
       Closes the dialog if there currently is one open.
       If there is no dialog, this command is ignored.

       The optional %code parameter specifies the return code for the dialog.
       Typical values are 0=cancel, 1=ok.

       @since PCC2 2.40 */
    void doUIEndDialog(game::Session& /*session*/, client::si::ScriptSide& si, client::si::RequestLink1 link, interpreter::Arguments& args)
    {
        // Read arguments
        int32_t code = 0;
        args.checkArgumentCount(0, 1);
        interpreter::checkIntegerArg(code, args.getNext(), 0, 10000);

        // Do it
        class EndTask : public UserTask {
         public:
            EndTask(int code)
                : m_code(code)
                { }
            void handle(UserSide& ui, Control& ctl, RequestLink2 link)
                { ctl.handleEndDialog(ui, link, m_code); }
         private:
            int m_code;
        };
        si.postNewTask(link, new EndTask(code));
    }


    // /* @q UI.GotoScreen screen:Int, Optional id:Int (Global Command)
    //    Go to control screen.
    //    This command activates the specified screen.
    //    If the %id is specified and valid, shows that object.

    //    <table>
    //     <tr><th width="2">Id</th><th width="20" align="left">Screen</th></tr>
    //     <tr><td>0</td> <td><a href="pcc2:racescreen">Race screen</a>. You can not specify an %id here.</td></tr>
    //     <tr><td>1</td> <td><a href="pcc2:shipscreen">Ship screen</a>. %id is a ship Id.</td></tr>
    //     <tr><td>2</td> <td><a href="pcc2:planetscreen">Planet screen</a>. %id is a planet Id.</td></tr>
    //     <tr><td>3</td> <td><a href="pcc2:basescreen">Starbase screen</a>. %id is a starbase Id.</td></tr>
    //     <tr><td>4</td> <td><a href="pcc2:starchart">Starchart</a>. You can not specify an %id here. Also see {UI.GotoChart}.</td></tr>
    //     <tr><td>6</td> <td><a href="pcc2:historyscreen">Starship history</a>. %id is a ship Id.</td></tr>
    //     <tr><td>10</td><td><a href="pcc2:fleetscreen">Fleet screen</a>. %id is a fleet Id.</td></tr>
    //     <tr><td>11</td><td><a href="pcc2:shiptaskscreen">Ship auto task screen</a>. %id is a ship Id.</td></tr>
    //     <tr><td>12</td><td><a href="pcc2:planettaskscreen">Planet auto task screen</a>. %id is a planet Id.</td></tr>
    //     <tr><td>13</td><td><a href="pcc2:basetaskscreen">Starbase auto task screen</a>. %id is a starbase Id.</td></tr>
    //    </table>

    //    Note that this command will have immediate effect.
    //    It will suspend your script temporarily, switch to the new screen, and resume.

    //    @see UI.GotoChart
    //    @since PCC 1.0.14, PCC2 1.99.10 */
    void doUIGotoScreen(game::Session& session, client::si::ScriptSide& si, client::si::RequestLink1 link, interpreter::Arguments& args)
    {
        // ex IFUIGotoScreen
        // Read arguments
        args.checkArgumentCount(1, 2);
        int32_t screen = 0;
        int32_t obj = 0;
        if (!interpreter::checkIntegerArg(screen, args.getNext(), 0, 20)) { // FIXME: magic number
            return;
        }

        // If second argument is specified but empty, ignore command!
        if (args.getNumArgs() > 0 && !interpreter::checkIntegerArg(obj, args.getNext(), 0, 10000)) { // FIXME: magic number
            return;
        }

        switch (screen) {
         case 0:
            si.postNewTask(link, new StateChangeTask(OutputState::PlayerScreen));
            break;

         case 1:
            enterScreen(game::map::Cursors::ShipScreen, OutputState::ShipScreen, obj, session, si, link);
            break;

         case 2:
            enterScreen(game::map::Cursors::PlanetScreen, OutputState::PlanetScreen, obj, session, si, link);
            break;

         case 3:
            enterScreen(game::map::Cursors::BaseScreen, OutputState::BaseScreen, obj, session, si, link);
            break;

         default:
            throw interpreter::Error::rangeError();
        }
    }

    // /* @q UI.Input prompt:Str, Optional title:Str, max:Int, flags:Any, def:Str (Global Command)
    //    Text input.

    //    Displays a standard text input dialog.
    //    All but the first parameter are optional, and have the following meaning:
    //    - %prompt: the prompt to show in the dialog.
    //    - %title: the window title. Defaults to the value of %prompt.
    //    - %length: maximum number of characters to accept, defaults to 255.
    //    - %flags: some additional flags that affect the behaviour of this dialog (see below).
    //    - %def: initial contents of text input field.

    //    The %flags parameter is a string that can contain the following:
    //    - "n": only accept numeric input (digits).
    //    - "h": do not accept high-ASCII characters (umlauts, accents, etc.).
    //    - "p": password input: display stars instead of actual input.
    //    - "f": draw a frame around the input line.
    //    - "g": only accept characters from game character set.
    //    - "m": the width (next item) is specified in ems (default: pixels).
    //    - a number: width of input line.
    //   For example, "h450" gives an input line which is 450 pixels wide and does not accept high-ASCII input,
    //   "30m" displays an input line which is 30 ems wide.
    //   If you only want to set the width, you can also pass an integer instead of a string.

    //   The result is returned in {UI.Result}:
    //   if the user hits <kbd>Enter</kbd>, {UI.Result} contains the input.
    //   If the user hits <kbd>ESC</kbd>, {UI.Result} will be EMPTY.

    //   Example: this is the "rename ship" function <kbd>N</kbd> on the ship screen:
    //   | UI.Input "Enter new name:", "Rename Starship #" & Id, 20, 320, Name
    //   | SetName UI.Result
    //   ({SetName (Ship Command)|SetName} will not do anything when passed an EMPTY parameter).

    //   In text mode, this command makes a simple input line using the %prompt only.
    //   @since PCC 1.0.9, PCC2 1.99.9 */
    void doUIInput(game::Session& /*session*/, client::si::ScriptSide& si, client::si::RequestLink1 link, interpreter::Arguments& args)
    {
        // ex IFUIInput
        /* UI.Input <prompt>[, <title>, <maxChars>, <flags>, <default>] */
        args.checkArgumentCount(1, 5);

        String_t prompt;
        String_t title;
        String_t defaultText;
        int32_t  maxChars = 255;
        int32_t  flags = 0;
        int32_t  width = 0; // FIXME: ui_root->getExtent().w / 2;

        // Mandatory argument
        if (!interpreter::checkStringArg(prompt, args.getNext())) {
            return;
        }

        // Optional arguments
        title = prompt;
        interpreter::checkStringArg(title, args.getNext());
        interpreter::checkIntegerArg(maxChars, args.getNext(), 0, 32000);
        interpreter::checkFlagArg(flags, &width, args.getNext(), "NHPFGM");
        interpreter::checkStringArg(defaultText, args.getNext());

        // Post command
        class Task : public UserTask {
         public:
            Task(String_t prompt,
                 String_t title,
                 String_t defaultText,
                 int32_t maxChars,
                 int32_t flags,
                 int32_t width)
                : m_prompt(prompt),
                  m_title(title),
                  m_defaultText(defaultText),
                  m_maxChars(maxChars),
                  m_flags(flags),
                  m_width(width)
                { }
            void handle(UserSide& ui, Control& ctl, RequestLink2 link)
                {
                    // Font
                    gfx::FontRequest font;
                    font.addSize(1);

                    // Convert length
                    int width;
                    if (m_width == 0) {
                        width = ctl.root().getExtent().getWidth() / 2;
                    } else {
                        width = m_width;
                    }
                    if (m_width == 0 || (m_flags & 32) == 0) {
                        if (int em = ctl.root().provider().getFont(font)->getEmWidth()) {
                            width /= em;
                        }
                    }

                    // Build a widget
                    ui::widgets::InputLine widget(m_maxChars, m_width, ctl.root());
                    widget.setFont(font);

                    // Convert flags
                    //   N = numeric
                    //   H = on high ASCII
                    //   P = password masking
                    //   F = frame
                    //   G = game charset
                    //   M = width is in ems
                    if ((m_flags & 1) != 0) {
                        widget.setFlag(widget.NumbersOnly, true);
                    }
                    if ((m_flags & 2) != 0) {
                        widget.setFlag(widget.NoHi, true);
                    }
                    if ((m_flags & 4) != 0) {
                        widget.setFlag(widget.Hidden, true);
                    }
                    // FIXME: flag 'F' (framed) must be implemented differently
                    // if ((m_flags & 8) != 0) {
                    //     widget.setFlag(widget.Framed, true);
                    // }
                    if ((m_flags & 16) != 0) {
                        widget.setFlag(widget.GameChars, true);
                    }

                    widget.setText(m_defaultText);
                    std::auto_ptr<afl::data::Value> result;
                    if (widget.doStandardDialog(m_title, m_prompt)) {
                        result.reset(interpreter::makeStringValue(widget.getText()));
                    }
                    ui.setVariable(link, "UI.RESULT", result);
                    ui.continueProcess(link);
                }
         private:
            String_t m_prompt;
            String_t m_title;
            String_t m_defaultText;
            int32_t m_maxChars;
            int32_t m_flags;
            int32_t m_width;
        };
        si.postNewTask(link, new Task(prompt, title, defaultText, maxChars, flags, width));
    }

    // /* @q UI.Message text:RichText, Optional title:Str, buttons:Str (Global Command)
    //    Display a message.
    //    This displays a standard message box with the specified %text and %title,
    //    and the specified %buttons.
    //    For example,
    //    | UI.Message "Choose a color", "Question", "Red Green Blue"
    //    displays a message box with three buttons: "Red", "Green", and "Blue".

    //    The buttons can be activated by hitting their first letter.
    //    In addition, the <kbd>Enter</kbd> key activates the first button, <kbd>ESC</kbd> activates the last one.

    //    This command returns the index of the pressed button in {UI.Result}.
    //    For example, if the user chose "Red" above, {UI.Result} will have the value 1 afterwards.

    //    In text mode, displays text and heading, and a list of first letters
    //    of the buttons, and waits for a matching keystroke.

    //    The last two parameters are optional and default to "Message" and "OK".

    //    This command differs from {MessageBox} in that it modifies {UI.Result}, and waits for a keystroke in text mode.

    //    @diff PCC 1.x allows up to 10 buttons; PCC2 has no such limit
    //    (but you are adviced to keep the number of buttons and the length of the texts short anyway).

    //    @see MessageBox, UI.Input
    //    @since PCC 1.0.9, PCC2 1.99.9 */
    void doUIMessage(game::Session& /*session*/, client::si::ScriptSide& si, client::si::RequestLink1 link, interpreter::Arguments& args)
    {
        // ex IFUIMessage
        // using std::tolower;

        args.checkArgumentCount(1, 3);

        // Read arguments
        game::interface::RichTextValue::Ptr_t pContent;
        String_t title   = _("Message");
        String_t buttons = _("OK");
        if (!game::interface::checkRichArg(pContent, args.getNext())) {
            return;
        }
        interpreter::checkStringArg(title, args.getNext());
        interpreter::checkStringArg(buttons, args.getNext());

        class Task : public UserTask {
         public:
            Task(game::interface::RichTextValue::Ptr_t pContent, String_t heading, String_t buttons)
                : m_content(*pContent), m_heading(heading), m_buttons(buttons)
                { }
            void handle(UserSide& ui, Control& ctl, RequestLink2 link)
                {
                    // Build dialog
                    ui::dialogs::MessageBox dlg(m_content, m_heading, ctl.root());
                    int id = 0;
                    do {
                        String_t b = afl::string::strFirst(m_buttons, " ");
                        if (!b.empty()) {
                            ++id;
                            dlg.addButton(id, b, afl::charset::getLowerCase(afl::charset::Utf8().charAt(b, 0)));
                        }
                    } while (afl::string::strRemove(m_buttons, " "));
                    dlg.addKey(1, util::Key_Return);
                    dlg.addKey(1, ' ');
                    dlg.addKey(id, util::Key_Escape);

                    // Do it
                    std::auto_ptr<afl::data::Value> result;
                    if (id != 0) {
                        // ...only if we actually got some buttons
                        // FIXME: replacement for flushUI, checkForBreak()?
                        //     flushUI();
                        //     if (exc.checkForBreak())
                        int n = dlg.run();
                        result.reset(interpreter::makeIntegerValue(n));
                    }

                    // Continue
                    ui.setVariable(link, "UI.RESULT", result);
                    ui.continueProcess(link);
                }
         private:
            util::rich::Text m_content;
            String_t m_heading;
            String_t m_buttons;
        };
        si.postNewTask(link, new Task(pContent, title, afl::string::strTrim(buttons)));
    }

    // /* @q UI.PopupConsole (Global Command)
    //    Open the <a href="pcc2:console">console</a>.
    //    The script continues running there.
    //    If your script is doing interesting output to the console,
    //    you can call this function to ensure the user sees it, even if he bound it to a key.

    //    @since PCC 1.1.2, PCC2 1.99.10 */
    void doUIPopupConsole(game::Session& /*session*/, client::si::ScriptSide& si, client::si::RequestLink1 link, interpreter::Arguments& args)
    {
        // ex IFUIPopupConsole
        args.checkArgumentCount(0);
        si.postNewTask(link, new PopupConsoleTask());
    }
}

void
client::si::registerCommands(UserSide& ui)
{
    class Task : public util::SlaveRequest<game::Session, ScriptSide> {
     public:
        void handle(game::Session& s, ScriptSide& si)
            {
                // // Procedures
                // s.world().setNewGlobalValue("CC$ADDTOSIM",           IFCCAddToSim);
                // s.world().setNewGlobalValue("CC$BUILDAMMO",          IFCCBuildAmmo);
                // s.world().setNewGlobalValue("CC$BUILDBASE",          IFCCBuildBase);
                // s.world().setNewGlobalValue("CC$BUILDSHIP",          IFCCBuildShip);
                // s.world().setNewGlobalValue("CC$BUILDSTRUCTURES",    IFCCBuildStructures);
                // s.world().setNewGlobalValue("CC$BUYSUPPLIES",        IFCCBuySupplies);
                // s.world().setNewGlobalValue("CC$CARGOHISTORY",       IFCCCargoHistory);
                // s.world().setNewGlobalValue("CC$CHANGEMISSION",      IFCCChangeMission);
                // s.world().setNewGlobalValue("CC$CHANGEPE",           IFCCChangePE);
                // s.world().setNewGlobalValue("CC$CHANGESPEED",        IFCCChangeSpeed);
                // s.world().setNewGlobalValue("CC$CHANGETAXES",        IFCCChangeTaxes);
                // s.world().setNewGlobalValue("CC$CHANGETECH",         IFCCChangeTech);
                // s.world().setNewGlobalValue("CC$CHANGEWAYPOINT",     IFCCChangeWaypoint);
                // s.world().setNewGlobalValue("CC$CSBROWSE",           IFCCCSBrowse);
                // s.world().setNewGlobalValue("CC$GIVE",               IFCCGive);
                // s.world().setNewGlobalValue("CC$LISTSCREENHISTORY",  IFCCListScreenHistory);
                // s.world().setNewGlobalValue("CC$POPSCREENHISTORY",   IFCCPopScreenHistory);
                // s.world().setNewGlobalValue("CC$REMOTECONTROL",      IFCCRemoteControl);
                // s.world().setNewGlobalValue("CC$RESET",              IFCCReset);
                // s.world().setNewGlobalValue("CC$SELLSUPPLIES",       IFCCSellSupplies);
                // s.world().setNewGlobalValue("CC$SENDMESSAGE",        IFCCSendMessage);
                // s.world().setNewGlobalValue("CC$SETTINGS",           IFCCSettings);
                // s.world().setNewGlobalValue("CC$SHIPCOSTCALC",       IFCCShipCostCalc),
                // s.world().setNewGlobalValue("CC$SHIPSPEC",           IFCCShipSpec);
                // s.world().setNewGlobalValue("CC$TOWFLEETMEMBER",     IFCCTowFleetMember);
                // s.world().setNewGlobalValue("CC$TRANSFERMULTI",      IFCCTransferMulti);
                // s.world().setNewGlobalValue("CC$TRANSFERPLANET",     IFCCTransferPlanet);
                // s.world().setNewGlobalValue("CC$TRANSFERSHIP",       IFCCTransferShip);
                // s.world().setNewGlobalValue("CC$TRANSFERUNLOAD",     IFCCTransferUnload);
                // s.world().setNewGlobalValue("CC$USEKEYMAP",          IFCCUseKeymap);
                // s.world().setNewGlobalValue("CC$VIEWINBOX",          IFCCViewInbox);
                // s.world().setNewGlobalValue("CHART.SETVIEW",         IFChartSetView);
                // s.world().setNewGlobalValue("LOADRESOURCE",          IFLoadResource);
                s.world().setNewGlobalValue("MESSAGEBOX",            new ScriptProcedure(s, &si, doMessageBox));
                s.world().setNewGlobalValue("SYSTEM.EXITCLIENT",     new ScriptProcedure(s, &si, doSystemExitClient));
                s.world().setNewGlobalValue("SYSTEM.EXITRACE",       new ScriptProcedure(s, &si, doSystemExitRace));
                s.world().setNewGlobalValue("UI.CHOOSEOBJECT",       new ScriptProcedure(s, &si, doUIChooseObject));
                s.world().setNewGlobalValue("UI.CHOOSETURN",         new ScriptProcedure(s, &si, doUIChooseTurn));
                // s.world().setNewGlobalValue("UI.EDITALLIANCES",      IFUIEditAlliances);
                s.world().setNewGlobalValue("UI.ENDDIALOG",          new ScriptProcedure(s, &si, doUIEndDialog));
                // s.world().setNewGlobalValue("UI.FILEWINDOW",         IFUIFileWindow);
                // s.world().setNewGlobalValue("UI.GOTOCHART",          IFUIGotoChart);
                s.world().setNewGlobalValue("UI.GOTOSCREEN",         new ScriptProcedure(s, &si, doUIGotoScreen));
                // s.world().setNewGlobalValue("UI.HELP",               IFUIHelp);
                s.world().setNewGlobalValue("UI.INPUT",              new ScriptProcedure(s, &si, doUIInput));
                // s.world().setNewGlobalValue("UI.INPUTFCODE",         IFUIInputFCode);
                // s.world().setNewGlobalValue("UI.INPUTNUMBER",        IFUIInputNumber);
                // s.world().setNewGlobalValue("UI.KEYMAPINFO",         IFUIKeymapInfo);
                // s.world().setNewGlobalValue("UI.LISTFLEETS",         IFUIListFleets);
                // s.world().setNewGlobalValue("UI.LISTSHIPPREDICTION", IFUIListShipPrediction);
                // s.world().setNewGlobalValue("UI.LISTSHIPS",          IFUIListShips);
                s.world().setNewGlobalValue("UI.MESSAGE",            new ScriptProcedure(s, &si, doUIMessage));
                // s.world().setNewGlobalValue("UI.OVERLAYMESSAGE",     IFUIOverlayMessage);
                // s.world().setNewGlobalValue("UI.PLANETINFO",         IFUIPlanetInfo);
                s.world().setNewGlobalValue("UI.POPUPCONSOLE",       new ScriptProcedure(s, &si, doUIPopupConsole));
                // s.world().setNewGlobalValue("UI.SEARCH",             IFUISearch);
                // s.world().setNewGlobalValue("UI.SELECTIONMANAGER",   IFUISelectionManager);
                // s.world().setNewGlobalValue("UI.UPDATE",             IFUIUpdate);
            }
    };
    ui.postNewRequest(new Task());
}