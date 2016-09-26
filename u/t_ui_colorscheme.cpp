/**
  *  \file u/t_ui_colorscheme.cpp
  *  \brief Test for ui::ColorScheme
  */

#include "ui/colorscheme.hpp"

#include "t_ui.hpp"
#include "gfx/rgbapixmap.hpp"
#include "gfx/context.hpp"

/** Test background drawing. */
void
TestUiColorScheme::testBackground()
{
    const size_t N = 20;

    // Initialize
    ui::ColorScheme testee;
    afl::base::Ptr<gfx::RGBAPixmap> pix = gfx::RGBAPixmap::create(N, N);
    afl::base::Ptr<gfx::Canvas> can = pix->makeCanvas();
    testee.init(*can);
    pix->pixels().fill(1234578);

    // Draw background
    gfx::Context ctx(*can);
    testee.drawBackground(ctx, gfx::Rectangle(0,0,N,N));

    // Verify
    afl::base::Memory<const uint32_t> pixels = pix->pixels();
    TS_ASSERT_EQUALS(pixels.size(), N*N);
    while (const uint32_t* p = pixels.eat()) {
        TS_ASSERT_EQUALS(*p, COLORQUAD_FROM_RGB(0,0,0));
    }
}

/** Test that we can get every color, even out-of-range ones. */
void
TestUiColorScheme::testColor()
{
    // Use a RGBAPixmap to initialize the palette to a 1:1 mapping
    ui::ColorScheme testee;
    afl::base::Ptr<gfx::Canvas> can = gfx::RGBAPixmap::create(1, 1)->makeCanvas();
    testee.init(*can);

    // Test we can get everything
    for (uint32_t i = 0; i < 1000; ++i) {
        testee.getColor(i);
    }

    // Out-of-range colors must report black
    for (uint32_t i = 1000; i < 10000; ++i) {
        TS_ASSERT_EQUALS(testee.getColor(i), COLORQUAD_FROM_RGB(0,0,0));
    }
}