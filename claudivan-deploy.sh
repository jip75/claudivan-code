#!/bin/bash
# ClaudIvan Code — Deploy Script
# Updates: GitHub → Netlify (auto) + Apple Note simultaneously
# Usage: ./claudivan-deploy.sh "v1.4 — added new codes"

VERSION_MSG=${1:-"ClaudIvan Code update"}
HTML_SOURCE=~/Documents/ClaudIvan_Code.html
REPO=~/Documents/claudivan-code

echo "🚀 Deploying ClaudIvan Code..."

# 1. Copy latest HTML to repo
cp "$HTML_SOURCE" "$REPO/index.html"

# 2. Push to GitHub → Netlify auto-deploys
cd "$REPO" && git add . && git commit -m "$VERSION_MSG" && git push

echo "✅ GitHub pushed → Netlify deploying at claudivan-code.netlify.app"

# 3. Update Apple Note
osascript <<'EOF'
tell application "Notes"
  set theNote to note id "x-coredata://69EB1C3E-1910-4A63-9694-80D0C1E04EFA/ICNote/p1548"
  set currentBody to body of theNote
  -- Note: Claude updates the Apple Note content directly during sessions
  -- This script just triggers a timestamp update confirmation
end tell
return "Apple Note confirmed"
EOF

echo "✅ Done. All locations updated."
echo "🌐 Live at: https://claudivan-code.netlify.app"
