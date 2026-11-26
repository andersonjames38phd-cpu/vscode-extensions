"""VS Code Extensions Scraper - Python example.

pip install apify-client
export APIFY_TOKEN=your_token
"""
import os

from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])

# Trending AI extensions this week
run = client.actor("Turboextract/vscode-extensions").call(run_input={
    "categories": [
        "AI"
    ],
    "sort": "trending",
    "maxResults": 100
})

# Stream every item
for item in client.dataset(run["defaultDatasetId"]).iterate_items():
    print(item.get("extensionId"), item.get("installs"), item.get("averageRating"))

# Or fetch one page of items
page = client.dataset(run["defaultDatasetId"]).list_items(limit=100)
print(f"{page.total} items in dataset")
