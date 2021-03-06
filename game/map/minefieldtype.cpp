/**
  *  \file game/map/minefieldtype.cpp
  */

#include "game/map/minefieldtype.hpp"

game::map::MinefieldType::MinefieldType(Universe& univ)
    : ObjectVector<Minefield>(),
      ObjectVectorType<Minefield>(univ, *this),
      m_allMinefieldsKnown()
{ }

game::map::MinefieldType::~MinefieldType()
{ }

bool
game::map::MinefieldType::isValid(const Minefield& obj) const
{
    return obj.isValid();
}

void
game::map::MinefieldType::erase(Id_t id)
{
    // ex GMinefieldType::erase, sort-of
    if (Minefield* p = get(id)) {
        if (p->isValid()) {
            p->erase();
            sig_setChange.raise(0);
        }
    }
}

// /** Note that all minefields of a player are known with current data.
//     This means alternatively that if we have a minefield of this player in the history,
//     and did not scan it this turn, it is gone. This happens for Winplan result files
//     (KORE minefields). */
void
game::map::MinefieldType::setAllMinefieldsKnown(int player)
{
    // ex GMinefieldType::markAllMinefieldsKnown
    m_allMinefieldsKnown += player;
}

// /** Internal check/postprocess.
//     Postprocess all minefields and delete those that are gone.
//     \param turnNr current turn */
void
game::map::MinefieldType::internalCheck(int currentTurn, const game::HostVersion& host, const game::config::HostConfiguration& config)
{
    // ex GMinefieldType::internalCheck
    for (Id_t id = 1, n = size(); id <= n; ++id) {
        if (Minefield* mf = get(id)) {
            // If it's valid, update it
            if (mf->isValid()) {
                mf->internalCheck(currentTurn, host, config);
            }

            // Erase it if
            // - it reports gone anyway (clean up if it has an inconsistent state)
            // - it has no units remaining
            // - it was not seen this turn although we think it should
            int owner;
            if (!mf->getOwner(owner)
                || !mf->isValid()
                || mf->getUnits() == 0
                || (mf->getTurnLastSeen() < currentTurn && m_allMinefieldsKnown.contains(owner)))
            {
                mf->erase();
            }
        }
    }
}

void
game::map::MinefieldType::addMessageInformation(const game::parser::MessageInformation& info)
{
    // ex GMinefieldType::addMinefieldReport
    namespace gp = game::parser;
    Minefield* existing = get(info.getObjectId());

    // Find position
    Point pt;
    int32_t x, y;
    if (info.getValue(gp::mi_X, x) && info.getValue(gp::mi_Y, y)) {
        // New position
        pt = Point(x, y);
    } else if (existing != 0 && existing->getPosition(pt)) {
        // Keep old position
    } else {
        // No position known, cannot use this report
        return;
    }

    // Find owner
    int32_t owner;
    if (info.getValue(gp::mi_Owner, owner)) {
        // New owner
    } else if (existing != 0 && existing->getOwner(owner)) {
        // Keep old owner
    } else {
        // No owner known, cannot use this report
        return;
    }

    // Find size. A report without a size is useless and therefore ignored.
    int32_t size;
    Minefield::SizeReport sizeType;
    if (info.getValue(gp::mi_MineUnits, size)) {
        sizeType = Minefield::UnitsKnown;
    } else if (info.getValue(gp::mi_Radius, size)) {
        sizeType = Minefield::RadiusKnown;
    } else {
        // FIXME: can we deal with mi_MineUnitsRemoved?
        return;
    }

    // Find type
    int32_t rawType;
    Minefield::TypeReport type;
    if (info.getValue(gp::mi_Type, rawType)) {
        type = (rawType != 0 ? Minefield::IsWeb : Minefield::IsMine);
    } else {
        type = Minefield::UnknownType;
    }

    // Find reason
    int32_t rawReason;
    Minefield::ReasonReport reason;
    if (info.getValue(gp::mi_MineScanReason, rawReason)) {
        if (rawReason <= 0) {
            reason = Minefield::NoReason;
        } else if (rawReason == 1) {
            reason = Minefield::MinefieldLaid;
        } else if (rawReason == 2) {
            reason = Minefield::MinefieldSwept;
        } else {
            reason = Minefield::MinefieldScanned;
        }
    } else {
        reason = Minefield::MinefieldScanned;
    }

    // Process it:
    // If it's a report about an existing, still-unknown field, create it.
    // If it's a report about a now-nonexistant, known field, just add it; internalCheck() will clean up.
    if (existing == 0 && size > 0) {
        existing = create(info.getObjectId());
    }
    if (existing != 0) {
        existing->addReport(pt, owner, type, sizeType, size, info.getTurnNumber(), reason);
    }
}
