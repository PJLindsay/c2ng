/**
  *  \file game/interface/minefieldproperty.cpp
  */

#include "game/interface/minefieldproperty.hpp"
#include "interpreter/error.hpp"
#include "interpreter/values.hpp"

using interpreter::makeIntegerValue;
using interpreter::makeBooleanValue;
using interpreter::makeStringValue;

// /** Get minefield property.
//     \param mf Minefield to query
//     \param imp Property to query
//     \return property value, newly allocated */
afl::data::Value*
game::interface::getMinefieldProperty(const game::map::Minefield& mf, MinefieldProperty imp)
{
    // ex int/if/mineif.h:getMinefieldProperty
    // Fend off invalid minefields
    if (!mf.isValid()) {
        return 0;
    }

    // Regular minefield case
    game::map::Point pt;
    int i;
    switch (imp) {
     case impId:
        /* @q Id:Int (Minefield Property)
           Id of this minefield. */
        return makeIntegerValue(mf.getId());
     case impLastScan:
        /* @q LastScan:Int (Minefield Property)
           Turn when minefield was last scanned. */
        return makeIntegerValue(mf.getTurnLastSeen());
     case impLocX:
        /* @q Loc.X:Int (Minefield Property)
           X location of center of minefield. */
        if (mf.getPosition(pt)) {
            return makeIntegerValue(pt.getX());
        } else {
            return 0;
        }
     case impLocY:
        /* @q Loc.Y:Int (Minefield Property)
           Y location of center of minefield. */
        if (mf.getPosition(pt)) {
            return makeIntegerValue(pt.getY());
        } else {
            return 0;
        }
     case impMarked:
        /* @q Marked:Bool (Minefield Property)
           True if minefield is marked. */
        return makeBooleanValue(mf.isMarked());
     case impRadius:
        /* @q Radius:Int (Minefield Property)
           Minefield radius in ly. */
        if (mf.getRadius(i)) {
            return makeIntegerValue(i);
        } else {
            return 0;
        }
     case impScanType:
        /* @q Scanned:Int (Minefield Property)
           Last reported action on this minefield.
           <table>
            <tr><td width="1">0</td><td width="20">Not scanned this turn</td></tr>
            <tr><td width="1">1</td><td width="20">Laid this turn</td></tr>
            <tr><td width="1">2</td><td width="20">Swept this turn</td></tr>
            <tr><td width="1">3</td><td width="20">Scanned this turn</td></tr>
           </table> */
        return makeIntegerValue(mf.getReason());
     case impTypeCode:
        /* @q Type$:Bool (Minefield Property)
           True if this is a web mine field. */
        return makeBooleanValue(mf.isWeb());
     case impTypeStr:
        /* @q Type:Str (Minefield Property)
           Minefield type, human-readable.
           One of "Web Mines" or "Mines". */
        return makeStringValue(mf.isWeb() ? "Web Mines" : "Mines");
     case impUnits:
        /* @q Units:Int (Minefield Property)
           Number of mine units. */
        return makeIntegerValue(mf.getUnits());
    }
    return 0;
}

// /** Set minefield property. */
void
game::interface::setMinefieldProperty(game::map::Minefield& /*mf*/, MinefieldProperty /*imp*/, afl::data::Value* /*value*/)
{
    // ex int/if/mineif.h:setMinefieldProperty
    throw interpreter::Error::notAssignable();
}
