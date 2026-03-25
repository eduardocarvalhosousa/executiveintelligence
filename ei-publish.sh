#!/bin/bash
# ─────────────────────────────────────────────────────────────
# Executive Intelligence — Auto-publish to GitHub Pages
# Run this after Cowork saves index.html to the GitHub folder.
# No GitHub Desktop interaction needed.
#
# Usage: bash ei-publish.sh
# Or make executable once: chmod +x ei-publish.sh
# Then run: ./ei-publish.sh
# ─────────────────────────────────────────────────────────────

REPO_PATH="$HOME/Documents/GitHub/executiveintelligence"
LIVE_URL="https://eduardocarvalhosousa.github.io/executiveintelligence/"

echo "📰 Executive Intelligence — Publishing..."
echo ""

# Navigate to repo
cd "$REPO_PATH" || { echo "❌ Folder not found: $REPO_PATH"; exit 1; }

# Check index.html exists
if [ ! -f "index.html" ]; then
  echo "❌ index.html not found in $REPO_PATH"
  echo "   Make sure Cowork saved the file before running this script."
  exit 1
fi

# Stage all HTML files
git add index.html EI-*.html 2>/dev/null
git add . 2>/dev/null

# Check if there's anything to commit
if git diff --staged --quiet; then
  echo "ℹ️  No changes to publish — index.html is unchanged."
  exit 0
fi

# Commit with timestamp
TIMESTAMP=$(date '+%a %d %b %Y %H:%M')
git commit -m "EI Briefing — $TIMESTAMP"

# Push to GitHub
echo ""
echo "⬆️  Pushing to GitHub..."
git push origin main

if [ $? -eq 0 ]; then
  echo ""
  echo "✅ Published successfully!"
  echo "   Live in ~30 seconds at:"
  echo "   $LIVE_URL"
else
  echo ""
  echo "❌ Push failed. Check your internet connection or GitHub credentials."
  echo "   You can retry by running: git push origin main"
  exit 1
fi
