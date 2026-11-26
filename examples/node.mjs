// VS Code Extensions Scraper - Node.js example
// npm install apify-client
// APIFY_TOKEN=your_token node node.mjs
import { ApifyClient } from 'apify-client';

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });

// Most installed Python extensions
const run = await client.actor('Turboextract/vscode-extensions').call({
    "searchQueries": [
        "python"
    ],
    "sort": "installs",
    "maxResults": 50
});

const { items } = await client.dataset(run.defaultDatasetId).listItems();
for (const item of items) {
    console.log(item.extensionId, item.installs, item.averageRating);
}
