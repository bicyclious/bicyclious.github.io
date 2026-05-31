#!/bin/bash
# lint-builds.sh
ERRORS=0

for index in content/builds/*/index.md; do
  dir=$(dirname "$index")
  slug=$(basename "$dir")

  # Extract social_image value from frontmatter
  social_image=$(grep -m1 '^social_image:' "$index" | sed 's/social_image:[[:space:]]*//' | tr -d '"'"'"' ')

  if [ -z "$social_image" ]; then
    echo "❌ $slug: missing social_image"
    ERRORS=$((ERRORS + 1))
  elif [ ! -f "$dir/$social_image" ]; then
    echo "❌ $slug: social_image '$social_image' not found in $dir/"
    ERRORS=$((ERRORS + 1))
  else
    echo "✅ $slug: $social_image"
  fi
done

echo ""
[ $ERRORS -eq 0 ] && echo "All builds passed." || echo "$ERRORS error(s) found."
exit $ERRORS
