/**
  *  \file game/actions/buildstructures.hpp
  *  \brief Class game::actions::BuildStructures
  */
#ifndef C2NG_GAME_ACTIONS_BUILDSTRUCTURES_HPP
#define C2NG_GAME_ACTIONS_BUILDSTRUCTURES_HPP

#include "game/types.hpp"
#include "game/map/planet.hpp"
#include "game/cargocontainer.hpp"
#include "game/actions/cargocostaction.hpp"
#include "game/config/hostconfiguration.hpp"

namespace game { namespace actions {

    /** Building planetary structures.

        This class allows you to build structures on a planet.
        The cost can be billed to any container, but typically it will be the PlanetStorage.
        The class enforces that maximum limits are never exceeded
        (i.e. it will never go into an error state because of exceeded building limits, it will simply never let you build so much),
        but you can build more than you have money for (to compute the price). */
    class BuildStructures {
     public:
        /** Constructor.
            The action starts out with no modification.
            Call setUndoInformation() if you intend to scrap buildings.
            \param planet    The planet we are building on.
                             Lifetime must exceed that of the BuildStructures action.
            \param container Container that will be billed the cost.
                             Lifetime must exceed that of the BuildStructures action, the BuildStructures will commit the container.
            \param config    Host configuration.
                             Lifetime must exceed that of the BuildStructures action. */
        BuildStructures(game::map::Planet& planet, CargoContainer& container, const game::config::HostConfiguration& config);

        /** Destructor. */
        ~BuildStructures();

        /** Set undo information.
            This enables this transaction to undo former builds.
            This uses the universe's reverter, if any.
            \param univ Universe */
        void setUndoInformation(const game::map::Universe& univ);

        /** Add structures.
            This will not add or remove more than allowed by the rules, but it can add more than there is cash for.
            When adding more than there are resources for, the transaction will go invalid (!isValid()).

            \param type building type
            \param count Number of buildings to add (negative to remove)
            \param partial true to allow partial execution

            \return number of buildings added (negative if removed).
            With partial=false, the return value is guaranteed to be either 0 or count. */
        int add(PlanetaryBuilding type, int count, bool partial);

        /** Add structures, limited by resources.
            If the transaction is valid, this will not cause it to go invalid.
            \param type building type
            \param count Number of buildings to add (negative to remove)
            \return number of buildings added (negative if removed). */
        int addLimitCash(PlanetaryBuilding type, int count);

        /** Autobuild.
            Performs standard auto-build operation, and leaves result in this transaction.
            You must still commit it.
            If the transaction is valid, this will not cause it to go invalid. */
        void doStandardAutoBuild();

        /** Get minimum number of buildings permitted in this transaction.
            \param type building type
            \return limit */
        int getMinBuildings(PlanetaryBuilding type) const;

        /** Get maximum number of buildings permitted in this transaction.
            \param type building type
            \return limit */
        int getMaxBuildings(PlanetaryBuilding type) const;

        /** Get current target number of buildings.
            \param type building type
            \return number */
        int getNumBuildings(PlanetaryBuilding type) const;

        /** Commit transaction.
            This will build the structures and commit the billed container.
            \throw Exception if !isValid() */
        void commit();

        /** Check validity.
            The transaction is invalid if the cost exceeds what's available on the container.
            \return validity flag */
        bool isValid() const;

        /** Access underlying CargoCostAction.
            \return CargoCostAction */
        const CargoCostAction& costAction() const;

        /** Signal: change.
            Called when anything in this transaction changes. */
        afl::base::Signal<void()> sig_change;

     private:
        game::map::Planet& m_planet;

        CargoCostAction m_costAction;

        const game::config::HostConfiguration& m_hostConfiguration;

        struct Data {
            int   order;            ///< Amount selected by user.
            int   max;              ///< Maximum amount allowed by rules.
            int   min;              ///< Minimum amount allowed by rules (undo).
        };
        Data m_data[NUM_PLANETARY_BUILDING_TYPES];

        afl::base::SignalConnection m_planetChangeConnection;
        afl::base::SignalConnection m_costChangeConnection;

        void updateUpperLimits();
        void updateCost();
        void updatePlanet();
    };

} }

#endif
