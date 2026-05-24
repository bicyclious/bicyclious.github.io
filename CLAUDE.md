# Bicyclious

## Other markdown spec files to read

Most specs live in `specs/` folder:
- 

- DESIGN.md: Stitch Design Spec lives at `DESIGN.md` in the `specs/` folder
- md3e.md: describes the Material 3 Expressive design styling guidelines
- image_focal_point_prd.md: describes how photo Region of Interest (ROI) is implemented in image carousels and such.



## Project

**Site:** A bicycle restomod shop in the Pacific Northwest. Builds
vintage steel bikes for comfort. Maintains a list of built bicycle,
some sold and some still for sale. There is also a blog.

- Hugo static site at `/Users/jft/at/subduction/repos/bicyclious/`
- Theme: `bicyclious` at `themes/bicyclious/`
- Deployed to S3: `s3://bicyclious.com` with CloudFront which needs to be invalidated after deploy
- Dev server: `hugo server` → `localhost:1313`



### Key Design Rules

- rounded corners, small radius
- Soft warm shadows on cards (pink-tinted, very low opacity)
- No cross-hatch hover states — use tonal surface color shifts
- Nav links use pill hover states



## Terminology

| Term | Meaning |
|------|---------|
| **Bike card** | Card component in list/grid views (`_partials/bike-card.html`, `.bike-card` CSS) |
| **Build page** | Individual bike detail page (`builds/single.html`, `.build-page` CSS) |
| **Builds** | The builds list page (`/builds/`) |
| **Blog** | The posts section (`/posts/`) — renamed from "Journal" |



## Header Structure

Two-row header in `baseof.html`:
1. **`.site-masthead`** — Brands Pink background (#D70969), contains the wordmark image
2. **`.site-nav-bar`** — Contains tagline + nav links

Wordmark: `static/images/bicyclious_wordmark.png` (cropped 973×239px, no whitespace).
Nav: BUILDS, BLOG, ABOUT
Header scrolls with page (not sticky).



## Home Page (`layouts/home.html`)

Order from top to bottom:
1. **Masthead**
2. **Carousel** — `{{ partial "carousel.html" . }}`
3. **Hero section** — "Bicyclious: builders of delicious bicycles" (Cooper Black) + subtitle
4. **Available bikes grid** — all available builds
5. **Sold bikes grid**
6. **Sold bikes grid**
7. **Blog preview** — first 9
8. **Footer**



## Builds List Page (`layouts/builds/list.html`)

Title: "Builds"
Order: Carousel → available bike cards → sold bike cards.



## Bike Cards (`.bike-card`)

- `overflow: hidden`
- Radius related to display size
  - --radius-sm:   0.5rem;   /* 8px  */
  - --radius:      1rem;     /* 16px */
  - --radius-md:   1.5rem;   /* 24px */
  - --radius-lg:   2rem;     /* 32px */
  - --radius-xl:   3rem;     /* 48px */
  - --radius-full: 9999px;
- No borders
- `.card-body` background: 
  - for sale: --bicyclious-green-light
  - sold: --bicyclious-green-dark
- Badges
  - No "AVAILABLE" badge on available bikes
  - "SOLD" badge shown on sold bikes
- No grayscale filter on sold bike images
- No "INSPECT BUILD →" CTA text
- Clicking a card goes to the build page



## Bike Card Grid (`.card-grid`)

- `gap:   gap: 0.5em;`
- `background:   --bicyclious-offwhite`
— empty cells in incomplete rows show  --bicyclious-offwhite


## Builds (bike gallery)

- thumbnail grid is max 4-column but responsive to viewport width, down to 1-column on smaller mobile devices
- `.gallery-thumbs` background: `var(--background)` 
— empty cells show the slightly pink offwhite
- No bottom border on the thumbnail grid
- Lightbox triggered by JS (`openLightbox()` / `closeLightbox()`)


## Carousel (`_partials/carousel.html`)

Powered by **Swiper.js v11**, served locally (not CDN):
- JS: `static/js/swiper.min.js`
- CSS: `static/css/swiper.min.css`

Data file: `data/carousel.yaml`

```yaml
- slug: bubblicious
  image: bubs_at_crescent.jpeg
  title: Bubblicious
  price: 1200
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
  autoplay: { delay: 2250, disableOnInteraction: true, pauseOnMouseEnter: true },
  pagination: { el: '.swiper-pagination', clickable: true },
  breakpoints: {
    640:  { slidesPerView: 1.2, spaceBetween: 20 },
    1024: { slidesPerView: 1.2, spaceBetween: 24 }
  }
});
```

Navigation: slides use `data-href` attribute; Swiper `click` event calls `window.location.href`.


### Carousel Image Specs

- `aspect-ratio: 4 / 3`
- `border-radius: 10px`
- No caption text (removed)
- `.carousel-slide-img` handles the rounding directly (no `overflow: hidden` on slide)



## Bike Order in Lists

Controlled by `weight` front matter in each build's `index.md`. Lower
weight = earlier in list. Available and sold bikes sort independently
within their groups.

```yaml
---
title: "Build Name"
weight: 1
status: "available"
---
```




## Styling

The site Hugo theme is called bicyclious and lives in themes/bicyclious.

## Design System — "Material 3 Expressive" 

Design Spec lives at `DESIGN.md` in the `specs/` folder.


## CSS

**Source:** `themes/bicyclious/assets/css/main.css`
**Processed via:** Hugo Pipes (automatically minified and fingerprinted in `baseof.html`).


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

The main brand font is Cooper in 

- **Display/Headlines:** Literata (Google Fonts, loaded in `baseof.html`) — 700–900 weight
  - Applied via `--font-display` CSS variable to `.hero-title`, `.section-title`, `.post-title`, `.card-title`
- **Body/UI:** Inter (Google Fonts) — 400–700 weight
- **Labels:** 11px / 500 / 0.5px tracking / uppercase — used for dates, badges, tagline

## Cooper Black Font

The main font is Cooper, loaded from the project file:
themes/bicyclious/static/fonts/Cooper-Black.ttf. 

`@font-face` declared at top of `main.css`. 

