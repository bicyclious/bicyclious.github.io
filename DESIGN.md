---
name: Bicyclious Expressive
colors:
  surface: '#fbf9f7'
  surface-dim: '#dbdad8'
  surface-bright: '#fbf9f7'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f5f3f1'
  surface-container: '#efedec'
  surface-container-high: '#eae8e6'
  surface-container-highest: '#e4e2e0'
  on-surface: '#1b1c1b'
  on-surface-variant: '#5a4044'
  inverse-surface: '#30302f'
  inverse-on-surface: '#f2f0ee'
  outline: '#8e6f74'
  outline-variant: '#e3bdc3'
  surface-tint: '#bc004f'
  primary: '#b0004a'
  on-primary: '#ffffff'
  primary-container: '#d81b60'
  on-primary-container: '#fff2f3'
  inverse-primary: '#ffb2bf'
  secondary: '#456556'
  on-secondary: '#ffffff'
  secondary-container: '#c7ebd7'
  on-secondary-container: '#4b6b5c'
  tertiary: '#854639'
  on-tertiary: '#ffffff'
  tertiary-container: '#a35d4f'
  on-tertiary-container: '#fff2f0'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#ffd9de'
  primary-fixed-dim: '#ffb2bf'
  on-primary-fixed: '#3f0016'
  on-primary-fixed-variant: '#90003b'
  secondary-fixed: '#c7ebd7'
  secondary-fixed-dim: '#accebc'
  on-secondary-fixed: '#012115'
  on-secondary-fixed-variant: '#2e4d3f'
  tertiary-fixed: '#ffdad3'
  tertiary-fixed-dim: '#ffb4a5'
  on-tertiary-fixed: '#390b04'
  on-tertiary-fixed-variant: '#71352a'
  background: '#fbf9f7'
  on-background: '#1b1c1b'
  surface-variant: '#e4e2e0'
  steel-gray: '#4A4A4A'
  rust-patina: '#A65D50'
  forest-depth: '#1B2E26'
  bicyclious-pink: '#D81B60'
typography:
  display-lg:
    fontFamily: literata
    fontSize: 57px
    fontWeight: '900'
    lineHeight: 64px
    letterSpacing: -0.02em
  display-md:
    fontFamily: literata
    fontSize: 45px
    fontWeight: '900'
    lineHeight: 52px
  headline-lg:
    fontFamily: literata
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
  headline-lg-mobile:
    fontFamily: literata
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 36px
  title-lg:
    fontFamily: literata
    fontSize: 22px
    fontWeight: '600'
    lineHeight: 28px
  body-lg:
    fontFamily: inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-lg:
    fontFamily: inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
    letterSpacing: 0.1px
  label-sm:
    fontFamily: inter
    fontSize: 11px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.5px
rounded:
  sm: 0.5rem
  DEFAULT: 1rem
  md: 1.5rem
  lg: 2rem
  xl: 3rem
  full: 9999px
spacing:
  base: 8px
  gutter: 24px
  margin-mobile: 16px
  margin-desktop: 64px
  container-max-width: 1280px
---

## Brand & Style

This design system embodies the "Restomod" philosophy: the soul of vintage steel bicycles upgraded with modern performance. The brand personality is "Delicious"—sensory, vibrant, and soulful, rooted in the rugged beauty of the Pacific Northwest. It targets cycling enthusiasts who value craftsmanship, heritage, and the joy of a playful ride.

The design style follows the **Material 3 Expressive** framework. It leans into bold, high-contrast aesthetics and vibrant containers while maintaining the structural integrity of professional SaaS. Expect oversized typography, generous roundedness, and a tactile color palette that bridges the gap between rusted workshop steel and neon urban accents.

## Colors

The palette is a dialogue between "The Workshop" and "The Trail." 

- **Primary:** The signature Bicyclious Pink (#D81B60) is the high-visibility accent, used for key actions and expressive containers.
- **Secondary:** A deep Forest Green (#2D4C3E) grounds the brand in the Cascadian landscape.
- **Tertiary:** Rusted Steel (#8C4B3E) provides a warm, earthy tone that references vintage frames.
- **Neutral:** A warm off-white "Cream Soda" (#FCFAF8) serves as the primary canvas, avoiding the sterile nature of pure white to enhance the vintage feel.

Containers should use the **Expressive Color Mapping** from Material 3: high-chroma tonal palettes where primary containers are vivid and deep, creating a "delicious" visual density.

## Typography

The typography pairs the literary, sturdy character of **Literata** for headlines with the utilitarian precision of **Inter** for UI and body text.

- **Headlines:** Set in Literata with high weights (700-900). Use "Display" roles for heroic messaging, reflecting the craftsmanship of hand-built frames. 
- **Body:** Inter provides a clean, neutral counter-balance to the expressive serif, ensuring technical specifications and shop details remain highly legible.
- **Stylistic Note:** For an extra "Expressive" touch, large display headlines should use tighter letter spacing to create a compact, impactful visual block.

## Layout & Spacing

This design system utilizes a **fluid 12-column grid** for desktop and a **4-column grid** for mobile. 

- **Rhythm:** An 8px linear scale governs all padding and margins. 
- **Margins:** Large horizontal margins on desktop (64px+) are encouraged to create "breathing room" around high-quality bike photography.
- **Expressive Breaks:** Allow imagery to occasionally break the grid (full-bleed or offset) to simulate the feeling of movement and outdoor adventure.

## Elevation & Depth

In line with Material 3 Expressive, depth is conveyed through **Tonal Layers** rather than heavy shadows. 

- **Surface Levels:** Use tinted backgrounds (e.g., a subtle Forest Green tint for surfaces) to indicate hierarchy. 
- **Shadows:** When used, shadows must be extremely soft, low-opacity, and tinted with the Primary or Secondary hue to maintain a "warm" workshop atmosphere. 
- **Flat Depth:** Cards often rely on thick 1px or 2px borders in a darker tonal variant of the surface color instead of shadows for a cleaner, "engineered" look.

## Shapes

The shape language is ultra-rounded and friendly, reflecting the curves of bicycle frames and the "Delicious" brand pillar.

- **Components:** Buttons and small chips are fully pill-shaped.
- **Containers:** Large cards and featured imagery use the **Extra Large (28px - 32px)** corner radius to feel soft and approachable.
- **Visual Metaphor:** Avoid sharp angles; even the "Hard" edges of the shop UI should feel honed and smooth, like a well-polished lugged steel frame.

## Components

- **Buttons:** Use the M3 "Extended FAB" or "Filled" style with primary pink. Label text should be uppercase Inter Bold for a technical, high-performance feel.
- **Cards:** Featured bikes should be displayed in cards with a subtle secondary-tinted background, 32px corner radius, and no border. 
- **Input Fields:** Use "Outlined" variants with a thicker 2px border on focus, colored in Primary Pink.
- **Chips:** Used for bike specs (e.g., "Steel," "Shimano XT," "Vintage"). These should be pill-shaped with a light tonal fill of the Tertiary color.
- **Spec Lists:** Utilize monospaced-style alignment for technical specifications, but keep the font as Inter to maintain the restomod aesthetic.
- **The "Bicyclious" Badge:** A unique floating component—a circular pill-shaped badge that houses the brand logo or "restomod" certification, often overlapping container edges.


