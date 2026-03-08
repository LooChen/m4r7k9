#!/bin/bash

# sync-from-github.sh
# Overwrites local essay files with the current GitHub versions.
# Run this at the start of any session to ensure local = GitHub.
# GitHub is the source of truth.

REPO="LooChen/m4r7k9"
RAW="https://raw.githubusercontent.com/$REPO/main"
BOOK_DIR="$(dirname "$0")"

FILES=(
  "essays/preface.html"
  "essays/01-ego-as-process.html"
  "essays/02-the-filter-in-action.html"
  "essays/03-the-status-game.html"
  "essays/04-placeholder.html"
  "essays/05-the-curator.html"
  "essays/06-why-wisdom-gets-filtered-out.html"
  "essays/07-the-realms.html"
  "essays/08-making-the-world-conform.html"
  "essays/09-dissolving-the-beliefs.html"
  "essays/10-de-objectifying-the-self.html"
  "essays/11-the-trap-on-both-paths.html"
  "essays/12-spirit-path-vs-status-path.html"
  "essays/13-what-opening-the-heart-means.html"
  "assets/style.css"
  "index.html"
  "skill/SKILL.md"
)

echo "Syncing from GitHub ($REPO)..."
echo ""

SUCCESS=0
FAIL=0

for FILE in "${FILES[@]}"; do
  URL="$RAW/$FILE"
  DEST="$BOOK_DIR/$FILE"

  # Ensure directory exists
  mkdir -p "$(dirname "$DEST")"

  HTTP_STATUS=$(curl -s -o "$DEST" -w "%{http_code}" "$URL")

  if [ "$HTTP_STATUS" = "200" ]; then
    echo "  ✓ $FILE"
    SUCCESS=$((SUCCESS + 1))
  else
    echo "  ✗ $FILE (HTTP $HTTP_STATUS)"
    FAIL=$((FAIL + 1))
  fi
done

echo ""
echo "Done. $SUCCESS synced, $FAIL failed."
echo "Local folder is now in sync with GitHub."
