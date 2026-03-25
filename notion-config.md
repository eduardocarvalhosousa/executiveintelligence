# Notion + GitHub Configuration — Executive Intelligence

---

## Live Briefing (GitHub Pages)

The interactive HTML briefing lives here. Cowork saves `index.html` to the local
GitHub folder → GitHub Desktop pushes it → live URL updates within ~30 seconds.

- **LIVE_URL**: `https://eduardocarvalhosousa.github.io/executiveintelligence/`
- **github_folder**: `~/Documents/GitHub/executiveintelligence/`
- **repo**: `https://github.com/eduardocarvalhosousa/executiveintelligence`

### How to save the HTML output:
1. Save the generated HTML as `index.html` inside `~/Documents/GitHub/executiveintelligence/`
   (this overwrites the previous edition — it is always the latest)
2. Also save a dated backup in the same folder:
   - AM edition: `EI-YYYY-MM-DD-0600.html`
   - PM edition: `EI-YYYY-MM-DD-1230.html`
3. Open GitHub Desktop → the change will appear automatically
4. Click **Commit to main** → **Push origin**
5. Live URL updates: https://eduardocarvalhosousa.github.io/executiveintelligence/

**Do NOT paste the HTML into Notion** — Notion cannot render JavaScript or CSS.
The HTML must be served via GitHub Pages to work interactively.

---

## Notion: Main Hub (internal view — Eduardo only)

- **Page title**: Executive Intelligence
- **Page ID**: `32d357f8-f580-81d3-bf5c-daaf55ca12a2`
- **URL**: https://www.notion.so/32d357f8f58081d3bf5cdaaf55ca12a2

---

## Notion: Today's Briefing Page (share this with friends & family)

Update this page each run with a plain-text summary + link to the live briefing.
Share the public Notion link OR the GitHub Pages URL directly — both work.

- **Page title**: Today's Briefing
- **todays_briefing_page_id**: `32d357f8-f580-819d-8ad2-ebf97487d1a1`
- **URL**: https://www.notion.so/32d357f8f580819d8ad2ebf97487d1a1
- **How to share**: Open in Notion → Share (top right) → Publish to web
  → Allow comments → Copy link

### What to write on this page each run:
Replace the existing content with:
```
> 🔗 Full interactive briefing → https://eduardocarvalhosousa.github.io/executiveintelligence/

## [Edition label] — [Weekday DD Mon YYYY]

### Top stories
- **Geopolitics**: [2-3 sentence summary]
- **Markets**: [2-3 sentence summary]
- **Technology**: [2-3 sentence summary]
- **Health**: [2-3 sentence summary]
- **Marketing**: [2-3 sentence summary]
- **CEO Radar**: [2-3 sentence summary]
- **Spirits**: [2-3 sentence summary]

### Newsletters processed
[Number] newsletters: [list source names]
```

---

## Notion: Archive Database (metadata only — no HTML)

A new row is added after every run. Plain-text summary + properties. No HTML.

- **Database title**: EI Briefing Archive
- **Database ID**: `129f6512705d4f0da012f4c0519e02c9`
- **Data Source ID**: `c07276b7-87d0-4311-8285-8f2a6d44168e`
- **Data Source URL**: `collection://c07276b7-87d0-4311-8285-8f2a6d44168e`

### Properties to set for each new archive row:

| Property | Type | Example |
|----------|------|---------|
| `Title` | text | `EI Briefing — Tuesday 25 Mar 2026 06:00 AM` |
| `date:Date:start` | date | `2026-03-25` |
| `date:Date:is_datetime` | number | `0` |
| `Edition` | select | `AM Full` or `PM Delta` |
| `Status` | select | `Published` |
| `Top Stories` | text | `• Story 1\n• Story 2\n• Story 3\n• Story 4\n• Story 5` |
| `Sections Covered` | multi_select JSON | `["Geopolitics","Markets","Technology","Health","Marketing","CEO Radar","Spirits"]` |
| `Newsletter Count` | number | integer, e.g. `18` |
| `Notes` | text | Any run errors, missing sources, observations |

### Archive page content (plain text only):
```
## [Edition label] — [Date]

### Top stories
- **Geopolitics**: [summary]
- **Markets**: [summary]
- **Technology**: [summary]
- **Health**: [summary]
- **Marketing**: [summary]
- **CEO Radar**: [summary]
- **Spirits**: [summary]

### Newsletters processed
[list]

---
Full interactive briefing: https://eduardocarvalhosousa.github.io/executiveintelligence/
```

---

## Summary: What Goes Where

| Content | Destination | Reason |
|---------|-------------|--------|
| `index.html` (latest briefing) | `~/Documents/GitHub/executiveintelligence/` → push | GitHub Pages renders HTML + JS |
| `EI-YYYY-MM-DD-HHMM.html` (backup) | same folder | Local archive of exact editions |
| Plain-text summary + live link | Notion Today's Briefing page | Readable + commentable anywhere |
| Metadata row | Notion Archive database | Searchable history |

**Rule**: Never paste raw HTML into Notion. Always use GitHub Pages for the live briefing.

---
*Last updated: 25 March 2026*
