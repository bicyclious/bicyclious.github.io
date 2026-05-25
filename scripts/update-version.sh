#!/bin/bash

# Get the latest tag, or fallback to short hash if no tags exist
# --tags: include all tags
# --always: fallback to hash if no tags
# --dirty: append -dirty if there are uncommitted changes
VERSION=$(git describe --tags --always --dirty 2>/dev/null || echo "v0.0.0-$(git rev-parse --short HEAD)")

# Ensure data directory exists
mkdir -p data

# Write to JSON for easy Hugo consumption
echo "{\"version\": \"$VERSION\", \"buildDate\": \"$(date -u +"%Y-%m-%dT%H:%M:%SZ")\"}" > data/version.json

echo "Version set to: $VERSION"
