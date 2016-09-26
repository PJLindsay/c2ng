/**
  *  \file gfx/rgbapixmap.cpp
  */

#include "gfx/rgbapixmap.hpp"
#include "gfx/pixmapcanvasimpl.hpp"

class gfx::RGBAPixmap::TraitsImpl {
 public:
    typedef ColorQuad_t Pixel_t;
    typedef ColorQuad_t Data_t;
        
    Data_t* get(int x, int y) const
        { return m_pix.row(y).at(x); }
    static inline Pixel_t peek(Data_t* ptr)
        { return *ptr; }
    static inline void poke(Data_t* ptr, Pixel_t val)
        { *ptr = val; }
    Pixel_t mix(Pixel_t a, Pixel_t b, Alpha_t balpha) const
        {
            uint8_t red   = mixColorComponent(RED_FROM_COLORQUAD  (a), RED_FROM_COLORQUAD  (b), balpha);
            uint8_t green = mixColorComponent(GREEN_FROM_COLORQUAD(a), GREEN_FROM_COLORQUAD(b), balpha);
            uint8_t blue  = mixColorComponent(BLUE_FROM_COLORQUAD (a), BLUE_FROM_COLORQUAD (b), balpha);
            uint8_t alpha = mixColorComponent(ALPHA_FROM_COLORQUAD(a), ALPHA_FROM_COLORQUAD(b), balpha);
            return COLORQUAD_FROM_RGBA(red,green,blue,alpha);
        }
    inline Data_t* add(Data_t* ptr, int dx, int dy) const
        { return ptr + m_pix.getWidth()*dy + dx; }

    TraitsImpl(RGBAPixmap& pix)
        : m_pix(pix)
        { }

 private:
    RGBAPixmap& m_pix;
};

class gfx::RGBAPixmap::CanvasImpl : public gfx::PixmapCanvasImpl<RGBAPixmap, TraitsImpl> {
 public:
    CanvasImpl(afl::base::Ptr<RGBAPixmap> pix)
        : PixmapCanvasImpl<RGBAPixmap, TraitsImpl>(pix)
        { }
    virtual int getBitsPerPixel()
        {
            return 32;
        }
    virtual void setPalette(Color_t /*start*/, afl::base::Memory<const ColorQuad_t> colorDefinitions, afl::base::Memory<Color_t> colorHandles)
        {
            encodeColors(colorDefinitions, colorHandles);
            while (Color_t* p = colorHandles.eat()) {
                if (const ColorQuad_t* q = colorDefinitions.eat()) {
                    *p = *q;
                } else {
                    *p = 0;
                }
            }
        }
    virtual void decodeColors(afl::base::Memory<const Color_t> colorHandles, afl::base::Memory<ColorQuad_t> colorDefinitions)
        {
            while (const Color_t* color = colorHandles.eat()) {
                if (ColorQuad_t* def = colorDefinitions.eat()) {
                    *def = *color;
                }
            }
            colorDefinitions.fill(COLORQUAD_FROM_RGBA(0,0,0,0));
        }
    virtual void encodeColors(afl::base::Memory<const ColorQuad_t> colorDefinitions, afl::base::Memory<Color_t> colorHandles)
        {
            while (const ColorQuad_t* def = colorDefinitions.eat()) {
                if (Color_t* color = colorHandles.eat()) {
                    *color = *def;
                }
            }
            colorHandles.fill(COLORQUAD_FROM_RGBA(0,0,0,0));
        }
    virtual afl::base::Ptr<Canvas> convertCanvas(afl::base::Ptr<Canvas> orig)
        {
            // FIXME: can we do better?
            return orig;
        }
};


gfx::RGBAPixmap::RGBAPixmap(int w, int h)
    : Pixmap<ColorQuad_t>(w, h)
{ }

afl::base::Ptr<gfx::RGBAPixmap>
gfx::RGBAPixmap::create(int w, int h)
{
    return new RGBAPixmap(w, h);
}

afl::base::Ptr<gfx::Canvas>
gfx::RGBAPixmap::makeCanvas()
{
    return new CanvasImpl(this);
}