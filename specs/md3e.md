# Navigation Arrows (Expressive Style)

## Implementation Guidance
For expressive components (e.g., Carousels, Paginated Lists, Date Pickers), navigation arrows leverage high-visibility containers, intentional optical weighting, and micro-interactions to reinforce brand identity and directional affordance.

### 1. Structure & Geometry
* **Container Shape:** Fully rounded circular container (`shape.corner.full`) to cleanly separate directional controls from structural layout squircled actions.
* **Target Size:** Layout footprint of **40x40dp** minimum, scale to **48x48dp** for standalone floating controls over rich imagery.
* **Positioning:** Overlay/Floating directly on left and right bounds of the content container, horizontally aligned with the content baseline or vertically centered.

### 2. Color System Mappings
Expressive layouts use dynamic color pairing to establish structural depth and readability.

| State | Container Token | Icon Token |
| :--- | :--- | :--- |
| **Enabled** | `surface-container-highest` | `on-surface-variant` |
| **Hover** | `primary-container` | `on-primary-container` |
| **Focused** | `surface-container-high` | `primary` |
| **Disabled** | `on-surface` (12% opacity) | `on-surface` (38% opacity) |

### 3. Iconography & Typographic Alignment
* **Tokens:** Use system standard `chevron_left` and `chevron_right`.
* **Optical Weighting:** Match your product's structural typeface. If headers leverage bold or display faces, adjust the Material Symbol grade to `Weight: 500-700` / `Grade: +25`.
* **Bi-directionality:** Explicitly mirror layout logic and arrow orientations natively when switching to Right-to-Left (RTL) locales.

### 4. Elevation & Treatment
* **Default Treatment:** Flat or Elevation Level 0 when placed on distinct utility cards.
* **Over Imagery:** Use **Elevation Level 1 / Level 2** shadows or implement a surface backdrop blur (`backdrop-filter: blur(8px)`) with `surface-container-highest` at 80% opacity to preserve readability over variable content.

### 5. Motion & Micro-Interactions
* **Scale Effect:** Apply a subtle `easing.standard` scaling curve (`scale(1.05)`) on hover states.
