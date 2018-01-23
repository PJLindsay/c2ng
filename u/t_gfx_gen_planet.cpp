/**
  *  \file u/t_gfx_gen_planet.cpp
  *  \brief Test for gfx::gen::Planet
  */

#include "gfx/gen/planet.hpp"

#include "t_gfx_gen.hpp"
#include "afl/base/countof.hpp"
#include "gfx/gen/vector3d.hpp"
#include "gfx/rgbapixmap.hpp"

namespace {
    const gfx::ColorQuad_t COLORS[] = { COLORQUAD_FROM_RGB(0,0,0), COLORQUAD_FROM_RGB(255,255,255) };
}

/** Regression test: normal size. */
void
TestGfxGenPlanet::testIt()
{
    using gfx::gen::Planet;

    // Prepare
    afl::base::Ref<gfx::RGBAPixmap> pix = gfx::RGBAPixmap::create(10, 10);
    util::RandomNumberGenerator rng(0);

    // Render a default planet
    Planet(*pix).renderPlanet(Planet::ValueVector_t(5, 5, 0), 4, COLORS, 2, Planet::ValueVector_t(-10, -10, 0), rng);

    // Compare expectation
    static const gfx::ColorQuad_t EXPECTED[] = {
        0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x242424FF, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x00000000, 0x00000000, 0x0A0A0AFF, 0x323232FF, 0x262626FF, 0x272727FF, 0x393939FF, 0x00000000, 0x00000000,
        0x00000000, 0x00000000, 0x0A0A0AFF, 0x1F1F1FFF, 0x3F3F3FFF, 0x5C5C5CFF, 0x303030FF, 0x4D4D4DFF, 0x555555FF, 0x00000000,
        0x00000000, 0x00000000, 0x383838FF, 0x343434FF, 0x4E4E4EFF, 0x434343FF, 0x3D3D3DFF, 0x3A3A3AFF, 0x858585FF, 0x00000000,
        0x00000000, 0x373737FF, 0x616161FF, 0x696969FF, 0x636363FF, 0x626262FF, 0x8B8B8BFF, 0xBCBCBCFF, 0x717171FF, 0xC3C3C3FF,
        0x00000000, 0x00000000, 0x4D4D4DFF, 0x383838FF, 0x656565FF, 0x4A4A4AFF, 0x757575FF, 0xB0B0B0FF, 0xA6A6A6FF, 0x00000000,
        0x00000000, 0x00000000, 0x545454FF, 0x535353FF, 0x808080FF, 0x8B8B8BFF, 0x676767FF, 0x8F8F8FFF, 0x868686FF, 0x00000000,
        0x00000000, 0x00000000, 0x00000000, 0x909090FF, 0x939393FF, 0x8E8E8EFF, 0x818181FF, 0x9B9B9BFF, 0x00000000, 0x00000000,
        0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x686868FF, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    };
    TS_ASSERT_EQUALS(pix->pixels().size(), countof(EXPECTED));
    TS_ASSERT_SAME_DATA(pix->pixels().unsafeData(), EXPECTED, sizeof(EXPECTED));
}

/** Regression test: large planet (larger than image). */
void
TestGfxGenPlanet::testLarge()
{
    using gfx::gen::Planet;

    // Prepare
    afl::base::Ref<gfx::RGBAPixmap> pix = gfx::RGBAPixmap::create(10, 10);
    util::RandomNumberGenerator rng(0);

    // Render a default planet
    Planet(*pix).renderPlanet(Planet::ValueVector_t(5, 5, 0), 10, COLORS, 2, Planet::ValueVector_t(-10, -10, 0), rng);

    // Compare expectation
    static const gfx::ColorQuad_t EXPECTED[] = {
        0x1F1F1FFF, 0x323232FF, 0x434343FF, 0x2E2E2EFF, 0x474747FF, 0x5C5C5CFF, 0x474747FF, 0x313131FF, 0x2A2A2AFF, 0x282828FF,
        0x242424FF, 0x272727FF, 0x2B2B2BFF, 0x434343FF, 0x424242FF, 0x565656FF, 0x404040FF, 0x494949FF, 0x3A3A3AFF, 0x262626FF,
        0x2D2D2DFF, 0x3F3F3FFF, 0x454545FF, 0x555555FF, 0x3B3B3BFF, 0x454545FF, 0x454545FF, 0x595959FF, 0x6F6F6FFF, 0x424242FF,
        0x3B3B3BFF, 0x3D3D3DFF, 0x545454FF, 0x525252FF, 0x606060FF, 0x484848FF, 0x484848FF, 0x484848FF, 0x3D3D3DFF, 0x4A4A4AFF,
        0x616161FF, 0x545454FF, 0x575757FF, 0x585858FF, 0x626262FF, 0x757575FF, 0x8D8D8DFF, 0x8E8E8EFF, 0x808080FF, 0x9B9B9BFF,
        0x696969FF, 0x787878FF, 0x727272FF, 0x555555FF, 0x5F5F5FFF, 0x626262FF, 0x707070FF, 0x979797FF, 0x9E9E9EFF, 0xBBBBBBFF,
        0x4B4B4BFF, 0x6B6B6BFF, 0x7D7D7DFF, 0x575757FF, 0x525252FF, 0x535353FF, 0x686868FF, 0x7F7F7FFF, 0x979797FF, 0xA9A9A9FF,
        0x363636FF, 0x494949FF, 0x646464FF, 0x636363FF, 0x515151FF, 0x494949FF, 0x535353FF, 0x6F6F6FFF, 0x888888FF, 0x9F9F9FFF,
        0x353535FF, 0x313131FF, 0x313131FF, 0x4B4B4BFF, 0x4A4A4AFF, 0x4E4E4EFF, 0x575757FF, 0x636363FF, 0x7C7C7CFF, 0x989898FF,
        0x4E4E4EFF, 0x474747FF, 0x737373FF, 0x595959FF, 0x535353FF, 0x737373FF, 0x8A8A8AFF, 0x878787FF, 0x757575FF, 0x838383FF,
    };
    TS_ASSERT_EQUALS(pix->pixels().size(), countof(EXPECTED));
    TS_ASSERT_SAME_DATA(pix->pixels().unsafeData(), EXPECTED, sizeof(EXPECTED));
}
