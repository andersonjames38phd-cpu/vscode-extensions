#!/usr/bin/env bash
# VS Code Extensions Scraper - curl examples
# Replace YOUR_TOKEN with an Apify API token (https://console.apify.com/account/integrations).

set -euo pipefail

ACTOR="Turboextract~vscode-extensions"
TOKEN="${APIFY_TOKEN:-YOUR_TOKEN}"

# 1. Trending AI extensions this week (start a run)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/runs?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "categories": [
      "AI"
    ],
    "sort": "trending",
    "maxResults": 100
  }'

# 2. Most installed Python extensions (start a run)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/runs?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "searchQueries": [
      "python"
    ],
    "sort": "installs",
    "maxResults": 50
  }'

# 3. All extensions from one publisher (wait and get the dataset items in one call)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/run-sync-get-dataset-items?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "publishers": [
      "ms-python"
    ],
    "maxResults": 100
  }'
