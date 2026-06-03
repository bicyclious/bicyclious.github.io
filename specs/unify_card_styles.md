# Plan: Unify Card Styles Site-Wide

## Objective
Unify the visual presentation of all content lists (Builds, Blog Posts, and Search/Section results) using a single card component (`bike-card.html`) and a centralized design system in `main.css`. This ensures visual continuity and makes styling adjustments (like font sizes or colors) easier to manage.

## Key Files & Context
- **`themes/bicyclious/assets/css/main.css`**: Central home for all card styling and responsive overrides.
- **`themes/bicyclious/layouts/_partials/bike-card.html`**: The single canonical template for all content cards.
- **`themes/bicyclious/layouts/home.html`**: Homepage blog preview needs conversion to cards.
- **`themes/bicyclious/layouts/posts/list.html`**: Blog list needs conversion to card grid.
- **`themes/bicyclious/layouts/section.html`**: Fallback section page needs conversion to card grid.

## Implementation Steps

### 1. Fix CSS Bugs in `main.css`
- Remove the duplicate `color` property in `.card-overlay-title` that is currently overriding the Hot Pink hex code.
- Fix the double semicolon syntax error (`;;`).

### 2. Enhance `bike-card.html` for General Content
- Ensure the partial gracefully handles posts that might not have a primary image (using the "NO SIGNAL" fallback).
- Stick strictly to the "Image + Title" spec for the overlay (excluding the price pill for posts).

### 3. Convert Homepage Blog Preview
- Un-comment the blog preview section in `home.html`.
- Change the `post-list` container to use `card-grid`.
- Replace the `post-row` markup with `{{ partial "bike-card.html" . }}`.

### 4. Convert Blog List Page (`posts/list.html`)
- Change the list layout from a vertical list of rows to a responsive grid of cards using `card-grid`.
- Replace `post-row` articles with the `bike-card` partial.

### 5. Convert Section Fallback (`section.html`)
- Update the generic fallback to use the `card-grid` and `bike-card` partial for consistency on any other auto-generated pages.

## Verification & Testing
- **Homepage**: Verify the "BUILDS" and "BLOG" sections use the exact same card style and align to the grid.
- **Blog Page**: Verify `/posts/` shows a grid of cards instead of rows.
- **Responsive**: Check phone and tablet sizes to ensure `.card-overlay-title` font-size overrides work as expected in the correct cascade order.
