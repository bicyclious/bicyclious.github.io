# Bicyclious Dev Session Notes

## Project

Hugo static site at `/Users/jft/at/subduction/repos/bicyclious/`.
Theme: `bicyclious-retro` at `themes/bicyclious-retro/`.
Deployed to S3: `s3://bicyclious.com` with CloudFront.
Dev server: `hugo server` → `localhost:1313`.

**Site:** A bicycle restomod shop (Pacific Northwest). Builds vintage steel bikes for comfort.

---

## Design System — "Material 3 Expressive" (Bicyclious Expressive)

Spec lives at `DESIGN.md` in the repo root.

### Colors
```
--primary:           #b0004a   (Bicyclious Pink — buttons, links, price)
--primary-container: #d81b60   (masthead background)
--secondary:         #456556   (Forest Green)
--secondary-container: #c7ebd7 (card body background — sage green)
--tertiary:          #854639   (Rust — chips/tags)
--background:        #fbf9f7   (warm cream)
--on-surface:        #1b1c1b   (body text)
--on-surface-variant: #5a4044  (secondary text)
--outline-variant:   #e3bdc3   (borders — warm pinkish-beige)
```

### Typography
- **Display/Headlines:** Literata (Google Fonts, loaded in `baseof.html`) — 700–900 weight
  - Applied via `--font-display` CSS variable to `.hero-title`, `.section-title`, `.post-title`, `.card-title`
- **Body/UI:** Inter (Google Fonts) — 400–700 weight
- **Labels:** 11px / 500 / 0.5px tracking / uppercase — used for dates, badges, tagline

### Key Design Rules
- Ultra-rounded: `--radius-full` (9999px) for buttons/chips/badges, `--radius-lg` (32px) for cards
- Tonal borders: `--outline-variant` (#e3bdc3) not India Ink
- Soft warm shadows on cards (pink-tinted, very low opacity)
- No cross-hatch hover states — use tonal surface color shifts
- Nav links use pill hover states
- Card body background: `--secondary-container` (sage green)

---

## CSS

**Source:** `themes/bicyclious-retro/assets/css/main.css`
**Served from:** `themes/bicyclious-retro/static/css/main.css`

**After every CSS edit, sync with:**
```bash
cp themes/bicyclious-retro/assets/css/main.css themes/bicyclious-retro/static/css/main.css
```

---

## Terminology

| Term | Meaning |
|------|---------|
| **Bike card** | Card component in list/grid views (`_partials/bike-card.html`, `.bike-card` CSS) |
| **Build page** | Individual bike detail page (`builds/single.html`, `.build-page` CSS) |
| **Builds** | The builds list page (`/builds/`) |
| **Blog** | The posts section (`/posts/`) — renamed from "Journal" |

---

## Header Structure

Two-row header in `baseof.html`:
1. **`.site-masthead`** — Pink background (`#D20A6A`), contains the wordmark image
2. **`.site-nav-bar`** — Contains tagline + nav links

Wordmark: `static/images/bicyclious_wordmark.png` (cropped 973×239px, no whitespace).
Nav: BUILDS, BLOG (HOME was removed).
Header scrolls with page (not sticky).

---

## Home Page (`layouts/home.html`)

Order from top to bottom:
1. **Hero section** — "Bicyclious: builders of delicious bicycles" (Cooper Black) + subtitle
2. **Carousel** — `{{ partial "carousel.html" . }}`
3. **Available bikes grid** — all available builds
4. **Sold divider** — "// SOLD BUILDS"
5. **Sold bikes grid**
6. **Blog preview** — first 3 posts

---

## Builds List Page (`layouts/builds/list.html`)

Title: "Builds" (was "// SHOP").
Order: Carousel → available bike cards → sold divider → sold bike cards.

---

## Bike Cards (`.bike-card`)

- `border-radius: 10px`, `overflow: hidden`
- No borders
- `.card-body` background: `#c9a8b0` (saturated dusty rose)
- No "AVAILABLE" badge on available bikes
- "SOLD" badge shown on sold bikes
- No grayscale filter on sold bike images
- No "INSPECT BUILD →" CTA text
- Clicking a card goes to the build page

---

## Bike Card Grid (`.card-grid`)

- `gap: var(--gutter)` (24px) between cards
- `background: var(--surface)` — empty cells in incomplete rows show off-white
- Individual cards have `border-right` + `border-bottom` for structural lines

---

## Gallery (Build Pages)

- 4-column thumbnail grid
- `.gallery-thumbs` background: `var(--background)` — empty cells show off-white
- No bottom border on the thumbnail grid
- Lightbox triggered by JS (`openLightbox()` / `closeLightbox()`)

---

## Carousel (`_partials/carousel.html`)

Powered by **Swiper.js v11**, served locally (not CDN):
- JS: `static/js/swiper.min.js`
- CSS: `static/css/swiper.min.css`

Data file: `data/carousel.yaml`

```yaml
- slug: seahawk
  image: 1_drive_cover.png
  title: Seahawk
  price: 485
```

URL construction: `/builds/{slug}/{image}` for image, `/builds/{slug}/` for link.
Images live in Hugo page bundles: `content/builds/{slug}/`.

**Swiper config** (in `baseof.html`):
```js
new Swiper('.bike-carousel', {
  slidesPerView: 1.2,
  centeredSlides: true,
  spaceBetween: 16,
  loop: true,
  grabCursor: true,
  autoplay: { delay: 2500, disableOnInteraction: false, pauseOnMouseEnter: true },
  pagination: { el: '.swiper-pagination', clickable: true },
  breakpoints: {
    640:  { slidesPerView: 1.2, spaceBetween: 20 },
    1024: { slidesPerView: 1.2, spaceBetween: 24 }
  }
});
```

Navigation: slides use `data-href` attribute; Swiper `click` event calls `window.location.href`.

**⚠️ Outstanding issue:** Swipe gestures (left/right) not working on mobile. No JS console errors. Swiper initializes correctly. Autoplay status unconfirmed. Root cause not yet identified — likely a touch event conflict. Next session should investigate:
- Whether autoplay advances slides on its own
- Whether `overflow: hidden` from Swiper's default CSS is blocking touch events on neighboring slides
- Trying `cssMode: true` as an alternative

### Carousel Image Specs
- `aspect-ratio: 4 / 3`
- `border-radius: 10px`
- No caption text (removed)
- `.carousel-slide-img` handles the rounding directly (no `overflow: hidden` on slide)

---

## Bike Order in Lists

Controlled by `weight` front matter in each build's `index.md`. Lower weight = earlier in list. Available and sold bikes sort independently within their groups.

```yaml
---
title: "Seahawk"
weight: 1
status: "available"
---
```

---

## Cooper Black Font

Loaded via jsDelivr CDN (woff2 format) from `indestructible-type/Cooper` repo.

`@font-face` declared at top of `main.css`. Applied via `--font-display` variable to:
- `.hero-title`
- `.section-title`
- `.post-title`
