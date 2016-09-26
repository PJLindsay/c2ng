/**
  *  \file ui/widgets/statictext.cpp
  */

#include "ui/widgets/statictext.hpp"
#include "gfx/context.hpp"
#include "gfx/complex.hpp"

ui::widgets::StaticText::StaticText(const String_t& text, util::SkinColor::Color color, gfx::FontRequest font, gfx::ResourceProvider& provider, int align)
    : SimpleWidget(),
      m_text(text),
      m_color(color),
      m_font(font),
      m_provider(provider),
      m_align(align),
      m_isFlexible(false)
{
    // ex UIStaticText::UIStaticText
    setState(DisabledState, true);
}

ui::widgets::StaticText::StaticText(const char* text, util::SkinColor::Color color, gfx::FontRequest font, gfx::ResourceProvider& provider, int align)
    : SimpleWidget(),
      m_text(text),
      m_color(color),
      m_font(font),
      m_provider(provider),
      m_align(align),
      m_isFlexible(false)
{
    setState(DisabledState, true);
}

ui::widgets::StaticText&
ui::widgets::StaticText::setText(const String_t& text)
{
    // ex UIStaticText::setText
    m_text = text;
    requestRedraw();
    return *this;
}

ui::widgets::StaticText&
ui::widgets::StaticText::setIsFlexible(bool flex)
{
    // ex UIStaticText::setFlexible
    m_isFlexible = flex;
    return *this;
}

// SimpleWidget:
void
ui::widgets::StaticText::draw(gfx::Canvas& can)
{
    // ex UIStaticText::drawContent
    afl::base::Ptr<gfx::Font> font = m_provider.getFont(m_font);
    if (font.get() != 0) {
        gfx::Context ctx(can);
        ctx.useColorScheme(getColorScheme());
        ctx.setColor(m_color);
        ctx.useFont(*font);
        ctx.setTextAlign(m_align, 1);
        drawBackground(ctx, getExtent());
        outTextF(ctx, getExtent(), m_text);
    }
}

void
ui::widgets::StaticText::handleStateChange(State /*st*/, bool /*enable*/)
{ }

void
ui::widgets::StaticText::handlePositionChange(gfx::Rectangle& /*oldPosition*/)
{
    requestRedraw();
}

ui::layout::Info
ui::widgets::StaticText::getLayoutInfo() const
{
    // ex UIStaticText::getLayoutInfo
    afl::base::Ptr<gfx::Font> font = m_provider.getFont(m_font);
    gfx::Point pt(font.get() != 0 ? font->getTextWidth(m_text) : 0,
                  font.get() != 0 ? font->getTextHeight(m_text) : 0);
    return ui::layout::Info(pt, pt, m_isFlexible ? ui::layout::Info::GrowHorizontal : ui::layout::Info::Fixed);
}

bool
ui::widgets::StaticText::handleKey(util::Key_t /*key*/, int /*prefix*/)
{
    return false;
}

bool
ui::widgets::StaticText::handleMouse(gfx::Point /*pt*/, MouseButtons_t /*pressedButtons*/)
{
    return false;
}