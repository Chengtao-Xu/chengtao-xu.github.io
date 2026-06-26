#!/bin/bash
# Update Google Scholar citation counts, H-index, and push to GitHub.
# Run from the repo root: bash bin/update_citations_and_push.sh

set -e
cd "$(dirname "$0")/.."

echo "==> Installing Python dependencies..."
pip install scholarly pyyaml -q

echo "==> Fetching citation data from Google Scholar..."
python bin/update_scholar_citations.py

echo "==> Fetching H-index..."
HINDEX=$(python - <<'EOF'
import yaml
from scholarly import scholarly

with open("_data/socials.yml") as f:
    config = yaml.safe_load(f)

scholar_id = config.get("scholar_userid")
author = scholarly.search_author_id(scholar_id)
author = scholarly.fill(author, sections=["indices"])
print(author.get("hindex", "N/A"))
EOF
)

MONTH=$(date +"%B %Y")
echo "==> H-index: $HINDEX (as of $MONTH)"

echo "==> Updating H-index in publications.md..."
sed -i '' "s/H-index: [0-9]* (Google Scholar, [^)]*)/H-index: $HINDEX (Google Scholar, $MONTH)/" _pages/publications.md

echo "==> Committing and pushing..."
git add _data/citations.yml _pages/publications.md
git commit -m "Update citation counts and H-index ($MONTH)"
git push origin main

echo "==> Done!"
