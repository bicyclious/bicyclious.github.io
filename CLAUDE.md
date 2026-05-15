# Bicyclious Dev Session Notes

## Project

Hugo static site at `/Users/jft/at/subduction/repos/bicyclious/`.
Theme: `bicyclious-retro` at `themes/bicyclious-retro/`.
Deployed to S3: `s3://bicyclious.com` with CloudFront.
Dev server: `hugo server` → `localhost:1313`.

**Site:** A bicycle restomod shop (Pacific Northwest). Builds vintage steel bikes for comfort.

---

## Design System — "Technical Impressionism"

Spec lives at `DESIGN.md` in the repo root.

### Colors
```
--vintage-paper:  #fbf9f5   (background)
--india-ink:      #1b1c1a   (text, borders)
--technical-blue: #326193   (annotations, links, metadata)
```

### Typography
- **Body:** Space Grotesk (Google Fonts, loaded in `baseof.html`)
- **Display headings:** Cooper Black (local TTF at `static/fonts/Cooper-Black.ttf`)
  - Applied via `--font-display` CSS variable to `.hero-title`, `.section-title`, `.post-title`
- **Label caps:** 11px / 600 / 0.12em tracking / uppercase — used for nav, badges, dates, CTAs

### Key Design Rules
- 0px border-radius on structural elements (buttons, inputs, cards)
- 1px India Ink borders for structure; 0.5px fine-lines for subdivisions
- No shadows, no gradients (except carousel caption overlay)
- Cross-hatch hover states (SVG data URI pattern)

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
| **Build page** | Individual bike detail page (`shop/single.html`, `.build-page` CSS) |
| **Builds** | The shop list page (`/shop/`) |
| **Blog** | The posts section (`/posts/`) — renamed from "Journal" |

---

## Header Structure

Two-row header in `baseof.html`:
1. **`.site-masthead`** — Pink background (`#D20A6A`), contains the wordmark image
2. **`.site-nav-bar`** — Contains tagline + nav links

Wordmark: `static/images/bicyclious_wordmark.png` (cropped 973×239px, no whitespace).
Nav: SHOP, BLOG (HOME was removed).
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

## Shop List Page (`layouts/shop/list.html`)

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

URL construction: `/shop/{slug}/{image}` for image, `/shop/{slug}/` for link.
Images live in Hugo page bundles: `content/shop/{slug}/`.

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

Downloaded locally from `indestructible-type/Cooper` GitHub repo (no woff2 available — TTF only).

```
static/fonts/Cooper-Black.ttf
```

`@font-face` declared at top of `main.css`. Applied via `--font-display` variable to:
- `.hero-title`
- `.section-title`
- `.post-title`
