/**
  *  \file client/tiles/shipcargotile.cpp
  */

#include "client/tiles/shipcargotile.hpp"
#include "afl/base/countof.hpp"
#include "afl/base/staticassert.hpp"
#include "afl/string/format.hpp"
#include "client/proxy/objectlistener.hpp"
#include "game/config/userconfiguration.hpp"
#include "game/map/ship.hpp"
#include "game/root.hpp"
#include "util/translation.hpp"
#include "util/unicodechars.hpp"

namespace {
    using gfx::Point;
    using gfx::Rectangle;

    enum {
        MineralLabel,
        MineralValue,
        MineralUnit,

        OtherLabel,
        OtherValue,
        OtherUnit,

        NumColumns
    };

    const int NumLines = 4;

    const int GAUGE_WIDTH = 130;

    const int HORIZONTAL_PAD = 5;
    const int VERTICAL_PAD = 5;

    void configureButton(ui::widgets::TextButton& button)
    {
        button.setColor(ui::Color_Yellow);
        button.setHoverColor(ui::Color_Fire+28);
        button.setFont(gfx::FontRequest().addSize(-1));
        button.setTextAlign(2, 0);
    }
}

class client::tiles::ShipCargoTile::Job : public util::Request<ShipCargoTile> {
 public:
    Data data;

    void handle(ShipCargoTile& t)
        { t.setData(data); }
};



client::tiles::ShipCargoTile::ShipCargoTile(ui::Root& root, client::widgets::KeymapWidget& kmw)
    : CollapsibleDataView(root),
      m_table(root, NumColumns, NumLines),
      m_fuelGauge(root, GAUGE_WIDTH),
      m_cargoGauge(root, GAUGE_WIDTH),
      m_cargoButton("C", 'c', root),
      m_unloadButton("U", 'u', root),
      m_reviewUnloadButton(String_t(), util::KeyMod_Ctrl + 'p', root),
      m_reviewTransferButton(String_t(), util::KeyMod_Ctrl + 's', root),
      m_receiver(root.engine().dispatcher(), *this)
{
    init(root, kmw);
}

void
client::tiles::ShipCargoTile::init(ui::Root& root, client::widgets::KeymapWidget& kmw)
{
    // Configure the table
    // FIXME: use skin colors
    int numberWidth = root.provider().getFont(gfx::FontRequest())->getTextWidth("999,999");
    m_table.column(MineralLabel).setColor(ui::Color_Gray);
    m_table.column(MineralValue).setColor(ui::Color_Green).setTextAlign(2, 0);
    m_table.column(MineralUnit).setColor(ui::Color_Green);
    m_table.column(OtherLabel).setColor(ui::Color_Gray);
    m_table.column(OtherValue).setColor(ui::Color_Green).setTextAlign(2, 0);
    m_table.column(OtherUnit).setColor(ui::Color_Green);
    m_table.setColumnWidth(MineralValue, numberWidth);
    m_table.setColumnPadding(MineralValue, HORIZONTAL_PAD);
    m_table.setColumnPadding(MineralUnit, 2*HORIZONTAL_PAD);
    m_table.setColumnWidth(OtherValue, numberWidth);
    m_table.setColumnPadding(OtherValue, HORIZONTAL_PAD);

    m_table.cell(MineralLabel, 0).setText(_("Neu:"));
    m_table.cell(MineralLabel, 1).setText(_("Tri:"));
    m_table.cell(MineralLabel, 2).setText(_("Dur:"));
    m_table.cell(MineralLabel, 3).setText(_("Mol:"));
    m_table.column(MineralUnit).setText(_("kt"));

    m_table.cell(OtherLabel, 0).setText(_("Colonists:"));
    m_table.cell(OtherLabel, 1).setText(_("Supplies:"));
    m_table.cell(OtherLabel, 2).setText(_("Money:"));
    m_table.cell(OtherLabel, 3).setText(_("Total Mass:"));
    m_table.cell(OtherUnit, 1).setText(_("kt"));
    m_table.cell(OtherUnit, 2).setText(_("mc"));
    m_table.cell(OtherUnit, 3).setText(_("kt"));

    // Configure gauges
    m_fuelGauge.setBarColor(ui::Color_GreenBlack);
    m_cargoGauge.setBarColor(ui::Color_Blue);

    // Configure cargo buttons
    configureButton(m_reviewTransferButton);
    configureButton(m_reviewUnloadButton);

    // Attach buttons
    m_cargoButton.dispatchKeyTo(kmw);
    m_unloadButton.dispatchKeyTo(kmw);
    m_reviewUnloadButton.dispatchKeyTo(kmw);
    m_reviewTransferButton.dispatchKeyTo(kmw);

    // Add widgets
    addChild(m_table, 0);
    addChild(m_fuelGauge, 0);
    addChild(m_cargoGauge, 0);
    addChild(m_cargoButton, 0);
    addChild(m_unloadButton, 0);
    addChild(m_reviewUnloadButton, 0);
    addChild(m_reviewTransferButton, 0);
}

void
client::tiles::ShipCargoTile::attach(client::proxy::ObjectObserver& oop)
{
    class Listener : public client::proxy::ObjectListener {
     public:
        Listener(util::RequestSender<ShipCargoTile> reply)
            : m_reply(reply)
            { }
        virtual void handle(game::Session& s, game::map::Object* obj)
            {
                // ex WShipCargoTile::drawShipCargoTile [sort-of]
                std::auto_ptr<Job> job(new Job());
                game::map::Ship* sh = dynamic_cast<game::map::Ship*>(obj);
                game::Root* root = s.getRoot().get();
                game::spec::ShipList* shipList = s.getShipList().get();
                if (sh != 0 && root != 0 && shipList != 0) {
                    game::config::UserConfiguration& uc = root->userConfiguration();

                    // Left column
                    job->data.formattedAmounts[Data::Neutronium] = uc.formatNumber(sh->getCargo(game::Element::Neutronium));
                    job->data.formattedAmounts[Data::Tritanium]  = uc.formatNumber(sh->getCargo(game::Element::Tritanium));
                    job->data.formattedAmounts[Data::Duranium]   = uc.formatNumber(sh->getCargo(game::Element::Duranium));
                    job->data.formattedAmounts[Data::Molybdenum] = uc.formatNumber(sh->getCargo(game::Element::Molybdenum));

                    // Right column
                    job->data.formattedAmounts[Data::Colonists]  = uc.formatPopulation(sh->getCargo(game::Element::Colonists));
                    job->data.formattedAmounts[Data::Supplies]   = uc.formatNumber(sh->getCargo(game::Element::Supplies));
                    job->data.formattedAmounts[Data::Money]      = uc.formatNumber(sh->getCargo(game::Element::Money));
                    job->data.formattedAmounts[Data::TotalMass]  = uc.formatNumber(sh->getMass(*shipList));

                    // Gauges
                    if (game::spec::Hull* pHull = shipList->hulls().get(sh->getHull().orElse(0))) {
                        int have;
                        if (sh->getCargo(game::Element::Neutronium).get(have)) {
                            int total = pHull->getMaxFuel();
                            job->data.gaugeHave[Data::FuelGauge] = have;
                            job->data.gaugeTotal[Data::FuelGauge] = total;
                            job->data.gaugeLabels[Data::FuelGauge] = afl::string::Format(_("Fuel: %d free").c_str(), total - have);
                        }

                        int32_t free;
                        if (sh->getFreeCargo(*shipList).get(free)) {
                            int total = pHull->getMaxCargo();
                            job->data.gaugeHave[Data::CargoGauge] = total - free;
                            job->data.gaugeTotal[Data::CargoGauge] = total;
                            job->data.gaugeLabels[Data::CargoGauge] = afl::string::Format(_("Cargo: %d free").c_str(), free);
                        }
                    }

                    // Transfer
                    // ex WShipCargoButton::onObjectChanged [sort-of]
                    job->data.transferReview = (sh->isTransporterActive(sh->TransferTransporter) ? Data::ShipTransfer : Data::NoTransfer);

                    // FIXME: support bum
                    //     /* We're observing the ship->planet transporter */
                    //     bool bum = config.AllowBeamUpMultiple()
                    //         && getDisplayedTurn().getCommands(s->getOwner()).getCommand(GCommand::phc_Beamup, s->getId()) != 0;
                    bool bum = false;
                    job->data.unloadReview =
                        (sh->isTransporterActive(sh->UnloadTransporter)
                         ? (sh->getTransporterTargetId(sh->UnloadTransporter).orElse(0) == 0
                            ? Data::JettisonTransfer
                            : bum
                            ? Data::BidiTransfer
                            : Data::UnloadTransfer)
                         : (bum
                            ? Data::GatherTransfer
                            : Data::NoTransfer));
                }
                m_reply.postNewRequest(job.release());
            }
     private:
        util::RequestSender<ShipCargoTile> m_reply;
    };

    oop.addNewListener(new Listener(m_receiver.getSender()));
}

void
client::tiles::ShipCargoTile::setData(const Data& data)
{
    // Update table
    static_assert(countof(data.formattedAmounts) >= 2*NumLines, "countof formattedAmounts");
    for (size_t i = 0; i < NumLines; ++i) {
        m_table.cell(MineralValue, i).setText(data.formattedAmounts[i]);
        m_table.cell(OtherValue,   i).setText(data.formattedAmounts[i+NumLines]);
    }

    // Update gauges
    setGaugeData(m_fuelGauge,  data, Data::FuelGauge);
    setGaugeData(m_cargoGauge, data, Data::CargoGauge);

    // Update buttons
    setReviewData(m_reviewTransferButton, data.transferReview);
    setReviewData(m_reviewUnloadButton, data.unloadReview);
}

void
client::tiles::ShipCargoTile::setChildPositions()
{
    // Data content
    Point anchor = getAnchorPoint(LeftAligned + DataAligned);

    Point tableSize = m_table.getLayoutInfo().getPreferredSize();
    Point fuelSize  = m_fuelGauge.getLayoutInfo().getPreferredSize();
    Point cargoSize = m_cargoGauge.getLayoutInfo().getPreferredSize();

    m_table.setExtent(Rectangle(anchor, tableSize));
    anchor.addY(tableSize.getY() + VERTICAL_PAD);

    m_fuelGauge.setExtent(Rectangle(anchor, fuelSize));
    anchor.addX(fuelSize.getX() + HORIZONTAL_PAD);

    m_cargoGauge.setExtent(Rectangle(anchor, cargoSize));

    // Buttons
    Point buttonAnchor = getAnchorPoint(0);
    const int GRID = root().provider().getFont(gfx::FontRequest().addSize(1))->getTextHeight("Tp") * 9/8 - 4;
    m_cargoButton.setExtent(Rectangle(buttonAnchor.getX() - GRID-2, buttonAnchor.getY(), GRID, GRID));
    m_unloadButton.setExtent(Rectangle(buttonAnchor.getX() - 2*GRID-6, buttonAnchor.getY(), GRID, GRID));
    buttonAnchor.addY(GRID+4);

    const int HEIGHT = root().provider().getFont(gfx::FontRequest().addSize(-1))->getTextHeight("Tp");
    m_reviewUnloadButton.setExtent(Rectangle(buttonAnchor.getX() - GRID-2, buttonAnchor.getY(), GRID, HEIGHT));
    buttonAnchor.addY(HEIGHT);
    m_reviewTransferButton.setExtent(Rectangle(buttonAnchor.getX() - GRID-2, buttonAnchor.getY(), GRID, HEIGHT));
}

gfx::Point
client::tiles::ShipCargoTile::getPreferredChildSize() const
{
    Point tableSize = m_table.getLayoutInfo().getPreferredSize();
    Point fuelSize  = m_fuelGauge.getLayoutInfo().getPreferredSize();
    Point cargoSize = m_cargoGauge.getLayoutInfo().getPreferredSize();

    return Point(std::max(tableSize.getX(),
                          fuelSize.getX() + HORIZONTAL_PAD + cargoSize.getX()),
                 tableSize.getY() + VERTICAL_PAD + std::max(fuelSize.getY(),
                                                            cargoSize.getY()));

}

void
client::tiles::ShipCargoTile::setGaugeData(client::widgets::SimpleGauge& gauge, const Data& data, size_t index)
{
    gauge.setValues(data.gaugeHave[index], data.gaugeTotal[index], data.gaugeLabels[index]);
    gauge.setTextColor(data.gaugeHave[index] > data.gaugeTotal[index]
                       ? ui::Color_Red
                       : ui::Color_White);
}

void
client::tiles::ShipCargoTile::setReviewData(ui::widgets::TextButton& button, Data::Transfer t)
{
    const char* text = "";
    util::Key_t key = 0;
    switch (t) {
     case Data::NoTransfer:                                                                       break;
     case Data::ShipTransfer:     text = UTF_RIGHT_ARROW      "S"; key = util::KeyMod_Ctrl + 's'; break;
     case Data::UnloadTransfer:   text = UTF_RIGHT_ARROW      "P"; key = util::KeyMod_Ctrl + 'p'; break;
     case Data::GatherTransfer:   text = UTF_LEFT_ARROW       "P";                                break;
     case Data::BidiTransfer:     text = UTF_LEFT_RIGHT_ARROW "P"; key = util::KeyMod_Ctrl + 'p'; break;
     case Data::JettisonTransfer: text = UTF_RIGHT_ARROW      "J"; key = util::KeyMod_Ctrl + 'j'; break;
    }
    button.setText(text);
    button.setKey(key);
}
