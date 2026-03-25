# Executive Intelligence — Daily Briefing Instructions
# For Claude Cowork Scheduled Task

---

## OVERVIEW

You are generating the **Executive Intelligence (EI) daily briefing** for Eduardo Sousa.
The briefing is an HTML document. The structure, CSS, JavaScript, and modal system are
fixed in `ei-template.html`. Your job is to fill in content — never touch the structure.

There are two daily editions:

| Edition | Time (Lisbon) | Gmail window | Output file |
|---------|--------------|--------------|-------------|
| **AM Full** | 06:00 | Last 24 hours | `EI-YYYY-MM-DD-0600.html` |
| **PM Delta** | 12:30 | Since 06:00 today | `EI-YYYY-MM-DD-1230.html` |

---

## STEP 1 — FETCH NEWSLETTERS FROM GMAIL

### For the AM Full edition (06:00 run):
Search Gmail for emails received in the past 24 hours:
```
label:newsletters after:YESTERDAY_DATE
label:newsletters/spirits-news after:YESTERDAY_DATE
```
Where YESTERDAY_DATE = today minus 24 hours in YYYY/MM/DD format.

### For the PM Delta edition (12:30 run):
Search Gmail for emails received since 06:00 today only:
```
label:newsletters after:TODAY_DATE
label:newsletters/spirits-news after:TODAY_DATE
```
Filter results to only include emails timestamped after 06:00 Lisbon time today.

### Reading the emails:
- Retrieve the full body of every email found (use gmail_read_message for each)
- Extract: headline/subject, key stories, data points, source name, and any direct URLs
  mentioned in the email body
- For Spirits News emails, tag them separately — they go into Section VII only
- Ignore promotional/advertising content within newsletters (ads, sponsor sections)
- Note the sender name for each email (NYT, Semafor, Daily Upside, etc.) — this
  becomes the source badge on each story

---

## STEP 2 — OPEN THE TEMPLATE

Open the file `ei-template.html` from this project folder.
You will replace each `{{PLACEHOLDER}}` with the appropriate content.
Do NOT modify anything outside the placeholders.
Do NOT change any CSS, JavaScript functions, HTML structure, class names, or IDs.

---

## STEP 3 — FILL IN THE HEADER PLACEHOLDERS

### `{{BRIEFING_DAY_DATE}}`
Full date in format: `Monday, March 24, 2026`
Use today's actual date and day name.

### `{{BRIEFING_EDITION_TIME}}`
- AM run: `Morning Edition · 06:00 GMT`
- PM run: `Midday Update · 12:30 GMT`

### `{{BRIEFING_DATE_RANGE}}`
- AM run: `March 23–24, 2026` (yesterday to today)
- PM run: `March 24, 2026` (today only)

### `{{TICKER_TEXT}}`
Write a scrolling ticker with 15–20 of the most important headlines from today's
newsletters, separated by ` · ` (space-dot-space). Keep each item under 8 words.
Duplicate the full string once (needed for seamless CSS scroll loop).
Example format:
```
ISRAEL STRIKES TEHRAN · Oil $175/barrel risk · Samsung $73.5B AI bet · [etc] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ISRAEL STRIKES TEHRAN · Oil $175/barrel risk · Samsung $73.5B AI bet · [etc]
```
The `&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;` separates the two copies.

---

## STEP 4 — FILL IN THE KPI STRIP

### `{{KPI_STRIP_ITEMS}}`
Seven data points, each as a `<div class="kpi">` block. Choose the 7 most
important numbers from today's newsletters — across all topics (not just one section).
Prioritise: market moves, geopolitical figures, AI/tech numbers, economic data.

Color coding rules:
- `class="kn red"` → negative/alarming (market drops, casualties, risk)
- `class="kn amb"` → significant/watch (large investments, policy moves)
- `class="kn grn"` → positive/growth (GDP growth, gains, positive surprises)

Format for each KPI block:
```html
<div class="kpi">
  <span class="kn [red|amb|grn]">VALUE</span>
  <span class="kl">LABEL LINE 1<br>LABEL LINE 2</span>
</div>
```

Rules:
- VALUE: number, percentage, or short symbol (e.g. `$175`, `-10%`, `4.4%`, `$73.5B`)
- LABEL: max 4 words per line, max 2 lines, all lowercase
- All 7 divs must be present — no more, no fewer
- Separate each with `\n` — no wrapping div needed (the kpi-strip div is already in template)

---

## STEP 5 — FILL IN EACH SECTION

There are 7 sections. For each section you fill TWO placeholders:
1. `{{SECTION_XXX_CONTENT}}` — the main editorial content
2. `{{SECTION_XXX_NOT_COVERED}}` — the list of stories not included in the main content

### SECTION LAYOUT RULES (critical — do not deviate)

The sections use these grid layouts. Use them exactly:

**Lead story + sidebar** (use for Section I Geopolitics):
```html
<div class="lead-grid">
  <div class="lm">
    <!-- main lead story goes here -->
  </div>
  <div class="ls">
    <div class="si"><!-- sidebar story 1 --></div>
    <div class="si"><!-- sidebar story 2 --></div>
    <div class="si"><!-- sidebar story 3 --></div>
    <div class="si"><!-- sidebar story 4 --></div>
  </div>
</div>
```

**Three-column grid** (use for most sections):
```html
<div class="three-col">
  <div class="col"><!-- story 1 --></div>
  <div class="col"><!-- story 2 --></div>
  <div class="col"><!-- story 3 --></div>
</div>
```

**Two-column grid** (use for longer analysis pieces):
```html
<div class="two-col">
  <div class="col"><!-- long story --></div>
  <div class="col"><!-- signal items --></div>
</div>
```

**Spirits section** (has its own wrapper):
```html
<div class="spirits-wrap">
  <div class="spirits-hdr">
    <div class="spirits-hdr-t">🍷 Spirits &amp; Drinks Intelligence</div>
    <div class="spirits-hdr-s">Sources: [list sources used today]</div>
  </div>
  <div class="spirits-grid">
    <div class="scol"><!-- story 1 --></div>
    <div class="scol"><!-- story 2 --></div>
    <div class="scol"><!-- story 3 --></div>
  </div>
  <div class="spirits-strip">
    <div class="spirits-strip-t">Quick Hits — Spirits &amp; Wine</div>
    <div class="sbulls">
      <!-- 9 bullet items -->
    </div>
  </div>
</div>
```

**Marketing section** (has its own wrapper):
```html
<div class="mktg-wrap">
  <div class="mktg-hdr">
    <div class="mktg-hdr-t">📣 Marketing &amp; Digital Intelligence</div>
    <div class="mktg-hdr-s">Sources: [list sources used today]</div>
  </div>
  <div class="mktg-grid">
    <div class="mcol"><!-- story 1 --></div>
    <div class="mcol"><!-- story 2 --></div>
    <div class="mcol"><!-- story 3 --></div>
  </div>
  <div class="mktg-grid" style="border-top:1px solid rgba(13,92,78,.2)">
    <div class="mcol"><!-- story 4 --></div>
    <div class="mcol"><!-- story 5 --></div>
    <div class="mcol"><!-- story 6 --></div>
  </div>
</div>
```

---

### STORY BLOCK ANATOMY

Every story — whether in a col, si, lm, scol, or mcol — follows this exact pattern:

```html
<span class="sk">KICKER TEXT</span>
<div class="sh2 [lg|sm|'']">HEADLINE</div>
<div class="sb [sm|'']">
  <p>Paragraph 1 of story.</p>
  <p>Paragraph 2 of story.</p>
  <div class="pq">Optional pull quote — use for strongest quotes only.</div>
  <p>Optional further paragraphs.</p>
</div>
<div class="smeta">
  <span class="badge [SOURCE_CLASS]">SOURCE NAME</span>
  <span class="badge [SOURCE_CLASS]">SECOND SOURCE</span>
  <button class="rb" onclick="openModal('ARTICLE_ID')">BUTTON LABEL</button>
</div>
```

**Headline size classes:**
- `.sh2.lg` — lead story only (font-size: 30px)
- `.sh2.sm` — sidebar, spirits columns, signal items (font-size: 16px)
- `.sh2` (no modifier) — standard three-col story (font-size: 17px in col, 20px in two-col)

**Body size classes:**
- `.sb` — standard body
- `.sb.sm` — smaller body for sidebar/spirits items

**Kicker text:** 1–3 words in ALL CAPS describing the topic/category.
Example: `Iran–Israel War · Energy`, `Semiconductors`, `M&A · Media`, `AI Strategy`

**Tags** (optional, above the headline):
```html
<span class="tag [red|gold|spt|mkt|'']">TAG TEXT</span>
```
Use sparingly — only for highest-priority stories. Classes:
- `tag` (plain) — neutral category tag
- `tag red` — urgent/negative
- `tag gold` — strategic/important
- `tag spt` — spirits section
- `tag mkt` — marketing section

---

### SOURCE BADGE CLASSES

Use these exact classes for source badges:

| Source | Class |
|--------|-------|
| New York Times | `s-nyt` |
| Semafor | `s-sem` |
| The Daily Upside | `s-up` |
| The Rundown AI | `s-run` |
| Reuters | `s-reu` |
| Expresso | `s-exp` |
| Financial Times | `s-ft` |
| Quartz | `s-qz` |
| Vox | `s-vox` |
| VinePair | `s-vp` |
| Just Drinks | `s-jd` |
| Wine Business | `s-wb` |
| Global Drinks Intel | `s-gdi` |
| Snacks / Robinhood | `s-rh` |
| Section AI | `s-sec` |
| Staying Ahead | `s-vai` |

If a new source appears that's not in this list, add a badge with class `s-nyt` as fallback
and note it so the class list can be updated.

---

### ARTICLE IDs AND THE MODAL SYSTEM

Every story needs a unique article ID. IDs must:
- Be lowercase alphanumeric with hyphens only
- Be unique across the entire file
- Follow naming convention: `[topic-keyword]-[number]`
  Examples: `geo-1`, `samsung-1`, `glp1-2`, `ni-iran-vox`

For "not covered" items, prefix with `ni-`:
  Examples: `ni-iran-vox`, `ni-chuck-norris`, `ni-overholt`

---

## STEP 6 — BUILD THE ARTICLES JS OBJECT

### Articles Data (replaces `/*ARTICLES_DATA*/` comment)

This is the most important part. Every article ID referenced in an
`onclick="openModal('ID')"` button MUST have a corresponding entry.

In `ei-template.html` the articles block looks like:
```javascript
/* ARTICLES_PLACEHOLDER_START */
const articles = {/*ARTICLES_DATA*/};
/* ARTICLES_PLACEHOLDER_END */
```

When generating the output file, replace `{/*ARTICLES_DATA*/}` with
the full populated object: `{ 'id1':{...}, 'id2':{...}, ... }`.

Format for each entry:
```javascript
  'ARTICLE_ID':{source:'SOURCE NAME · DATE',title:'FULL HEADLINE',label:'NEWSLETTER NAME — sender@email.com',body:`
<p>First paragraph — full text of the story from the newsletter.</p>
<h3>Subheading if the story has sections</h3>
<p>More paragraphs.</p>
<ul>
  <li>Bullet point if the newsletter used bullets</li>
</ul>
<blockquote>Direct quote if present in the original</blockquote>
<p>Final paragraph.</p>
`},
```

**Critical rules for the JS object:**
1. Each entry ends with `},` (comma after closing brace) — except the very last entry
2. Use backtick template literals for `body` — never single or double quotes
3. For `source`, `title`, `label` values: use double quotes `"` if the value
   contains an apostrophe (e.g. `"Vox's Today, Explained"`). Otherwise single quotes are fine.
4. Body content uses HTML tags. All apostrophes and quotes inside the backtick body
   are safe — backticks don't need escaping for apostrophes.
5. NEVER put a raw single quote inside a single-quoted JS string.
   BAD:  `source:'Vox's Today...'`
   GOOD: `source:"Vox's Today..."`
6. Every `openModal('ID')` call in the HTML must have a matching entry here.
   Before finalising, do a mental check: count all openModal calls, confirm each ID exists.

**Body content guidelines:**
- Transcribe the key substance of the original newsletter story in full
- Include: context, key facts, quotes, data points, implications
- Use `<h3>` for subheadings if the original had sections
- Use `<blockquote>` for direct quotes from sources
- Use `<ul><li>` for bullet points if the original used them
- Aim for 150–400 words per entry — enough to read and understand without going
  to the original source
- For "not covered" items: write a 100–200 word summary explaining what the story
  is about, why it matters, and the key facts

---

## STEP 7 — NOT COVERED LISTS

### `{{SECTION_XXX_NOT_COVERED}}`

For each section, list ALL stories from today's newsletters that were not included
in the main section content above. These become the "Also in X — not covered above" strip.

Format for each item:
```html
<li>SOURCE: "Story headline or description" — brief context<button class="ni-btn" onclick="openModal('ni-UNIQUE-ID')">Read</button></li>
```

Rules:
- Every `<li>` MUST have a corresponding `ni-ARTICLE-ID` entry in the articles JS object
- Keep the description short (under 15 words) — the modal has the full text
- Include SOURCE: prefix (NYT, Vox, Semafor, etc.)
- Include EVERYTHING not in main content — even short items and minor stories
- For the PM Delta edition: you can abbreviate or skip this section if newsletter
  volume is low (under 5 new stories total)

---

## STEP 8 — SECTION-SPECIFIC RULES

### Section I — Geopolitics & Energy
- Lead story: the single most important geopolitical story (usually the biggest
  ongoing conflict, energy crisis, or major diplomatic event)
- Lead sidebar: 3–4 smaller geopolitical/energy stories
- Second grid: if there are many stories, use a three-col for additional items
- Always include Iran conflict coverage if it's in the newsletters
- Include Portuguese news (Expresso) if relevant to geopolitics

### Section II — Markets & Finance
- Cover: macro markets, equities, commodities, ETFs, M&A, regulation
- Three-col + optional second three-col
- Include ETF Upside content here (not in Tech)
- Include Snacks/Robinhood financial analysis here

### Section III — Technology & AI
- Cover: AI models, AI companies, tech M&A, semiconductors, software
- Use two-col: long analysis piece on left, signal items on right
- Signal items use `.sgi` / `.sgt` / `.sgb` classes (not `.col`)
- Signal items format:
  ```html
  <div class="sgi">
    <div class="sgt">SIGNAL TITLE</div>
    <div class="sgb">2–3 sentence summary.</div>
    <div class="smeta">
      <span class="badge s-CLASS">SOURCE</span>
      <button class="rb" onclick="openModal('ID')">Read</button>
    </div>
  </div>
  ```

### Section IV — Health, Society & Culture
- Cover: healthcare/pharma news, workforce trends, culture, society
- Three-col layout
- Include Quartz Leadership pieces here
- Include relevant Vox pieces here

### Section V — Marketing, Digital & Go-to-Market
- Cover: brand strategy, digital platforms, consumer behaviour, GTM tactics,
  e-commerce, social media, AI tools for marketing
- Uses `mktg-wrap` with `mktg-hdr`, two rows of `mktg-grid` with 3 `mcol` each
- Section tag class: `st mk` (green)
- Source kicker class in mcol: `sk` with color `var(--mktg)` (inherited via `.mcol .sk`)
- Explicitly look for: AI brand visibility stories, platform changes, consumer
  spending data, distribution/e-commerce developments, digital tools

### Section VI — CEO Radar
- Cover: legal/courts, regulatory, press freedom, political, defence, executive moves
- Three-col layout
- This is a "catch-all" for important executive-level watch items that don't fit elsewhere

### Section VII — Spirits & Drinks
- ONLY use content from `label:newsletters/spirits-news` emails
- Uses `spirits-wrap` with `spirits-hdr`, `spirits-grid` (3 `scol`), `spirits-strip`
- Section tag class: `st sp` (purple)
- Source kicker in scol: color is `var(--spirits)` via `.scol .sk`
- Three main stories in `scol` columns (lead stories for the day)
- Quick hits strip: 9 bullet items using `sbull` class format:
  ```html
  <div class="sbull">
    <strong>SHORT TITLE</strong> — one sentence description.
    <button class="rb" onclick="openModal('ni-ID')" style="margin-top:4px">Read</button>
  </div>
  ```
- If fewer than 9 stories available, use however many there are (minimum 3)

---

## STEP 9 — PM DELTA EDITION DIFFERENCES

For the 12:30 PM Delta update:

1. **Edition label**: `Midday Update · 12:30 GMT`
2. **KPI strip**: Only include KPIs from NEW stories since 06:00 — if no new
   major numbers, use 3–4 KPIs instead of 7 and note "New since 06:00"
3. **Sections**: Only include sections that have NEW content. If Tech has no new
   newsletters since 6am, omit it entirely (remove that section's placeholder content,
   leave it empty so it doesn't render)
4. **"Not covered" lists**: Abbreviated — only list items not covered in either
   the AM or PM editions combined. Can be skipped if volume is low.
5. **Nav bar**: Only show nav buttons for sections that have content. To hide a
   nav button for an empty section, add `style="display:none"` to that `.nb` element.
6. **Ticker**: Only include stories from the PM window, not AM stories
7. **Lead story**: Use whatever is the biggest story since 06:00, even if smaller
   than the AM lead

---

## STEP 10 — SAVE THE HTML AND PUBLISH

### 10a — Save the HTML file to the GitHub folder

The GitHub folder path is: `~/Documents/GitHub/executiveintelligence/`

- Save the generated HTML as **`index.html`** in that folder.
  This overwrites the previous edition and becomes the new live briefing.
- Also save a **dated backup** in the same folder:
  - AM edition: `EI-YYYY-MM-DD-0600.html`
  - PM edition: `EI-YYYY-MM-DD-1230.html`
  (Example: `EI-2026-03-25-0600.html`)

**IMPORTANT**: Do NOT paste the HTML into Notion. Notion cannot render
JavaScript or CSS. The HTML must be served via GitHub Pages.

### 10b — Auto-publish to GitHub Pages

After saving index.html, run the publish script that lives in this project folder:

```bash
bash ~/Documents/GitHub/executiveintelligence/ei-publish.sh
```

Or equivalently, run these commands directly:

```bash
cd ~/Documents/GitHub/executiveintelligence
git add index.html EI-*.html
git commit -m "EI Briefing — $(date '+%a %d %b %Y %H:%M')"
git push origin main
```

The script handles everything: staging, committing with a timestamp, and pushing.
No GitHub Desktop interaction needed. No manual steps.

The live URL will update within ~30 seconds:
https://eduardocarvalhosousa.github.io/executiveintelligence/

**Note**: If this is the very first run and git push asks for credentials,
that means GitHub Desktop credentials haven't been stored in the system keychain yet.
Open GitHub Desktop once, do a manual push, and after that all future pushes
from the terminal will work silently.

### 10c — Update Notion (plain text summary only — NO HTML)

**1. Update the Today's Briefing page** (page ID: `32d357f8-f580-819d-8ad2-ebf97487d1a1`)
Replace its entire content with:

```
> 🔗 Full interactive briefing → https://eduardocarvalhosousa.github.io/executiveintelligence/

## [Edition label] — [Weekday DD Mon YYYY]

### Top stories
- **Geopolitics**: [2–3 sentence summary of lead story]
- **Markets**: [2–3 sentence summary]
- **Technology**: [2–3 sentence summary]
- **Health**: [2–3 sentence summary]
- **Marketing**: [2–3 sentence summary]
- **CEO Radar**: [2–3 sentence summary]
- **Spirits**: [2–3 sentence summary]

### Newsletters processed
[Number] newsletters: [comma-separated list of source names]
```

**2. Add a new row to the Archive database** (data source ID: `c07276b7-87d0-4311-8285-8f2a6d44168e`)

Properties to set:
- **Title**: `EI Briefing — [Weekday DD Mon YYYY HH:MM AM/PM]`
- **date:Date:start**: `YYYY-MM-DD`
- **date:Date:is_datetime**: `0`
- **Edition**: `AM Full` or `PM Delta`
- **Status**: `Published`
- **Newsletter Count**: integer (number of newsletters processed)
- **Sections Covered**: JSON array, e.g. `["Geopolitics","Markets","Technology","Health","Marketing","CEO Radar","Spirits"]`
- **Top Stories**: 5 bullet points (• Story 1\n• Story 2\n...)
- **Notes**: any errors or observations from the run

Page content: same plain-text summary as Today's Briefing above, plus:
```
Full interactive briefing: https://eduardocarvalhosousa.github.io/executiveintelligence/
```

---

## STEP 11 — QUALITY CHECKS (run before saving)

Before saving the final file, verify:

1. **No broken modals**: Every `onclick="openModal('ID')"` has a matching `'ID':{` in the articles object
2. **No apostrophe bugs**: No `source:'text's` or `title:'text's` patterns — use double quotes when value contains apostrophe
3. **No duplicate IDs**: Each article ID appears exactly once in the articles object
4. **Placeholder check**: No `{{PLACEHOLDER}}` strings remain in the output
5. **Section count**: All 7 sections have content (for AM edition)
6. **KPI count**: Exactly 7 KPI items (for AM edition)
7. **Ticker duplication**: Ticker text is duplicated once with `&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;` separator
8. **Date accuracy**: The date in the masthead, title, and footer matches today's actual date

---

## REFERENCE — SECTION IDs AND NAV STRUCTURE

| Section | Anchor ID | Nav class | Section tag class |
|---------|-----------|-----------|------------------|
| I. Geopolitics | `geo` | `nb` | `st` |
| II. Markets | `mkt` | `nb` | `st` |
| III. Technology | `tech` | `nb` | `st` |
| IV. Health | `hlth` | `nb` | `st` |
| V. Marketing | `mktg` | `nb mk` | `st mk` |
| VI. CEO Radar | `radar` | `nb` | `st` |
| VII. Spirits | `spr` | `nb sp` | `st sp` |

The nav buttons are in this order in the HTML:
```html
<a class="nb active" href="#geo" onclick="setA(this)">🌍 Geopolitics</a>
<a class="nb" href="#mkt" onclick="setA(this)">📊 Markets</a>
<a class="nb" href="#tech" onclick="setA(this)">🤖 Technology</a>
<a class="nb" href="#hlth" onclick="setA(this)">💊 Health &amp; Society</a>
<a class="nb mk" href="#mktg" onclick="setA(this)">📣 Marketing &amp; Digital</a>
<a class="nb" href="#radar" onclick="setA(this)">📡 CEO Radar</a>
<a class="nb sp" href="#spr" onclick="setA(this)">🍷 Spirits &amp; Drinks</a>
```

---

## REFERENCE — CSS VARIABLES

```css
--ink: #0a0a0a        (black text, borders)
--paper: #f5f0e8      (warm cream background)
--accent: #c8382a     (red — alerts, tags, pull quote borders)
--gold: #b8860b       (gold — important/strategic tags)
--mid: #5a5a5a        (medium grey — secondary text)
--rule: #c8b89a       (warm tan — dividers, ni-strip background)
--link: #1a3a6e       (dark navy — read buttons, links)
--spirits: #4a1f6e    (deep purple — spirits section)
--mktg: #0d5c4e       (dark teal — marketing section)
```

---

## REFERENCE — GMAIL LABELS

| Label | Content |
|-------|---------|
| `newsletters` | All newsletters (general) |
| `newsletters/spirits-news` | Spirits & drinks industry newsletters only |

## IMPORTANT: Newsletter Sources Are Not Limited to a Fixed List

**Do not restrict yourself to any specific list of newsletters.**
Process ALL emails found under the `label:newsletters` and
`label:newsletters/spirits-news` labels, regardless of sender.
New newsletters may be added to these labels at any time — include them all.

The list below is for reference only (source badge class mapping).
If you encounter a sender not on this list, process it normally and use
`s-nyt` as the badge class fallback, noting the new source in the run Notes.

Known newsletter senders (for reference — not exhaustive):
- New York Times: `nytdirect@nytimes.com`, `todaysheadlines-noreply@nytimes.com`
- Semafor Flagship: `flagship@semafor.com`
- Semafor Technology: `technology@semafor.com`
- The Daily Upside: `squad@thedailyupside.com`
- ETF Upside: `team@etf.thedailyupside.com`
- The Rundown AI: `news@daily.therundown.ai`
- Quartz Daily Brief: `hi@e.qz.com`
- Quartz Leadership: `leadership@e.qz.com`
- Vox Today Explained: `newsletter@vox.com`
- Snacks/Robinhood: `hello@snacks.robinhood.com`
- Expresso Curto: `expresso@news.impresa.pt`
- Expresso Economia: `expressoeconomia@news.impresa.pt`
- Section AI: `hello@mail.sectionai.com`
- Staying Ahead: `stayingahead@mail.beehiiv.com`
- VinePair: `weeklydrop@vinepair.com`
- VP Pro: `vppro@vinepair.com`
- Just Drinks: `editor@interact.just-drinks.com`
- Wine Business Daily: `DailyNewsLinks@winebusiness.com`
- Global Drinks Intel: `editorial@drinks-intel.com`

---

*End of instructions. Version 1.0 — Eduardo Sousa / Executive Intelligence*
