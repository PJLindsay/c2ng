/**
  *  \file game/sim/planet.cpp
  */

#include "game/sim/planet.hpp"

game::sim::Planet::Planet()
    : m_defense(10),
      m_baseDefense(10),
      m_beamTech(0),
      m_torpedoTech(1),
      m_baseFighters(0)
{
    // ex GSimPlanet::GSimPlanet
    for (int i = 0; i < NUM_TORPEDO_TYPES; ++i) {
        m_baseTorpedoes[i] = 0;
    }
}

game::sim::Planet::~Planet()
{ }

// /** Get number of planetary defense posts. */
int
game::sim::Planet::getDefense() const
{
    // ex GSimPlanet::getDefense
    return m_defense;
}

// /** Change number of planetary defense posts. */
void
game::sim::Planet::setDefense(int defense)
{
    // ex GSimPlanet::setDefense
    m_defense = defense;
    markDirty();
}

// /** Get number of base defense posts. */
int
game::sim::Planet::getBaseDefense() const
{
    // ex GSimPlanet::getBaseDefense
    return m_baseDefense;
}

// /** Change number of base defense posts. */
void
game::sim::Planet::setBaseDefense(int baseDefense)
{
    // ex GSimPlanet::setBaseDefense
    m_baseDefense = baseDefense;
    markDirty();
}

// /** Get starbase beam tech level. Zero means no base. */
int
game::sim::Planet::getBaseBeamTech() const
{
    // ex GSimPlanet::getBaseBeamTech
    return m_beamTech;
}

// /** Change starbase beam tech level. Zero means no base. */
void
game::sim::Planet::setBaseBeamTech(int beamTech)
{
    // ex GSimPlanet::setBaseBeamTech
    m_beamTech = beamTech;
    markDirty();
}

// /** Get starbase torpedo tech level. */
int
game::sim::Planet::getBaseTorpedoTech() const
{
    // ex GSimPlanet::getBaseTorpTech
    return m_torpedoTech;
}

// /** Change starbase torpedo tech level. */
void
game::sim::Planet::setBaseTorpedoTech(int torpTech)
{
    // ex GSimPlanet::setBaseTorpTech
    m_torpedoTech = torpTech;
    markDirty();
}

// /** Get number of starbase fighters. */
int
game::sim::Planet::getNumBaseFighters() const
{
    // ex GSimPlanet::getBaseFighters
    return m_baseFighters;
}

// /** Change number of starbase fighters. */
void
game::sim::Planet::setNumBaseFighters(int baseFighters)
{
    // ex GSimPlanet::setBaseFighters
    m_baseFighters = baseFighters;
    markDirty();
}

// /** Get number of starbase torps of a given type. */
int
game::sim::Planet::getNumBaseTorpedoes(int type) const
{
    // ex GSimPlanet::getBaseTorps
    if (type > 0 && type <= NUM_TORPEDO_TYPES) {
        return m_baseTorpedoes[type-1];
    } else {
        return 0;
    }
}

// /** Change number of starbase torps of a given type. */
void
game::sim::Planet::setNumBaseTorpedoes(int type, int amount)
{
    // ex GSimPlanet::setBaseTorps
    if (type > 0 && type <= NUM_TORPEDO_TYPES) {
        m_baseTorpedoes[type-1] = amount;
        markDirty();
    }
}

bool
game::sim::Planet::hasBase() const
{
    return getBaseBeamTech() != 0;
}


// /** Get number of base torpedoes for a given tech. Computes the
//     effective torpedo count from all storage torpedoes. */
int32_t
game::sim::Planet::getNumBaseTorpedoesAsType(int type, const game::spec::ShipList& shipList) const
{
    // ex GSimPlanet::getBaseTorpsAsType
    using game::spec::Cost;

    // Total cost
    int32_t totalCost = 0;
    for (int i = 1; i <= NUM_TORPEDO_TYPES; ++i) {
        if (const game::spec::TorpedoLauncher* torp = shipList.launchers().get(i)) {
            totalCost += getNumBaseTorpedoes(i) * torp->cost().get(Cost::Money);
        }
    }

    // Individual launcher cost
    if (const game::spec::TorpedoLauncher* torp = shipList.launchers().get(type)) {
        const int32_t cost = torp->cost().get(Cost::Money);
        if (cost != 0) {
            totalCost /= cost;
        }
    }

    // FIXME: some range checking here?
    return totalCost;
}

bool
game::sim::Planet::hasImpliedAbility(Ability which, const game::spec::ShipList& /*shipList*/, const game::config::HostConfiguration& config) const
{
    // ex GSimPlanet::hasImpliedFunction
    switch (which) {
     case PlanetImmunityAbility:
     case FullWeaponryAbility:
     case CommanderAbility:
        return false;

     case TripleBeamKillAbility:
        return config.getPlayerRaceNumber(getOwner()) == 5;

     case DoubleBeamChargeAbility:
     case DoubleTorpedoChargeAbility:
     case ElusiveAbility:
     case SquadronAbility:
        return false;
    }
    return false;
}