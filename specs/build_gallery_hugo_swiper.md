# PRD: Fullscreen Swiper Gallery System (Hugo + Static Focal Points)
# bicyclious.com — Master-detail gallery with lightbox

## Version history

- First version 2026-05-24: Talked out with chat.com
- Last updated: 2026-05-25. Reflects decisions made during implementation planning session in cluade.ai.


---

## 1. Overview

This document describes a **fully static image gallery architecture** for Hugo using [Swiper.js](https://swiperjs.com).

It implements a three-layer UI system called **"Master-detail gallery with lightbox"**, used exclusively on **build single pages** (`layouts/builds/single.html`).

1. Tall hero Swiper (main image, focal-aware)
2. Synchronized single-row horizontal thumbnail Swiper
3. Click-to-expand fullscreen lightbox Swiper

The **home page carousel** (`layouts/index.html` → `_partials/carousel.html` home branch) is **not affected** by this system. Both live in the same `carousel.html` partial, separated by a Hugo `if/else` branch.

All rendering is static (SSG-only). No runtime services, CMS, or CDN image processing are required.

---

## 2. Goals

### 2.1 Primary Goals

- Provide a **landscape-first gallery layout** suited to bike photography
- Synchronize main hero Swiper and thumbnail strip Swiper
- Support click-to-open fullscreen lightbox Swiper (third instance)
- Maintain fully static build output (Hugo page bundles only)
- Support per-image focal points defined in `index.md` front matter
- Keep home page carousel completely unchanged

---

### 2.2 Non-Goals

- No CMS integration
- No runtime image processing (Imgix, Cloudinary, etc.)
- No server-side rendering
- No external API dependencies
- No dynamic backend state

---

## 3. System Architecture

### 3.1 High-Level Structure

```text
Hugo page bundle (index.md + images in same directory)
        ↓
carousel.html partial — else branch (receives []Resource slice)
        ↓
Static HTML (hero + thumbs + lightbox markup)
        ↓
CSS layout system (build-gallery-* namespace)
        ↓
Swiper.js — 3 instances initialized in baseof.html
        ↓
Client-side interaction only
```

### 3.2 File Changes

| File | Change |
|---|---|
| `_partials/carousel.html` | Replace `else` branch only; `if` branch (home) untouched |
| `assets/css/main.css` | Add new `build-gallery-*` rules; nothing removed |
| `layouts/baseof.html` | Add build gallery JS block inside existing IIFE |
| `layouts/builds/single.html` | No changes needed |

---

### 3.3 Swiper Instances

#### 1. Main Swiper — `.build-gallery-main`
- One slide visible at a time
- `loop: true`
- Arrows (prev/next) styled to match existing site nav buttons
- `thumbs: { swiper: thumbsSwiper }` links to thumbnail strip
- Cursor: zoom-in to signal lightbox is available

#### 2. Thumbnail Swiper — `.build-gallery-thumbs`
- Single horizontal row (not multi-row grid — see §6 note)
- `slidesPerView: 'auto'`, `freeMode: true`
- `watchSlidesProgress: true` required for thumb sync
- Active slide gets coloured border/ring
- Initialized **before** main Swiper (required as a reference)

#### 3. Lightbox Swiper — `.build-lightbox-swiper`
- Triggered by clicking any hero slide
- Opens at `realIndex` of main Swiper (`slideToLoop(index, 0)`)
- Independent navigation (arrows + keyboard)
- Images use `object-fit: contain` — no cropping in lightbox
- ESC key and backdrop click both close the modal

---

## 4. Data Model — Hugo Page Bundle

Images are sourced from the page bundle (same directory as `index.md`). Focal points are defined **per-image** in `index.md` front matter.

### 4.1 Front Matter Structure

```yaml
title: Seahawk
price: 485
status: available

images:
  - file: drive_in_yard_with_dog.jpg
    focal:
      x: 0.5
      y: 0.1
  - file: detail_shot.jpg
    focal:
      x: 0.7
      y: 0.4
```

### 4.2 Focal Point Definition

- `x`: horizontal focus (0.0 → 1.0, left → right)
- `y`: vertical focus (0.0 → 1.0, top → bottom)
- Default: `0.5 / 0.5` (center) if a bundle image is not listed in `images`

### 4.3 Hugo Template Lookup Logic

```go-html-template
{{/* Build a map: filename → focal */}}
{{ $focalMap := dict }}
{{ range .Params.images }}
  {{ $focalMap = merge $focalMap (dict .file .focal) }}
{{ end }}

{{/* For each bundle image, look up focal or use default */}}
{{ range $input }}
  {{ $focal := index $focalMap .Name }}
  {{ $x := 0.5 }}{{ $y := 0.5 }}
  {{ with $focal }}
    {{ $x = .x }}{{ $y = .y }}
  {{ end }}
  <img src="{{ .RelPermalink }}"
       style="object-position: {{ mul $x 100 }}% {{ mul $y 100 }}%;"
       ...>
{{ end }}
```

> **Note:** `$input` in the `else` branch is the `[]Resource` slice passed from `single.html` via `{{ partial "carousel.html" $imgs }}`. The focal map is built from `.Page.Params.images` — passed via context if needed.

---

## 5. Layout System

### 5.1 Hero + Thumbnail Strip

```text
┌──────────────────────────────────────────────┐
│  MAIN SWIPER — ~65vh, landscape              │
│  one slide, arrows left/right                │
│  focal-aware object-position                 │
│  cursor: zoom-in                             │
└──────────────────────────────────────────────┘
┌──────────────────────────────────────────────┐
│  THUMBNAIL STRIP — ~90px fixed height        │
│  horizontal scroll, single row               │
│  active thumb highlighted with ring          │
└──────────────────────────────────────────────┘
```

**Why not 50/50 portrait split (as in original PRD):** Bike images are landscape. A 50/50 split wastes the hero on tall empty space. `65vh` hero + fixed thumb strip is a better proportion.

**Why single-row thumbs (not Swiper Grid):** Swiper Grid module has known incompatibilities with `loop` mode. Single-row `freeMode` strip is simpler and more reliable.

### 5.2 CSS Namespace

All new rules use the `build-gallery-*` prefix to avoid colliding with existing `.bike-carousel`, `.carousel-slide-img`, `.gallery`, `.gallery-thumb`, and `.lightbox` rules (which remain untouched).

```css
.build-gallery-wrap    /* full-bleed container */
.build-gallery-main    /* hero Swiper */
.build-gallery-img     /* hero slide images */
.build-gallery-thumbs  /* thumb strip Swiper */
.build-lightbox        /* modal overlay */
.build-lightbox-img    /* lightbox image */
.build-lightbox-close  /* close button */
```

---

## 6. Swiper Configuration

### 6.1 Thumbnail Strip — initialized first

```js
const thumbsSwiper = new Swiper('.build-gallery-thumbs', {
  slidesPerView: 'auto',
  spaceBetween: 8,
  freeMode: true,
  watchSlidesProgress: true,
});
```

### 6.2 Main Hero Swiper

```js
const mainSwiper = new Swiper('.build-gallery-main', {
  slidesPerView: 1,
  loop: true,
  keyboard: { enabled: true, onlyInViewport: true },
  navigation: {
    nextEl: '.build-gallery-main .swiper-button-next',
    prevEl: '.build-gallery-main .swiper-button-prev',
  },
  thumbs: { swiper: thumbsSwiper },
});
```

### 6.3 Lightbox Swiper

```js
const lightboxSwiper = new Swiper('.build-lightbox-swiper', {
  loop: true,
  keyboard: { enabled: true },
  navigation: {
    nextEl: '.build-lightbox .swiper-button-next',
    prevEl: '.build-lightbox .swiper-button-prev',
  },
});
```

---

## 7. Lightbox Behavior

### 7.1 Open

```js
mainSwiper.on('click', function () {
  const index = mainSwiper.realIndex;
  document.getElementById('build-lightbox').classList.add('open');
  lightboxSwiper.slideToLoop(index, 0);
});
```

### 7.2 Close — three triggers

```js
// Backdrop click
lightbox.addEventListener('click', (e) => {
  if (e.target === lightbox) lightbox.classList.remove('open');
});

// Close button
document.getElementById('build-lightbox-close')
  .addEventListener('click', () => lightbox.classList.remove('open'));

// ESC key
document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape') lightbox.classList.remove('open');
});
```

---

## 8. CSS Reference

### 8.1 Hero

```css
.build-gallery-wrap {
  width: 100vw;
  margin-left: calc(50% - 50vw);
  margin-right: calc(50% - 50vw);
}

.build-gallery-main {
  width: 100%;
  height: 65vh;
}

.build-gallery-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  /* object-position set inline from focal data */
  cursor: zoom-in;
  display: block;
}

@media (max-width: 850px) {
  .build-gallery-main { height: 50vw; } /* aspect-ratio feel on mobile */
}
```

### 8.2 Thumbnail Strip

```css
.build-gallery-thumbs {
  height: 90px;
  margin-top: 8px;
}

.build-gallery-thumbs .swiper-slide {
  width: auto;
  height: 90px;
  aspect-ratio: 4 / 3;
  overflow: hidden;
  border-radius: var(--radius);
  opacity: 0.6;
  transition: opacity 0.2s;
  cursor: pointer;
}

.build-gallery-thumbs .swiper-slide-thumb-active {
  opacity: 1;
  outline: 2px solid var(--primary);
  outline-offset: 2px;
}

.build-gallery-thumbs img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

@media (max-width: 850px) {
  .build-gallery-thumbs,
  .build-gallery-thumbs .swiper-slide { height: 60px; }
}
```

### 8.3 Lightbox

```css
.build-lightbox {
  display: none;
  position: fixed;
  inset: 0;
  z-index: 9999;
  background: rgba(0, 0, 0, 0.95);
  align-items: center;
  justify-content: center;
}

.build-lightbox.open { display: flex; }

.build-lightbox-swiper {
  width: 100%;
  height: 100%;
}

.build-lightbox-swiper img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.build-lightbox-close {
  position: fixed;
  top: var(--margin);
  right: var(--margin);
  /* styled to match existing .lightbox-close */
}
```

---

## 9. Focal Point Integration

| Context | `object-fit` | `object-position` |
|---|---|---|
| Hero Swiper | `cover` | `X% Y%` from front matter |
| Thumb strip | `cover` | `X% Y%` from front matter |
| Lightbox | `contain` | not applied (no cropping) |

Fallback when image not listed in `images` front matter: `50% 50%`.

---

## 10. Interaction Model

| Action | Result |
|---|---|
| Click thumbnail | Main Swiper jumps to that slide |
| Swipe / arrow on hero | Thumbnail strip highlights active thumb |
| Click hero image | Lightbox opens at same index |
| Swipe / arrow in lightbox | Navigates independently |
| Click backdrop | Lightbox closes |
| Click CLOSE button | Lightbox closes |
| ESC key | Lightbox closes |

---

## 11. Design Philosophy

> "Static-first, interaction-rich, image-intent-aware UI system."

- All data originates in Hugo YAML / front matter
- No runtime image processing
- Swiper handles interaction only
- CSS handles layout and cropping
- Hugo handles build-time composition
- Home page carousel is strictly isolated from build gallery code

---

## 12. Future Enhancements (Out of Scope)

### 12.1 Hugo Pipes Image Derivatives

- Generate responsive image sets
- Pre-crop based on focal metadata
- Output WebP/AVIF variants

### 12.2 Advanced Focal Logic

- Breakpoint-specific focal points
- ROI-driven cropping bias

### 12.3 Visual Hotspot Editor (Separate Tool)

A future standalone tool may allow:

- Click-to-set focal point on image
- Drag-to-define ROI radius
- YAML output back into repository

This tool is explicitly NOT part of the current system.

---

## 13. Summary

This system implements a **three-tier Swiper gallery architecture** on build single pages:

1. **Hero Swiper** — tall landscape view, focal-aware, zoom-in cursor
2. **Thumbnail strip Swiper** — single-row horizontal, synced to hero
3. **Lightbox Swiper** — fullscreen modal, independent nav, contain mode

Focal points are defined per-image in `index.md` front matter under an `images` list. Bundle images not listed fall back to `50% 50%`. The home page carousel is untouched.

---

## Key Guarantee

> This system remains fully static-site-generator compliant. No runtime services, CMS dependencies, or external image processing systems are required.
