BICYCLIOUS UI SYSTEM — IMAGE-FIRST ZOOMABLE CATALOG
Dark Frosted Glass / View-Transition Design System
1. Core Concept

The entire Bicyclious site is a single-object visual system.

The image is the identity of each bike.

Everything else (name, price, SOLD status, specs) is secondary metadata layered on top.

There are no separate “card images” vs “hero images”.

There is only:

one canonical image per bike, reused everywhere.

2. Design Principle

Each bike is treated as a persistent visual object that changes context:

Home page → cinematic carousel view
Build list → grid catalog view
Build page → expanded detail view

In all cases:

the SAME image is used and visually preserved.

3. Required Behavior: Visual Continuity

The system must preserve image identity across navigation so transitions feel like zooming into the same object.

This enables:

grid card → expands into detail page hero
homepage slide → becomes detail hero
smooth visual continuity instead of page reload feel
4. View Transition System (Primary Mechanism)

Each bike image must have a stable identity hook.

Required attribute:
data-bike-id="bubblicious"
Required CSS (View Transitions API):
[data-bike-id="bubblicious"] {
  view-transition-name: bike-bubblicious;
}

Each bike MUST have a unique but consistent transition name across all pages.

5. GLOBAL IMAGE RULE

All bike images must follow:

same crop logic (or controlled responsive crop)
same object-fit behavior
same rendering style
no separate “card image” vs “hero image” assets
Base image rule:
.bike-image {
  width: 100%;
  height: auto;
  object-fit: cover;
  display: block;
}
6. OVERLAY SYSTEM (ONLY UI LAYER ON IMAGES)

All metadata appears as a floating frosted glass overlay.

Allowed overlay content ONLY:
Bike name
Price OR “SOLD”

No descriptions, no specs, no extra metadata in overlays.

Overlay style:
.glass {
  background: rgba(255,255,255,0.06);
  backdrop-filter: blur(18px) saturate(140%);
  -webkit-backdrop-filter: blur(18px);

  border: 1px solid rgba(255,255,255,0.10);
  border-radius: 16px;

  color: rgba(255,255,255,0.92);
  box-shadow: 0 10px 30px rgba(0,0,0,0.25);
}
7. HOMEPAGE (ABOVE THE FOLD)
Structure:
full-screen Swiper carousel
each slide = one bike image
floating glass overlay per slide
Slide overlay content:

Available bike:

Name
$Price

Sold bike:

Name
SOLD
No hero text section above fold.

The carousel is the homepage identity.

8. BUILD LIST PAGE (GRID)

Each bike card is simplified to:

Structure:
image (primary element)
floating glass overlay (top-left or bottom-left)
no separate card body
Card model:
<article class="bike-card">
  <a href="/builds/bubblicious/">

    <div class="bike-media">
      <img
        src="/builds/bubblicious/cover.jpg"
        class="bike-image"
        data-bike-id="bubblicious"
      />

      <div class="bike-overlay glass">
        <div class="bike-name">Bubblicious</div>
        <div class="bike-price">$1200</div>
      </div>
    </div>

  </a>
</article>
SOLD state:
Name
SOLD

No price shown unless desired.

9. BUILD DETAIL PAGE

The build detail page is a zoom expansion of the same image object.

Rules:
SAME image as list/grid/home
becomes full hero image
no re-layout of image structure
metadata floats above image in glass panel
Structure:
<section class="bike-detail">

  <img
    src="/builds/bubblicious/cover.jpg"
    class="bike-hero-image"
    data-bike-id="bubblicious"
  />

  <div class="bike-detail-overlay glass">
    <h1>Bubblicious</h1>
    <div>$1200</div>
  </div>

</section>
10. ZOOM TRANSITION BEHAVIOR

Navigation between pages should behave like:

the same image is smoothly expanding from grid → full screen

Using View Transitions API:

image keeps identity across pages
browser animates position/scale automatically
creates “zoom into object” effect
11. COLOR SYSTEM

Only one persistent brand color:

Accent:
Bubblegum pink (used sparingly)
Everything else:
dark charcoal background
grayscale text hierarchy
translucent glass surfaces
12. HEADER SYSTEM

Single consistent header across all pages:

frosted glass background
subtle blur
same structure everywhere
no page-specific redesign
13. DESIGN INTENT

The site should feel like:

a cinematic, zoomable archive of bicycle objects

Not:

ecommerce store
marketing homepage
blog + shop hybrid

Each bike is a visual artifact you navigate through by zooming in.

14. SUMMARY RULES (CRITICAL)
One bike = one image identity across all pages
No separate hero vs card images
Overlay only contains name + price/SOLD
Glass UI is always subtle and consistent
Navigation feels like zooming into objects
Homepage, list, and detail are different views of the same system
