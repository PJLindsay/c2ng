/**
  *  \file game/map/minefield.cpp
  *
  *  FIXME: consider where we have to raise sig_change.
  */

#include <cmath>
#include "game/map/minefield.hpp"
#include "afl/string/format.hpp"
#include "util/math.hpp"

// Constructor and Destructor:
game::map::Minefield::Minefield(Id_t id)
    : m_id(id),
      m_position(),
      m_owner(0),
      m_isWeb(false),
      m_units(0),
      m_turn(0),
      m_reason(NoReason),
      m_previousTurn(0),
      m_previousUnits(0),
      m_currentRadius(0),
      m_currentUnits(0)
{
    // ex GMinefield::GMinefield
}

game::map::Minefield::~Minefield()
{ }

// Object:
String_t
game::map::Minefield::getName(Name /*which*/, afl::string::Translator& tx, InterpreterInterface& iface) const
{
    // ex GMinefield::getName
    String_t result;
    if (m_isWeb) {
        result = afl::string::Format(tx.translateString("Web Mine Field #%d").c_str(), m_id);
    } else {
        result = afl::string::Format(tx.translateString("Mine Field #%d").c_str(), m_id);
    }

    String_t adj;
    if (iface.getPlayerAdjective(m_owner, adj)) {
        result += "(";
        result += adj;
        result += ")";
    }
    return result;
}

game::Id_t
game::map::Minefield::getId() const
{
    // ex GMinefield::getId
    return m_id;
}

bool
game::map::Minefield::getOwner(int& result) const
{
    // ex GMinefield::getOwner
    if (isValid()) {
        result = m_owner;
        return true;
    } else {
        return false;
    }
}

// MapObject:
bool
game::map::Minefield::getPosition(Point& result) const
{
    // ex GMinefield::getPos
    if (isValid()) {
        result = m_position;
        return true;
    } else {
        return false;
    }
}

// CircularObject:
bool
game::map::Minefield::getRadius(int& result) const
{
    // ex GMinefield::getRadius
    if (isValid()) {
        result = m_currentRadius;
        return true;
    } else {
        return false;
    }
}

bool
game::map::Minefield::getRadiusSquared(int32_t& result) const
{
    // ex GMinefield::getRadiusSquared
    if (isValid()) {
        result = m_currentUnits;
        return true;
    } else {
        return false;
    }
}

void
game::map::Minefield::addReport(const Point pos,
                                const int owner,
                                const TypeReport type,
                                const SizeReport size,
                                const int32_t sizeValue,
                                const int turn,
                                const ReasonReport reason)
{
    // ex GMinefield::addMinefieldReport
    // Original version takes a TMinefieldReport which maps as follows:
    //     x,y -> pos
    //     owner
    //     web, type_known -> type
    //     units_known, radius_or_units -> size, sizeValue
    //     turn
    //     why -> reason

    // Is this information actually newer?
    if (turn < m_turn) {
        return;
    }

    // Is this the same field we already saw?
    const bool isSameField = (m_owner == owner && m_position == pos);

    // Turn change: move previous values into archive.
    if (turn > m_turn) {
        if (isSameField) {
            m_previousUnits = m_units;
            m_previousTurn = m_turn;
        } else {
            m_previousUnits = 0;
            m_previousTurn = 0;
        }
    }

    // Figure out unit count.
    if (size == UnitsKnown) {
        // Units known exactly.
        m_units = sizeValue;
    } else {
        // Units not known exactly. Check range.
        const int32_t newUnits = util::squareInteger(sizeValue);

        /* THost uses ERND(Sqrt(units)), PHost uses Trunc(Sqrt(units)).
           Therefore, actual radius is [r,r+1) in PHost, [r-.5,r+.5] for
           THost. Hence, possible unit ranges corresponding to this
           radius are (r-.5)² = r²-r-.25 and (r+1)². */
        const int32_t minUnits = newUnits - sizeValue - 1;
        const int32_t maxUnits = util::squareInteger(sizeValue + 1);

        if (isSameField
            && m_turn == turn
            && m_units >= minUnits
            && m_units <  maxUnits)
        {
            // The minefield was already seen this turn, with better information (exact unit count).
            // No change.
        } else {
            m_units = newUnits;
        }
    }

    // Update minefield. Avoid updating the type if it is not reliably known.
    m_position = pos;
    m_owner = owner;
    m_turn = turn;
    switch (type) {
     case UnknownType:
        if (!isSameField) {
            // We don't know what type it is, but it's different from what we have in the database, so reset the type.
            m_isWeb = false;
        }
        break;
     case IsMine:
        m_isWeb = false;
        break;
     case IsWeb:
        m_isWeb = true;
        break;
    }

    // Update cause.
    if (reason > m_reason || !isSameField) {
        m_reason = reason;
    }
}

// /** Postprocessing after load. */
void
game::map::Minefield::internalCheck(int currentTurn, const game::HostVersion& host, const game::config::HostConfiguration& config)
{
    // ex GMinefield::internalCheck
    int32_t u = m_units;
    for (int i = m_turn; i < currentTurn; ++i) {
        u = getUnitsAfterDecay(u, host, config);
    }
    m_currentUnits = u;
    m_currentRadius = getRadiusFromUnits(u);
}

void
game::map::Minefield::erase()
{
    m_position = Point();
    m_owner = 0;
    m_isWeb = false;
    m_units = 0;
    m_turn = 0;
    m_reason = NoReason;
    m_previousTurn = 0;
    m_previousUnits = 0;
    m_currentRadius = 0;
    m_currentUnits = 0;
    sig_change.raise(getId());
}

bool
game::map::Minefield::isValid() const
{
    // This method does not exist in PCC 2.0.
    // We cannot let objects die (bug #308), so a swept minefield must be able to stay around.
    // A minefield cannot ever have owner zero, so that is our test.
    return m_owner != 0;
}

bool
game::map::Minefield::isWeb() const
{
    return m_isWeb;
}

game::map::Minefield::ReasonReport
game::map::Minefield::getReason() const
{
    // ex GMinefield::getAction
    // PCC2 also had a setAction which was not referenced.
    return m_reason;
}


int32_t
game::map::Minefield::getUnits() const
{
    return m_currentUnits;
}


// /** Compute mine decay for one turn. */
int32_t
game::map::Minefield::getUnitsAfterDecay(int32_t origUnits, const game::HostVersion& host, const game::config::HostConfiguration& config) const
{
    // ex GMinefield::getUnitsAfterDecay
    int decayRate = m_isWeb ? config[config.WebMineDecayRate](m_owner) : config[config.MineDecayRate](m_owner);
    if (!host.isRoundingMineDecay()) {
        /* PHost formula */
        return origUnits * (100 - decayRate) / 100;
    } else {
        /* THost formula (3.22.040). Actual formula is
             ERND(orig_units - orig_units*decay_rate/100)
           which should yield the same results. */
        return util::divideAndRoundToEven(origUnits * (100-decayRate), 100, 0);
    }
}

// /** Compute units used for laying. In PHost, this is after decay; in
//     THost it's before. */
int32_t
game::map::Minefield::getUnitsForLaying(const game::HostVersion& host, const game::config::HostConfiguration& config) const
{
    // ex GMinefield::getUnitsForLaying
    if (host.isMineLayingAfterMineDecay()) {
        return getUnitsAfterDecay(getUnits(), host, config);
    } else {
        return getUnits();
    } 
}

int
game::map::Minefield::getTurnLastSeen() const
{
    return m_turn;
}

int32_t
game::map::Minefield::getUnitsLastSeen() const
{
    return m_units;
}


// /** Compute successful passage rate. This is the inverse of the "hit
//     rate", for a given distance. Under THost, there is only "the" hit
//     rate. Under PHost, various options are arrayized, and dynamic by
//     experience and speed. This function returns the value for an
//     inexperienced ship owned by the current player, at warp 9 (=the
//     worst possible case).

//     Note that actually under THost the problem is much more
//     complicated due to the interesting implementation; see
//     <http://phost.de/~stefan/minehits.html>. We do not attempt to
//     emulate that here.

//     \param distance Distance to cover, in ly
//     \param cloaked  Whether ship is cloaked
//     \return Passage rate, [0.0, 1.0] */
double
game::map::Minefield::getPassRate(double distance, bool cloaked, int player, const game::config::HostConfiguration& config) const
{
    // ex GMinefield::getPassRate
    double rate = (isWeb()
                   ? config[config.WebMineHitOdds](player) * 0.01
                   : cloaked
                   ? config[config.MineHitOddsWhenCloakedX10](player) * 0.001
                   : config[config.MineHitOdds](player) * 0.01);
    if (rate <= 0) {
        /* Hit rate below zero -> pass rate is 1.0 */
        return 1.0;
    } else if (rate >= 1.0) {
        /* Hit rate is one -> pass rate is 0.0 */
        return 0.0;
    } else {
        /* Normal computation */
        return std::pow(1.0 - rate, distance);
    }
}


// /** Compute minefield radius from unit number. */
int32_t
game::map::Minefield::getRadiusFromUnits(int32_t units)
{
    // ex GMinefield::getRadiusFromUnits
    // FIXME: rounding?
    return int(std::sqrt(double(units)));
}
