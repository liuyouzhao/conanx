#ifndef COLOR_H
#define COLOR_H

#include <string>

namespace DCanvas
{

class Color;

typedef unsigned RGBA32;        // RGBA quadruplet

RGBA32 makeRGB(int r, int g, int b);
RGBA32 makeRGBA(int r, int g, int b, int a);

RGBA32 colorWithOverrideAlpha(RGBA32 color, float overrideAlpha);
RGBA32 makeRGBA32FromFloats(float r, float g, float b, float a);
RGBA32 makeRGBAFromHSLA(double h, double s, double l, double a);
RGBA32 makeRGBAFromCMYKA(float c, float m, float y, float k, float a);

int differenceSquared(const Color&, const Color&);

class Color
{
public:
    Color() : m_color(0), m_valid(false) { }
    Color(RGBA32 col) : m_color(col), m_valid(true) { }
    Color(int r, int g, int b) : m_color(makeRGB(r, g, b)), m_valid(true) { }
    Color(int r, int g, int b, int a) : m_color(makeRGBA(r, g, b, a)), m_valid(true) { }
    // Color is currently limited to 32bit RGBA, perhaps some day we'll support better colors
    Color(float r, float g, float b, float a) : m_color(makeRGBA32FromFloats(r, g, b, a)), m_valid(true) { }
    // Creates a new color from the specific CMYK and alpha values.
    Color(float c, float m, float y, float k, float a) : m_color(makeRGBAFromCMYKA(c, m, y, k, a)), m_valid(true) { }
    explicit Color(const std::string&);
    explicit Color(const char*);

    std::string name() const;
    void setNamedColor(const std::string&);

    bool isValid() const { return m_valid; }

    bool hasAlpha() const { return alpha() < 255; }

    int red() const { return (m_color >> 16) & 0xFF; }
    int green() const { return (m_color >> 8) & 0xFF; }
    int blue() const { return m_color & 0xFF; }
    int alpha() const { return (m_color >> 24) & 0xFF; }

    RGBA32 rgb() const { return m_color; } // Preserve the alpha.
    void setRGB(int r, int g, int b) { m_color = makeRGB(r, g, b); m_valid = true; }
    void setRGB(RGBA32 rgb) { m_color = rgb; m_valid = true; }
    void setRGBA(int r, int g, int b, int a) { m_color = makeRGBA(r, g, b,a); m_valid = true; }
    void getRGBA(float& r, float& g, float& b, float& a) const;
    void getRGBA(double& r, double& g, double& b, double& a) const;
    void getHSL(double& h, double& s, double& l) const;

    Color light() const;
    Color dark() const;

    Color blend(const Color&) const;
    Color blendWithWhite() const;

    static bool parseHexColor(const std::string& name, RGBA32& rgb);

    static const RGBA32 black = 0xFF000000;
    static const RGBA32 white = 0xFFFFFFFF;
    static const RGBA32 darkGray = 0xFF808080;
    static const RGBA32 gray = 0xFFA0A0A0;
    static const RGBA32 lightGray = 0xFFC0C0C0;
    static const RGBA32 transparent = 0x00000000;

private:
    RGBA32 m_color;
    bool m_valid;
};

inline bool operator==(const Color& a, const Color& b)
{
    return a.rgb() == b.rgb() && a.isValid() == b.isValid();
}

inline bool operator!=(const Color& a, const Color& b)
{
    return !(a == b);
}

Color colorFromPremultipliedARGB(unsigned);
unsigned premultipliedARGBFromColor(const Color&);

} // namespace DCanvas

#endif // COLOR_H
