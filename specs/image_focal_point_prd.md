# PRD: Static Image Focal Point (POI/ROI) System for Hugo + Swiper

## 1. Overview

This feature introduces a **static focal point (Point of Interest / Region of Interest) system** for image cropping in Hugo projects using Swiper.js (https://swiperjs.com).

It allows authors to define a **visual focal point per image** in YAML so responsive cropping preserves the most important part of the image when displayed in carousels or other layouts.

The system is:

- Fully static (SSG-only)
- Build-time deterministic
- CSS-rendered (no runtime image processing services)
- Swiper-agnostic (Swiper only handles UI)

---

## 2. Goals

### 2.1 Primary Goals (Phase 1)

- Allow authors to define a **focal point per image**
- Support optional **Region of Interest (ROI) radius**
- Ensure consistent cropping in Swiper slides and responsive layouts
- Keep implementation fully static (no external services, no runtime processing)
- Maintain simple YAML authoring workflow

### 2.2 Non-Goals (Phase 1)

- No CDN image processing (Imgix, Cloudinary, etc.)
- No runtime cropping intelligence
- No CMS dependency
- No image manipulation outside of Hugo build system
- No visual editor in Phase 1

---

## 3. Data Model

### 3.1 Current Baseline Structure

```yaml
- slug: bubblicious
  image: bubs_at_crescent.jpeg
  title: Bubblicious
  price: 1200
```

---

### 3.2 Extended Structure (Phase 1)

Focal point is defined as separate normalized coordinates:

```yaml
focal:
  x: 0.55
  y: 0.40
```

Where:

- x = horizontal position (0.0 → 1.0)
- y = vertical position (0.0 → 1.0)

---

### 3.3 Full Example

```yaml
- slug: bubblicious
  image: bubs_at_crescent.jpeg
  title: Bubblicious
  price: 1200
  focal:
    x: 0.55
    y: 0.40
```

---

### 3.4 Optional ROI Extension (Reserved Field)

```yaml
focal:
  x: 0.55
  y: 0.40
  radius: 0.15
```

---

## 4. Field Definitions

### 4.1 focal.x

- Type: float
- Range: 0.0 → 1.0
- Default: 0.5
- Description: horizontal point of interest

---

### 4.2 focal.y

- Type: float
- Range: 0.0 → 1.0
- Default: 0.5
- Description: vertical point of interest

---

### 4.3 focal.radius (ROI, optional)

- Type: float
- Range: 0.0 → 1.0
- Default: 0.0
- Description: semantic region of interest around focal point
- Phase 1 behavior: stored but not used in rendering

---

## 5. Rendering Strategy (Phase 1)

### 5.1 Principle

All cropping is handled via CSS only:

```css
object-fit: cover;
object-position: X% Y%;
```

No build-time image cropping required.

---

### 5.2 Hugo Template Implementation

```go-html-template
{{ $x := 0.5 }}
{{ $y := 0.5 }}

{{ if .focal }}
  {{ $x = .focal.x }}
  {{ $y = .focal.y }}
{{ end }}

<img
  src="{{ .image | relURL }}"
  alt="{{ .title }}"
  style="
    object-fit: cover;
    object-position:
      {{ mul $x 100 }}%
      {{ mul $y 100 }}%;
  "
>
```

---

### 5.3 Default Behavior

If no focal point is provided:

x = 0.5
y = 0.5

(center crop)

---

## 6. Swiper Integration

Swiper is used purely as a UI component:

- slide layout
- navigation
- looping
- touch interaction

No focal logic is required inside Swiper.

```js
new Swiper('.swiper', {
  loop: true,
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev'
  }
});
```

---

## 7. Validation Rules

Soft validation (no build failure required):

- 0.0 ≤ x ≤ 1.0
- 0.0 ≤ y ≤ 1.0
- 0.0 ≤ radius ≤ 1.0

Invalid values fallback to defaults:

- x → 0.5
- y → 0.5

---

## 8. Design Philosophy

This system is intentionally:

> “Metadata-driven visual bias, not image transformation logic.”

Meaning:

- YAML expresses intent
- CSS applies cropping bias
- browser performs rendering
- Swiper remains unaware of image semantics

---

## 9. Future Expansion Plan (Out of Scope for Phase 1)

---

### 9.1 ROI-Based Cropping Logic

Future enhancement may use `radius` to:

- define safe cropping zones
- influence responsive cropping decisions
- improve thumbnail generation logic

---

### 9.2 Hugo Pipes Image Processing (Build-Time Only)

Hugo Pipes may be introduced later to:

- generate multiple aspect ratios at build time
- pre-crop images around focal points
- output optimized formats (WebP/AVIF)
- remain strictly SSG-only (no runtime processing)

---

### 9.3 Breakpoint-Aware Focal Points

```yaml
focal:
  mobile:
    x: 0.6
    y: 0.3
  desktop:
    x: 0.5
    y: 0.5
```

---

### 9.4 Visual Hotspot Editor (Separate Tool — NOT PART OF PHASE 1)

A future standalone tool may provide a Web UI for setting focal points visually.

#### Purpose

- Click-to-set focal point on image
- Optional drag-to-set ROI radius
- Writes values back to YAML

#### Output

```yaml
focal:
  x: 0.55
  y: 0.40
  radius: 0.15
```

#### Key constraint

This tool is explicitly NOT part of Phase 1 implementation.

---

## 10. Migration Plan

### Phase 1 (Current)

- Add focal.x and focal.y
- Render via CSS object-position
- No image processing pipeline changes
- No external dependencies

---

### Phase 2 (Optional)

- Introduce Hugo Pipes image derivatives
- Maintain same YAML schema

---

### Phase 3 (Optional Tooling)

- Visual hotspot editor (separate system)
- CLI or web-based YAML writer
- Optional developer UX improvements

---

## 11. Summary

This system provides:

- Lightweight static focal point model
- Fully SSG-compatible architecture
- Swiper-agnostic image rendering
- Clean upgrade path toward build-time image processing

---

## Key Guarantee

> The system remains fully static-site-generator compliant at all times. No runtime services, no external CDNs, and no server-side image processing are required in Phase 1.

