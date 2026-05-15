---
name: Technical Impressionism
colors:
  surface: '#fbf9f5'
  surface-dim: '#dbdad6'
  surface-bright: '#fbf9f5'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f5f3ef'
  surface-container: '#efeeea'
  surface-container-high: '#eae8e4'
  surface-container-highest: '#e4e2de'
  on-surface: '#1b1c1a'
  on-surface-variant: '#46474a'
  inverse-surface: '#30312e'
  inverse-on-surface: '#f2f0ed'
  outline: '#76777b'
  outline-variant: '#c7c6ca'
  surface-tint: '#5f5e5f'
  primary: '#000000'
  on-primary: '#ffffff'
  primary-container: '#1b1b1c'
  on-primary-container: '#858384'
  inverse-primary: '#c8c6c7'
  secondary: '#326193'
  on-secondary: '#ffffff'
  secondary-container: '#9bc7ff'
  on-secondary-container: '#225384'
  tertiary: '#000000'
  on-tertiary: '#ffffff'
  tertiary-container: '#1c1b19'
  on-tertiary-container: '#868380'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#e5e2e3'
  primary-fixed-dim: '#c8c6c7'
  on-primary-fixed: '#1b1b1c'
  on-primary-fixed-variant: '#474647'
  secondary-fixed: '#d2e4ff'
  secondary-fixed-dim: '#a1c9ff'
  on-secondary-fixed: '#001c37'
  on-secondary-fixed-variant: '#14487a'
  tertiary-fixed: '#e6e2de'
  tertiary-fixed-dim: '#cac6c2'
  on-tertiary-fixed: '#1c1b19'
  on-tertiary-fixed-variant: '#484644'
  background: '#fbf9f5'
  on-background: '#1b1c1a'
  surface-variant: '#e4e2de'
typography:
  display-lg:
    fontFamily: Space Grotesk
    fontSize: 48px
    fontWeight: '700'
    lineHeight: '1.1'
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Space Grotesk
    fontSize: 32px
    fontWeight: '600'
    lineHeight: '1.2'
  headline-sm:
    fontFamily: Space Grotesk
    fontSize: 24px
    fontWeight: '600'
    lineHeight: '1.3'
  body-lg:
    fontFamily: Space Grotesk
    fontSize: 18px
    fontWeight: '400'
    lineHeight: '1.6'
  body-md:
    fontFamily: Space Grotesk
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.5'
  label-caps:
    fontFamily: Space Grotesk
    fontSize: 12px
    fontWeight: '600'
    lineHeight: '1.4'
    letterSpacing: 0.1em
  annotation:
    fontFamily: Space Grotesk
    fontSize: 13px
    fontWeight: '500'
    lineHeight: '1.4'
spacing:
  unit: 4px
  gutter: 24px
  margin: 32px
  hairline: 1px
  fine-line: 0.5px
---

## Brand & Style

This design system is a digital tribute to the hand-drawn technical illustrations of Daniel Rebours. It evokes the meticulous, soulful precision of mid-century bicycle engineering journals. The brand personality is intellectual, artisanal, and uncompromisingly clear, prioritizing the "Technical Impressionism" of ink on vellum over digital abstraction.

The aesthetic leans into a **refined Brutalism**, utilizing high-contrast monochrome palettes and architectural line-work to create a layout that feels like a vintage drafting table. It avoids the softness of modern UI, opting instead for the authoritative clarity of a rapidograph pen and a mechanical straightedge.

## Colors

The palette is strictly limited to mimic the constraints of traditional lithographic and ink-based printing. 

- **Vintage Paper (#FDFBF7):** The primary surface color, providing a warm, organic base that reduces the harshness of pure white while maintaining high legibility.
- **India Ink (#1A1A1B):** Used for all structural lines, typography, and primary iconography. It should feel dense and permanent.
- **Technical Blue (#2B5A8C):** A secondary accent used exclusively for annotations, call-to-action highlights, and metadata—mimicking the "non-photo blue" or architectural markup pencils.

Avoid digital gradients or semi-transparent overlays. Contrast is achieved through line density, not opacity.

## Typography

The system utilizes **Space Grotesk** across all roles to maintain a consistent architectural feel. Its idiosyncratic letterforms suggest the precision of a drafting machine while retaining a human, hand-lettered quality.

- **Headlines:** Should be bold and impactful, reminiscent of editorial mastheads in *Le Cycle*.
- **Body Text:** Set with generous line heights to ensure readability against hatched backgrounds or dense technical diagrams.
- **Labels:** Frequently used in All-Caps with slight tracking to denote component names or mechanical parts.
- **Annotations:** Use the italic weight in Technical Blue for marginalia and supplementary notes, reinforcing the drafting table metaphor.

## Layout & Spacing

The layout follows a **Fixed Grid** philosophy, behaving like a printed page. Elements are contained within clear, visible borders that act as a skeleton for the UI.

- **The Drafting Grid:** All elements align to a 4px baseline.
- **Borders:** Structural divisions use 1px 'India Ink' lines. Secondary subdivisions or internal component details use 0.5px 'hairlines'.
- **Margins:** Large, asymmetrical margins (32px+) are encouraged to simulate the white space of an illustration plate. 
- **Responsive Behavior:** On mobile, the layout collapses into a single column, but the 1px perimeter border remains to maintain the "contained" feel of an index card or manual.

## Elevation & Depth

This system rejects shadows and blurs. Depth is communicated through **Structural Layering** and **Line Density**:

1.  **Tonal Stacking:** Surfaces do not float; they sit on top of one another like sheets of tracing paper. A higher-elevation element is simply a new boxed container with a 1px border.
2.  **Cross-Hatching:** To create "depth" or "focus" behind a modal or pop-over, use a 45-degree cross-hatch pattern (fine lines spaced 4px apart) rather than a dimming overlay.
3.  **Leader Lines:** Use 0.5px lines with 4px dot terminals to connect labels to their respective components. These lines establish a 3D relationship within a 2D space.

## Shapes

The shape language is strictly **Sharp (0px roundedness)**. Every container, button, and input field must have 90-degree corners to reflect the precision of mechanical drafting and industrial components. Circles are reserved only for functional indicators (dots on leader lines, radio buttons) or icons representing circular mechanical parts (gears, bearings).

## Components

- **Buttons:** Rectangular with a 1px 'India Ink' border. No background fill by default. On hover, apply a fine 45-degree hatch pattern. Primary buttons may use a solid 'India Ink' fill with 'Vintage Paper' text.
- **Input Fields:** Bottom-border only (1px) to mimic a signature line on a technical document. Labels should sit above in All-Caps.
- **Cards:** Defined by 1px perimeter borders. Header sections of cards should be separated by a 0.5px horizontal line.
- **Leader Labels:** Labels for diagrams or complex data points must use a 0.5px diagonal line ending in a solid 4px circle (dot) at the point of interest.
- **Chips/Tags:** Simple boxes with 0.5px borders. In active states, use the 'Technical Blue' for the border and text.
- **Checkboxes:** Square, sharp corners. A "check" is represented by a bold "X" drawn with two diagonal strokes, mimicking a manual mark.
- **Progress Bars:** Represented as a segmented box where each segment is separated by a 0.5px line, suggesting a physical ruler or gauge.
