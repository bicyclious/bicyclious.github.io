----
name: Bicyclious
colors:
  surface: '#fff8f7'
  surface-dim: '#feced1'
  surface-bright: '#fff8f7'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#fff0f0'
  surface-container: '#ffe9e9'
  surface-container-high: '#ffe1e2'
  surface-container-highest: '#ffdadc'
  on-surface: '#2e1417'
  on-surface-variant: '#544246'
  inverse-surface: '#46282b'
  inverse-on-surface: '#ffeced'
  outline: '#877276'
  outline-variant: '#d9c0c5'
  surface-tint: '#9a405c'
  primary: '#973e59'
  on-primary: '#ffffff'
  primary-container: '#b55671'
  on-primary-container: '#fffbff'
  inverse-primary: '#ffb1c4'
  secondary: '#386569'
  on-secondary: '#ffffff'
  secondary-container: '#b9e8ec'
  on-secondary-container: '#3d6a6e'
  tertiary: '#4e6166'
  on-tertiary: '#ffffff'
  tertiary-container: '#667a7f'
  on-tertiary-container: '#000608'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#ffd9e0'
  primary-fixed-dim: '#ffb1c4'
  on-primary-fixed: '#3f001a'
  on-primary-fixed-variant: '#7c2844'
  secondary-fixed: '#bcebef'
  secondary-fixed-dim: '#a0cfd3'
  on-secondary-fixed: '#002022'
  on-secondary-fixed-variant: '#1e4d51'
  tertiary-fixed: '#d1e6eb'
  tertiary-fixed-dim: '#b5cacf'
  on-tertiary-fixed: '#0b1e22'
  on-tertiary-fixed-variant: '#374a4e'
  background: '#fff8f7'
  on-background: '#2e1417'
  surface-variant: '#ffdadc'
typography:
  display-lg:
    fontFamily: Cooper Black
    fontSize: 48px
    fontWeight: '900'
    lineHeight: '1.1'
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Cooper Black
    fontSize: 32px
    fontWeight: '900'
    lineHeight: '1.2'
  headline-lg-mobile:
    fontFamily: Cooper Black
    fontSize: 28px
    fontWeight: '900'
    lineHeight: '1.2'
  headline-md:
    fontFamily: Cooper Black
    fontSize: 24px
    fontWeight: '900'
    lineHeight: '1.3'
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: '1.6'
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.5'
  label-md:
    fontFamily: JetBrains Mono
    fontSize: 14px
    fontWeight: '500'
    lineHeight: '1'
    letterSpacing: 0.05em
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  base: 1rem
  gutter: 2rem
  margin-mobile: 1rem
  margin-desktop: 3rem
  container-max-width: 1280px
    breakpoints:
    sm: 850px   # Mobile
    md: 1200px  # Tablet
---

## Brand & Style

The brand is "Bicyclious" a merging of the words "Bicycle" and "Delicious".
The brand personality is "Delicious"—sensory, vibrant. 
This design system is an homage to 1980s and 1990s colorful
mountain bike stylings. 

The design style follows the **Material 3 Expressive** framework. It
leans into bold, high-contrast aesthetics and vibrant containers. Expect
oversized typography centered on Cooper Black and and a tactile color
palette

The details of the `Material 3 Expressive` are in `md3e.md.`

## CSS

The main CSS file is: themes/bicyclious/assets/css/main.css


## Colors

The palette is based on 1990s colorful pink candy colors and cherry blossoms.

- **Primary:** The signature Bicyclious Pink (--bicyclious-pink) is #D70969, a the high-visibility accent, used for key actions and expressive containers.
- **Secondary:** (#4D6B4F)
- **Tertiary:**   --bicyclious-skyblue (#d4e0ee) is the color of clear sky behind cherry blossoms
- **Neutral:** A warm off-white "Cream Soda" (#FCFAF8) serves as the primary canvas, avoiding the sterile nature of pure white to enhance the vintage feel.

Containers should use the **Expressive Color Mapping** from Material
3: high-chroma tonal palettes where primary containers are vivid and
deep, creating a "delicious" visual density.

## Typography

The typography uses the main font of Cooper Black.
The Cooper Black font is loaded locally from: themes/bicyclious/static/fonts/Cooper-Black.ttf

Secondar font is Inter, system-ui, sans-serif

- **Headlines:** Cooper Black
- **Body:** Inter provides a clean, neutral counter-balance to the expressive serif, ensuring technical specifications and shop details remain highly legible.
- **Stylistic Note:** Cooper Black, For an extra "Expressive" touch, large display headlines should use tighter letter spacing to create a compact, impactful visual block.


## Breakpoints

- 320px — still the baseline “smallest real device” target iPhone SE (older and current SE generations in CSS pixels) Many compact Android devices This is the classic “small mobile” breakpoint
- 360px — very common today Most modern Android phones (Pixel, Samsung Galaxy, etc.) This is actually the most important “default mobile” width now
- 375px — common iPhones iPhone 12/13/14/15/16 standard sizes (CSS viewport ≈ 390px or 375px depending model)
- 850px - below this image grid rows are limited to single bike cards
- 1200px - Above the threshold imaga grid rows are limited to 3 bike cards per row


## Layout & Spacing

This design system utilizes a **fluid 12-column grid** for desktop and a **4-column grid** for mobile. 

- **Rhythm:** An 8px linear scale governs all padding and margins. 
- **Margins:** Large horizontal margins on desktop (64px+) are encouraged to create "breathing room" around high-quality bike photography.
- **Expressive Breaks:** Allow imagery to occasionally break the grid (full-bleed or offset) to simulate the feeling of movement and outdoor adventure.




## Elevation & Depth

In line with Material 3 Expressive, depth is conveyed through **Tonal
Layers** rather than heavy shadows.

- **Surface Levels:** Use tinted backgrounds (e.g., a subtle Forest Green tint for surfaces) to indicate hierarchy. 
- **Shadows:** When used, shadows must be extremely soft, low-opacity, and tinted with the Primary or Secondary hue to maintain a "warm" workshop atmosphere. 
- **Flat Depth:** Cards often rely on thick 1px or 2px borders in a darker tonal variant of the surface color instead of shadows for a cleaner, "engineered" look.

## Shapes

The shape language is rounded and friendly.

- **Components:** Buttons and small chips are fully pill-shaped.
- **Containers:** Large cards and featured imagery use the corner radius to feel soft and approachable.
- **Visual Metaphor:** Avoid sharp angles; even the "Hard" edges of the shop UI should feel honed and smooth.

### Radii
Radius of rounder corners changes as per display size:

  --radius-sm:   0.5rem;   /* 8px  */
  --radius:      1rem;     /* 16px */
  --radius-md:   1.5rem;   /* 24px */
  --radius-lg:   2rem;     /* 32px */
  --radius-xl:   3rem;     /* 48px */
  --radius-full: 9999px;


## Components

- **Buttons:** Use the M3 "Extended FAB" or "Filled" style with primary pink. Label text should be uppercase Inter Bold for a technical, high-performance feel.
- **Cards:** Featured bikes should be displayed in cards with a subtle secondary-tinted background, 32px corner radius, and no border. 
- **Input Fields:** Use "Outlined" variants with a thicker 2px border on focus, colored in Primary Pink.
- **Chips:** Used for bike specs (e.g., "Steel," "Shimano XT," "Vintage"). These should be pill-shaped with a light tonal fill of the Tertiary color.
- **Spec Lists:** Utilize monospaced-style alignment for technical specifications, but keep the font as Inter to maintain the restomod aesthetic.
- **The "Bicyclious" Badge:** A unique floating component—a circular pill-shaped badge that houses the brand logo or "restomod" certification, often overlapping container edges.


