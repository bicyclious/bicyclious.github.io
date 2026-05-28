# BICYCLIOUS UI SYSTEM — IMAGE-FIRST ZOOMABLE CATALOG

## Dark Frosted Glass / View-Transition Design System

## 1. Core Concept

The entire Bicyclious site is a single-object visual system.

The image is the identity of each bike.

Everything else (name, price, SOLD status, specs) is secondary metadata layered on top.

There are no separate “card images” vs “hero images”.

There is only one canonical image per bike, reused everywhere.

## 2. Design Principle

Each bike is a persistent visual object that changes context:

- Home page → cinematic carousel view  
- Build list → grid catalog view  
- Build page → expanded detail view  

In all cases: the SAME image is used and visually preserved.

## 3. Required Behavior: Visual Continuity

The system must preserve image identity across navigation so transitions feel like zooming into the same object.

## 4. View Transition System

Each bike image must have:

data-bike-id="bike-name"

and:

view-transition-name: bike-bike-name;

## 5. GLOBAL IMAGE RULE

All bike images follow:

- same crop logic
- same object-fit behavior
- same rendering style

.bike-image {
  width: 100%;
  height: auto;
  object-fit: cover;
  display: block;
}

## 6. OVERLAY SYSTEM

Only allowed overlay content:
- Name
- Price OR SOLD

.glass {
  background: rgba(255,255,255,0.06);
  backdrop-filter: blur(18px) saturate(140%);
  border: 1px solid rgba(255,255,255,0.10);
  border-radius: 16px;
  color: rgba(255,255,255,0.92);
}

## 7. HOMEPAGE

- full-screen Swiper carousel
- image + floating overlay only
- no hero text block above fold

Overlay:
Name + Price OR SOLD

## 8. BUILD LIST

Card = image + floating overlay only

No card body, no descriptions inside cards.

## 9. BUILD DETAIL PAGE

Same image becomes hero.

Overlay floats above image.

## 10. ZOOM TRANSITION

Use View Transitions API for navigation:

view-transition-name shared across pages enables zoom effect.

## 11. COLOR SYSTEM

- Accent: bubblegum pink only
- Everything else: dark neutral + glass

## 12. HEADER

Single frosted glass header across all pages.

## 13. DESIGN INTENT

A zoomable archive of bicycle objects.

NOT a traditional ecommerce site.
