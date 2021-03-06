%
%  Game functions
%
%  This module contains documented official functions, and some still undocumented functions.
%  Undocumented functions have a "CCVP." prefix.
%  As usual, the "ex file.cc:function" comment means this function was implemented in C++ in PCC2.
%

% @q WaitOneTurn (Global Command)
% Suspend script for one turn.
% Execution proceeds next turn (or later, when a turn is missed).
% See {Stop} for details and restrictions on suspension.
% @see Stop
% @since PCC2 1.99.10, PCC 1.0.6, PCC2 2.40
Sub WaitOneTurn ()
  Local t = Turn
  Do While t = Turn
    Stop
  Loop
EndSub

% @q MoveTo x:Int, y:Int (Ship Command)
% Move ship to X,Y.
% This sets a waypoint, and suspends the script until the waypoint has been reached.
% As a special case, if the waypoint is in a warp well, the script continues when
% the planet has been reached.
%
% Example:
% <pre class="ccscript">
%   MoveTo 1240, 1500
%   MoveTo 1400, 1520
% </pre>
% This will move the ship to (1240,1500) and then to (1400,1520).
%
% This command is intended to be used in auto tasks.
% @see Stop
% @since PCC2 1.99.10, PCC 1.0.6, PCC2 2.40.1
Sub MoveTo (x, y)
  % We terminate when the waypoint is zero: when moving across a map border, we never
  % reach the specified x,y.
  Local pid = PlanetAt(x, y, 1)
  With Lock("s" & Id & ".waypoint")
    SetWaypoint x, y
    Do Until (Waypoint.DX=0 And Waypoint.DY=0) Or ((pid<>0) And (Orbit$=pid))
      Stop
    Loop
  EndWith
EndSub

% @q MoveTowards x:Int, y:Int (Ship Command)
% Move ship towards X,Y.
% This command sets the waypoint and waits one turn.
% This causes the ship to move towards the specified coordinate, but not necessarily reach it.
%
% This command is intended to be used in auto tasks.
% @see Stop
% @since PCC2 1.99.10, PCC 1.1.3, PCC2 2.40.1
Sub MoveTowards (x, y)
  With Lock("s" & Id & ".waypoint")
    SetWaypoint x, y
    WaitOneTurn
  EndWith
EndSub

% @q ShipName(sid:Int):Str (Function)
% Get name of a ship.
% Similar to <tt>Ship(sid).Name</tt>.
%
% @diff In PCC 1.x, this function returns a decorated name such as "USS Lincoln (#123)".
% In PCC2 since 1.99.20, this function returns just the name.
% Use {ShipNameAndId} for the old behaviour.
% @see ShipNameAndId, PlanetName
% @since PCC 0.99.7, PCC2 1.99.8, PCC2 2.40.1
Function ShipName (sid)
  % ex int/if/globalif.h:IFShipNameGet
  Return Global.Ship(sid).Name
EndFunction

% @q IsSpecialFCode(fc:Str):Bool (Function)
% Check for special friendly code.
% Returns true if the friendly code given as a parameter is a special friendly code.
% @since PCC 1.1.4, PCC2 1.99.8, PCC2 2.40.1
Function IsSpecialFCode(fc)
  % ex int/if/globalif.h:IFIsSpecialFCodeGet
  If Not IsEmpty(fc)
    If Find(Global.FCode, Left(fc,3)=Name And InStr(Flags,'u')=0, True)
      Return True
    Else
      Return False
    EndIf
  Else
    Return Z(0)
  EndIf
EndFunction

% @q PlanetName(pid:Int):Str (Function)
% Get name of a planet.
% @see ShipName
% @since PCC 0.99.7, PCC2 1.99.8, PCC2 2.40.1
Function PlanetName (pid)
  % ex int/if/globalif.h:IFPlanetNameGet
  Return Global.Planet(pid).Name
EndFunction

% @q ShipNameAndId(sid:Int):Str (Function)
% Get name of a ship, together with its Id.
%
% Note that this function does what %ShipName does in PCC 1.x.
% In PCC2, %ShipName returns just the plain name which I believe is more useful
% and consistent with %PlanetName.
% Code that used %ShipName can now use %ShipNameAndId.
% @since PCC2 1.99.20, PCC2 2.40.1
% @see ShipName
Function ShipNameAndId (sid)
  Local N = ShipName(sid)
  If N
    Return N & " (#" & sid & ")"
  Else
    Return Format(Translate("Ship %d"), sid)
  EndIf
EndFunction

% @q FindShipCloningAt(pid:Int):Int (Function)
% Find ship cloning at a planet.
% Returns the Id of the ship that is cloning at planet %pid.
% If no ship is trying to clone, or cloning is forbidden, returns EMPTY.
% @since PCC2 1.99.10, PCC 2.40.1
Function FindShipCloningAt (pid)
  If Cfg("AllowShipCloning")
    % FindShip returns the first ship, which is just what we need
    Return FindShip(Orbit$=pid And StrCase(FCode="cln"))
  Else
    Return Z(0)
  EndIf
EndFunction


%%% More Game Functions

% Get name of experience level
% @since PCC2 2.40.1
Function CCVP.GetExperienceLevelName (n)
  If Not IsEmpty(n)
    Local s = Cfg("ExperienceLevelNames")
    Local i
    For i:=1 To n Do s := Rest(',', s)
    s := Trim(First(',', s))
    If Not s Then s := Format(Translate("Level %d"), n)
    Return s
  EndIf
EndFunction


% Get name of location.
% Equivalent to game::map::Universe::getLocationName:
% flags = s (ships), w (warp wells), v (verbose), o (orbit), e (empty if deep space)
% @since PCC2 2.40.1
Function CCVP.GetLocationName(findX, findY, flags)
  Local pid, sid, fmt

  pid = PlanetAt(findX, findY)
  If pid Then
    If InStr(flags, "o") Then
      fmt := If(InStr(flags, "v"), Translate("Orbit of %s (Planet #%d)"), Translate("Orbit of %s (#%d)"))
    Else
      fmt := If(InStr(flags, "v"), Translate("%s (Planet #%d)"), Translate("%s (#%d)"))
    EndIf
    Return Format(fmt, Global.Planet(pid).Name, pid)
  EndIf

  If InStr(flags, "s") Then
    sid := FindShip(Loc.X=findX And Loc.Y=findY)
    If sid Then
      If Not Name Then
        Return Format(Translate("Ship #%d"), sid)
      Else
        Return Format(Translate("Ship #%d: %s"), sid, Global.Ship(sid).Name)
      EndIf
    EndIf
  EndIf

  If InStr(flags, "w") Then
    pid := PlanetAt(findX, findY, 1)
    If pid Then
      Return Format(If(InStr(flags, "v"), Translate("near %s (Planet #%d)"), Translate("near %s (#%d)")), Global.Planet(pid).Name, pid)
    EndIf
  EndIf

  If InStr(flags, "e") Then
    Return ""
  Else
    Return Format(If(InStr(flags, "v"), Translate("Deep Space (%d,%d)"), "(%d,%d)"), findX, findY)
  EndIf
EndFunction


% Call from ship context: get label of current ship
% @since PCC2 2.40.1
Function CCVP.ShipMissionLabel
  Local tmp, System.Err

  % Try the label expression
  tmp := Global.Mission(Mission$, Owner.Real).Label
  If tmp Then Try Return Eval(tmp)

  % If that fails, try the name
  tmp := Global.Mission(Mission$, Owner.Real).Name
  If tmp Then Return tmp

  % If that still fails, report scary values
  If Mission.Intercept Or Mission.Tow Then
    Return Format("M%d I%d T%d", Mission$, Mission.Intercept, Mission.Tow)
  Else
    Return Format("M%d", Mission$)
  EndIf
EndFunction

% Call from ship context: check for possible mission warning
Function CCVP.ShipHasMissionWarning
  % ex GMission::isWarning
  Local tmp, System.Err

  % Try to find an expression
  tmp := Global.Mission(Mission$, Owner.Real).Warning
  If Not tmp Then tmp := Global.Mission(Mission$, Owner.Real).Condition

  % If we have an expression, return its value. Error means there is a warning.
  If tmp Then
    Try
      tmp := Eval(tmp)
      Return IsEmpty(tmp) Or Not tmp
    EndTry
    Return True
  Else
    Return False
  EndIf
EndFunction

% @since PCC2 2.40.1
Function CCVP.HappyColor(happy)
  If happy <= 40 Then
    Return "red"
  Else If happy < 70 Then
    Return "yellow"
  Else
    Return "green"
  EndIf
EndFunction


% Render number
% @since PCC2 2.40.1
Function CCVP.NumberToString(n)
  % ex util/misc.h:numToString
  Local s = Str(Abs(n)), i
  If Pref("Display.ThousandsSep") Then
    i := Len(s)
    Do While i > 3
      i := i - 3
      s := Mid(s,1,i) & "," & Mid(s,i+1)
    Loop
  EndIf
  If n < 0 Then s:='-' & s
  Return s
EndFunction


% Render clans
% @since PCC2 2.40.1
Function CCVP.ClansToString(n)
  % ex util/misc.h:clansToString
  If Pref("Display.Clans") Then
    Return CCVP.NumberToString(n) & "c"
  Else
    Return CCVP.NumberToString(n*100)
  EndIf
EndFunction

% Check for "Give"
Function CCVP.AllowGive
  Return Cfg("CPEnableGive") And System.Host="PHost"
EndFunction

Function CCVP.AllowRemote
  Return Cfg("CPEnableRemote") And System.Host="PHost"
EndFunction

% Option declarations
On Load Do CreatePrefOption "Display.ThousandsSep", "bool"
On Load Do CreatePrefOption "Display.Clans", "bool"
