#!/bin/bash
set -euo pipefail

# --------------------------------------------
# Hugo build script (local + CI + Cloudflare)
# --------------------------------------------

echo "🧹 Cleaning previous build..."
rm -rf public

echo "📦 Checking Hugo version..."
hugo version || true

echo "🏗️ Building site..."
hugo --minify

echo "✅ Build complete"
