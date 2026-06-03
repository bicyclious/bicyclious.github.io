# Bicyclious Hero System (Posts v1)

## Overview

This document defines the **Hero System v1** used in `posts/` only.

It establishes a consistent, minimal frontmatter structure for rendering:
- post headers
- post list cards
- future social / OG image generation (external tooling)
- future view transitions

This system intentionally does **not** modify or depend on the existing `/builds/` or homepage implementations.

---

## Naming

We use the term:

> `hero`

### Why “hero” (not “cover” or “featured”)

- **Hero** refers to a *layout + presentation concept* in web design
- It represents the primary visual introduction of a page
- It commonly includes:
  - full-width imagery
  - focal-aware cropping
  - typography overlays
  - viewport-aware layout

“Cover” is avoided because it typically refers only to an asset (thumbnail/OG/media representation), not layout behavior.

---

## Frontmatter Contract (Posts Only)

All post hero data lives under a single namespace:

```yaml
hero:
  image: "filename.jpg"
  focal:
    x: 0.5
    y: 0.35
  alt: "Optional alt text"
```

### Fields

| Field | Type | Required | Description |
|------|------|----------|-------------|
| `image` | string | yes | Primary hero image filename |
| `focal.x` | float (0–1) | optional | Horizontal crop focus |
| `focal.y` | float (0–1) | optional | Vertical crop focus |
| `alt` | string | optional | Accessibility / fallback description |

### Defaults

If `focal` is omitted:

x = 0.5  
y = 0.5

---

## Rendering Rule

All hero rendering must go through a single Hugo partial:

`layouts/partials/hero-image.html`

### Responsibility of the partial

The partial is responsible only for:

- rendering the image
- applying focal cropping via `object-position`
- maintaining consistent aspect ratio behavior

It must NOT:
- decide layout (card vs full page)
- handle social image logic
- contain conditional page-type logic

---

## CSS Contract

```css
.hero-media {
  position: relative;
  width: 100%;
  aspect-ratio: 4 / 3;
  overflow: hidden;
}

.hero-media img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
```

Focal positioning is applied via inline style:

object-position: X% Y%;

---

## Usage: Post List Cards (Primary Test Surface)

```gohtml
{{ with .Params.hero }}
  {{ partial "hero-image.html" . }}
{{ end }}
```

---

## System Boundaries (Important)

Included:
- post list cards
- post single header (future)
- shared image rendering partial
- focal-based cropping behavior

Not included:
- /builds/ system
- homepage carousel system
- social image generation logic

---

End of spec.
