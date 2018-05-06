/**
  *  \file game/shipquery.hpp
  */
#ifndef C2NG_GAME_SHIPQUERY_HPP
#define C2NG_GAME_SHIPQUERY_HPP

#include "game/types.hpp"
#include "game/experiencelevelset.hpp"
#include "game/playerset.hpp"
#include "game/map/universe.hpp"
#include "game/spec/shiplist.hpp"
#include "game/config/hostconfiguration.hpp"
#include "game/unitscoredefinitionlist.hpp"

namespace game {

    /** Ship query.
        This class contains information required to query for ship properties, such as
        - hull functions
        - hull specification
        - weapon effects

        It is a union of the PCC 1.x structures THullFuncSelection and TShipInformation. */
    class ShipQuery {
     public:
        /** Constructor.
            Makes a blank object. */
        ShipQuery();

        /** Clear.
            Makes this object blank. */
        void clear();

        /** Initialize for existing ship.
            If an existing ship Id is given, this configures the query to get the closest-possible
            approximation of the ship's real abilities.
            If the ship Id does not exist, the object remains in a zombie state (produces no result).
            \param univ Universe
            \param shipId Ship Id from that universe
            \param shipList Ship list
            \param config Host configuration
            \param scoreDefs Ship score definitions */
        void initForExistingShip(const game::map::Universe& univ,
                                 int shipId,
                                 const game::spec::ShipList& shipList,
                                 const game::config::HostConfiguration& config,
                                 const UnitScoreDefinitionList& scoreDefs);

        /** Complete query.
            If partial information has been given, completes the missing part from the given environment.
            \param univ Universe (provides ship data)
            \param shipList Ship list (provides hull specs)
            \param config Host configuration (provides settings)
            \param scoreDefs Score definitions (provides access to experience levels)
            \param defaultOwner Default owner to use */
        void complete(const game::map::Universe& univ,
                      const game::spec::ShipList& shipList,
                      const game::config::HostConfiguration& config,
                      const UnitScoreDefinitionList& scoreDefs,
                      int defaultOwner);

        /** Enumerate ship functions.
            If this query describes an existing ship, enumerates that ship's functions.
            If this query describes a hull, enumerates the functions a newly-built ship would have.
            \param list [out] Hull function list
            \param univ [in] Universe
            \param shipList [in] Ship list
            \param config [in] Host configuration
            \param includeRacialAbilities [in] true to include racial abilities */
        void enumerateShipFunctions(game::spec::HullFunctionList& list,
                                    const game::map::Universe& univ,
                                    const game::spec::ShipList& shipList,
                                    const game::config::HostConfiguration& config,
                                    bool includeRacialAbilities) const;

        /** Compare for equality.
            \param other Other query
            \return true if queries are identical */
        bool operator==(const ShipQuery& other) const;

        /** Compare for inequality.
            \param other Other query
            \return true if queries are different */
        bool operator!=(const ShipQuery& other) const;

        /** Get hull type.
            \return hull number, 0 if not known */
        int getHullType() const;

        /** Set hull type.
            \param id Hull number, 0 if not known */
        void setHullType(int id);

        /** Get ship Id.
            \return ship Id, 0 if not known */
        Id_t getShipId() const;

        /** Set ship Id.
            \param id ship Id, 0 if not known */
        void setShipId(Id_t id);

        /** Get experience level filter.
            The filter limits returned ship functions to those that are available at at least one level from the set.
            By default, all abilities are returned.
            \return level set */
        ExperienceLevelSet_t getLevelFilterSet() const;

        /** Set experience level filter.
            \param set Level set */
        void setLevelFilterSet(ExperienceLevelSet_t set);

        /** Get display level set.
            This filter only affects display (which abilities are marked active).
            \return level set */
        ExperienceLevelSet_t getLevelDisplaySet() const;

        /** Set display level set.
            \param set Level set */
        void setLevelDisplaySet(ExperienceLevelSet_t set);

        /** Get player filter.
            The filter limits returned ship functions to those that are available to at least one of player from the set.
            By default, all abilities are returned.
            \return player set */
        PlayerSet_t getPlayerFilterSet() const;

        /** Set player filter.
            \param set player set */
        void setPlayerFilterSet(PlayerSet_t set);

        /** Get display player set.
            This filter only affects display (which abilities are marked active).
            \return player set */
        PlayerSet_t getPlayerDisplaySet() const;

        /** Set display player set.
            \param set player set */
        void setPlayerDisplaySet(PlayerSet_t set);

        /** Get engine type.
            \return engine type, 0 if not known */
        int getEngineType() const;

        /** Set engine type.
            \param type engine type, 0 if not known */
        void setEngineType(int type);

        /** Get combat mass.
            \return total combat mass including all bonuses */
        int getCombatMass() const;

        /** Get used engine shield bonus rate.
            \return used E/S bonus rate (EngineShieldBonusRate config option plus all modifiers) */
        int getUsedESBRate() const;

        /** Set combat mass parameters.
            \param mass total combat mass including all bonuses
            \param usedESB used E/S bonus rate */
        void setCombatMass(int mass, int usedESB);

        /** Get crew size.
            \return crew size */
        int getCrew() const;

        /** Set crew size.
            \param crew crew size */
        void setCrew(int crew);

        /** Get owner.
            \return owner, 0 if not known */
        int getOwner() const;

        /** Set owner.
            \param id Owner, 0 if not known */
        void setOwner(int id);

     private:
        int hull_id;                      ///< Hull Id. Zero if not known.
        int ship_id;                      ///< Ship Id. Zero if not known.

        ExperienceLevelSet_t filter_level_set;    ///< Experience levels for filtering. Display only those that match this filter.
        ExperienceLevelSet_t display_level_set;   ///< Experience levels for display. Those matching this filter are shown as active.

        PlayerSet_t filter_player_set;     ///< Owner mask for filtering. Display only those that match this filter.
        PlayerSet_t display_player_set;    ///< Owner mask for display. Those matching this filter are shown as active.

        int engine_id;                    ///< Engine number. Zero if not known.
        int combat_mass;                  ///< Combat mass. Zero if not known.
        int crew;                         ///< Crew. Zero if not known.
        int owner;                        ///< Ship owner. Zero if not known.
        int used_esb;                     ///< Used Engine-Shield bonus. Set if combat_mass includes ESB.
    };
    
}

#endif
