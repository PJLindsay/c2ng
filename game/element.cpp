/**
  *  \file game/element.cpp
  *  \brief Class game::Element
  */

#include "game/element.hpp"
#include "game/spec/torpedo.hpp"
#include "game/spec/shiplist.hpp"

game::Element::Type
game::Element::fromTorpedoType(int torpedoType)
{
    // ex getCargoTypeFromTorpType
    return Type(FirstTorpedo + (torpedoType - 1));
}

bool
game::Element::isTorpedoType(Type t, int& torpedoType)
{
    // ex getTorpTypeFromCargoType, isCargoTorpedo
    if (t >= FirstTorpedo) {
        torpedoType = (t - FirstTorpedo) + 1;
        return true;
    } else {
        return false;
    }
}

game::Element::Type&
game::operator++(Element::Type& t)
{
    t = static_cast<Element::Type>(t + 1);
    return t;
}

game::Element::Type&
game::operator--(Element::Type& t)
{
    t = static_cast<Element::Type>(t - 1);
    return t;
}

game::Element::Type
game::operator++(Element::Type& t, int)
{
    Element::Type result = t;
    ++t;
    return result;
}

game::Element::Type
game::operator--(Element::Type& t, int)
{
    Element::Type result = t;
    --t;
    return result;
}


// /** Get user-visible name of cargo item /type/. */
String_t
game::Element::getName(Type t, afl::string::Translator& tx, const game::spec::ShipList& shipList)
{
    // ex getCargoName
    switch (t) {
     case Neutronium:
        return tx.translateString("Neutronium");
     case Tritanium:
        return tx.translateString("Tritanium");
     case Duranium:
        return tx.translateString("Duranium");
     case Molybdenum:
        return tx.translateString("Molybdenum");
     case Fighters:
        return tx.translateString("Fighters");
     case Colonists:
        return tx.translateString("Colonists");
     case Supplies:
        return tx.translateString("Supplies");
     case Money:
        return tx.translateString("Money");
     default:
        int torpedoType;
        if (isTorpedoType(t, torpedoType)) {
            if (const game::spec::TorpedoLauncher* torp = shipList.launchers().get(torpedoType)) {
                return torp->getName(shipList.componentNamer());
            }
        }
        return String_t();
    }
}

// /** Get unit of cargo type /type/.
//     \returns name of unit, or empty string if type doesn't have
//     a unit (i.e. torps) */
String_t
game::Element::getUnit(Type t, afl::string::Translator& tx, const game::spec::ShipList& /*shipList*/)
{
    // ex getCargoUnit
    switch(t) {
     case Neutronium:
     case Tritanium:
     case Duranium:
     case Molybdenum:
     case Supplies:
        return tx.translateString("kt");
     case Colonists:
        return tx.translateString("clans");
     case Money:
        return tx.translateString("mc");
     case Fighters:
     default:
        return String_t();
    }
}

game::Element::Type
game::Element::end(const game::spec::ShipList& shipList)
{
    return fromTorpedoType(shipList.launchers().size() + 1);
}
