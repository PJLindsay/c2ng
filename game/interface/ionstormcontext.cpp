/**
  *  \file game/interface/ionstormcontext.cpp
  *  \class game::interface::IonStormContext
  */

#include "game/interface/ionstormcontext.hpp"
#include "interpreter/typehint.hpp"
#include "interpreter/nametable.hpp"
#include "game/interface/ionstormproperty.hpp"
#include "game/game.hpp"
#include "game/turn.hpp"
#include "game/map/universe.hpp"
#include "interpreter/propertyacceptor.hpp"
#include "afl/string/format.hpp"
#include "game/interface/objectcommand.hpp"

namespace {
    enum IonStormDomain {
        IonStormPropertyDomain,
        IonStormMethodDomain
    };

    enum IonStormCommand {
        iicMark,
        iicUnmark
    };

    static const interpreter::NameTable ion_storm_mapping[] = {
        { "CLASS",     game::interface::iipClass,       IonStormPropertyDomain, interpreter::thInt },
        { "HEADING",   game::interface::iipHeadingName, IonStormPropertyDomain, interpreter::thString },
        { "HEADING$",  game::interface::iipHeadingInt,  IonStormPropertyDomain, interpreter::thInt },
        { "ID",        game::interface::iipId,          IonStormPropertyDomain, interpreter::thInt },
        { "LOC.X",     game::interface::iipLocX,        IonStormPropertyDomain, interpreter::thInt },
        { "LOC.Y",     game::interface::iipLocY,        IonStormPropertyDomain, interpreter::thInt },
        { "MARK",      iicMark,                         IonStormMethodDomain,   interpreter::thProcedure },
        { "MARKED",    game::interface::iipMarked,      IonStormPropertyDomain, interpreter::thBool },
        { "NAME",      game::interface::iipName,        IonStormPropertyDomain, interpreter::thString },
        { "RADIUS",    game::interface::iipRadius,      IonStormPropertyDomain, interpreter::thInt },
        { "SPEED",     game::interface::iipSpeedName,   IonStormPropertyDomain, interpreter::thString },
        { "SPEED$",    game::interface::iipSpeedInt,    IonStormPropertyDomain, interpreter::thInt },
        { "STATUS",    game::interface::iipStatusName,  IonStormPropertyDomain, interpreter::thString },
        { "STATUS$",   game::interface::iipStatusFlag,  IonStormPropertyDomain, interpreter::thBool },
        { "UNMARK",    iicUnmark,                       IonStormMethodDomain,   interpreter::thProcedure },
        { "VOLTAGE",   game::interface::iipVoltage,     IonStormPropertyDomain, interpreter::thInt },
    };


    const game::interface::ObjectCommand::Function_t ion_storm_methods[] = {
        game::interface::IFObjMark,                  // iicMark
        game::interface::IFObjUnmark,                // iicUnmark
    };

}

game::interface::IonStormContext::IonStormContext(int id, Session& session, afl::base::Ptr<Game> game)
    : m_id(id),
      m_session(session),
      m_game(game)
{ }

game::interface::IonStormContext::~IonStormContext()
{ }

// Context:
bool
game::interface::IonStormContext::lookup(const afl::data::NameQuery& name, PropertyIndex_t& result)
{
    // ex IntIonContext::lookup
    return lookupName(name, ion_storm_mapping, result);
}

void
game::interface::IonStormContext::set(PropertyIndex_t index, afl::data::Value* value)
{
    // ex IntIonContext::set
    switch (IonStormDomain(ion_storm_mapping[index].domain)) {
     case IonStormPropertyDomain:
        if (game::map::IonStorm* ii = getObject()) {
            setIonStormProperty(*ii, IonStormProperty(ion_storm_mapping[index].index), value);
        } else {
            throw interpreter::Error::notAssignable();
        }
        break;
     case IonStormMethodDomain:
        throw interpreter::Error::notAssignable();
    }
}

afl::data::Value*
game::interface::IonStormContext::get(PropertyIndex_t index)
{
    Game* g = m_game.get();
    game::map::IonStorm* ii = getObject();
    if (g != 0 && ii != 0) {
        switch (IonStormDomain(ion_storm_mapping[index].domain)) {
         case IonStormPropertyDomain:
            return getIonStormProperty(*ii, IonStormProperty(ion_storm_mapping[index].index), m_session.translator(), m_session.interface());

         case IonStormMethodDomain:
            return new ObjectCommand(m_session, *ii, ion_storm_methods[ion_storm_mapping[index].index]);

         default:
            return 0;
        }
    } else {
        return 0;
    }

}

bool
game::interface::IonStormContext::next()
{
    if (Game* game = m_game.get()) {
        if (int id = game->currentTurn().universe().ionStormType().findNextIndex(m_id)) {
            m_id = id;
            return true;
        }
    }
    return false;
}

game::interface::IonStormContext*
game::interface::IonStormContext::clone() const
{
    // ex IntIonContext::clone
    return new IonStormContext(m_id, m_session, m_game);
}

game::map::IonStorm*
game::interface::IonStormContext::getObject()
{
    if (Game* game = m_game.get()) {
        return game->currentTurn().universe().ionStorms().get(m_id);
    } else {
        return 0;
    }
}

void
game::interface::IonStormContext::enumProperties(interpreter::PropertyAcceptor& acceptor)
{
    // ex IntIonContext::enumProperties
    acceptor.enumTable(ion_storm_mapping);
}

// BaseValue:
String_t
game::interface::IonStormContext::toString(bool /*readable*/) const
{
    // ex IntIonContext::toString
    return afl::string::Format("Storm(%d)", m_id);
}

void
game::interface::IonStormContext::store(interpreter::TagNode& out, afl::io::DataSink& /*aux*/, afl::charset::Charset& /*cs*/, interpreter::SaveContext* /*ctx*/) const
{
    // ex IntIonContext::store
    out.tag = out.Tag_Ion;
    out.value = m_id;
}