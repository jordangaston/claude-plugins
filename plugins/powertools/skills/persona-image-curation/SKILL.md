---

name: persona-image-curation

description: "Source and curate scene images for a faceless persona account (TikTok slideshows, IG carousels) so every published image reads as a real photo the persona took herself. Covers candid-biased scraping queries, dimension forensics to reject AI/stock images, the persona plausibility test (no stray arms, foreign UIs, or strangers' names), per-deck camera-roll cohesion, targeted PII retouches, and deterministic text-overlay rendering via headless Chrome (TikTok-style caption bubbles without AI image editing). Use this skill whenever the user wants to find, select, vet, or prune background/scene images for a virtual persona or faceless content account — including 'find images for this slideshow,' 'does this image work for our character,' 'these look like stock photos,' 'build a scene library,' 'add text overlays to slides,' or auditing an existing image library for authenticity."

---
# Persona Image Curation

A pipeline for building and maintaining a library of scene images for a faceless persona account. The goal is a single illusion: **every image in a published post looks like the persona took it on her own phone.** One stock photo, AI render, or stray male arm breaks the account.

Images have two distinct uses — hold them to different bars:

1. **Raw slide backgrounds** — published as-is. Must pass every test below.
2. **Generation references** — composition guides for slides where the persona is AI-generated in. Polish is tolerable; the output gets regenerated anyway.

## Step 1: Study the originals before sourcing anything

Before scraping, study the slide images of the successful posts you're modeling (contact-sheet them side by side). Notice what makes them cohere: candid framing, clutter, imperfect angles, and a consistent tone across each deck — because one person really did shoot them all. That's the bar. Editorial polish is a defect here, not a feature.

```bash
magick montage -label '%f' originals/*.jpg -tile 6x -geometry 300x533+4+4 -background gray sheet.jpg
```

## Step 2: Scrape with candid-biased queries

First-person query phrasing surfaces genuine phone photos; aesthetic keywords surface stock. This one change matters more than any filter applied afterward.

| ❌ Aesthetic query (returns stock/AI) | ✅ Candid query (returns real phone photos) |
|---|---|
| "empty modern office floor to ceiling windows" | "office window view from my desk" |
| "corporate conference room glass walls" | "meeting room pov work" |
| "city buildings golden hour aesthetic" | "golden hour city view from my window" |
| "commute aesthetic loafers" | "walking to work pov" |

Patterns that work: "…from my desk", "…pov", "walking home", "staying late at the office", "my [thing]", "shot on iphone". Scrape ~12 results per query; expect to keep a third.

## Step 3: Dimension forensics — reject AI and stock by capture size

Check every candidate's original pixel dimensions before looking at content:

- **PROOF OF REAL** — native phone capture sizes (either orientation): 3024×4032, 4032×3024, 5712×4284, 1170×2532, 1179×2556, 1284×2778, 1290×2796, 1224×1632, 1536×2048, 960×1280 — or a HEIC source file (only real cameras produce HEIC).
- **PROOF OF FAKE** — generator-typical sizes: 1024×1536, 1000×1500, 1023×1537, 941×1672, 832×1248, 1122×1402, 1086×1448, 897×1754, 986×1595, 1080×1080. Delete on sight.
- **AMBIGUOUS** — downscaled sizes (736×…, 900×1200, 675×1200) and 1080×1920 (real story exports AND AI both use it). These require the eye test; when uncertain, delete. False negatives are cheap — false positives kill the account.

## Step 4: The persona test — "could she have taken this photo?"

Run on EVERY image before EVERY use, at full resolution (thumbnails hide failures). Analyze the image and check:

- **Body parts**: any visible hand, arm, leg, or reflection must be plausibly the persona's — right gender, skin tone, nails, jewelry. One male arm at the edge of frame fails the image.
- **Companions**: a second laptop facing the camera, two place settings, or someone else's drink implies a person she's with. Solo POV only, unless the story beat calls for company.
- **Screens and text**: UI language must match the persona's (a Cyrillic Figma fails an Austin marketer). No strangers' names in browser tabs, email headers, or name tags. No brand logos that contradict her canon.
- **Geography and season**: location, architecture, weather, and driving side must be plausible for where she lives or would travel.
- **Story fit**: the objects match the slide's beat (a Gmail inbox on screen strengthens a rejection story; a Photoshop timeline weakens it).

**Minor failures are fixable with targeted retouches** — rotate to upright (`magick -auto-orient`), crop an edge, or AI-edit to blank a screen showing someone's name (the photo stays real; PII gets redacted). Anything needing more than a small retouch gets rejected, not fixed.

## Step 5: Per-deck cohesion — the camera-roll test

Selecting each slide's image individually isn't enough. Lay the deck's images side by side and ask: does this look like ONE person's camera roll from the same stretch of life? Check tone consistency (a moody deck stays moody — one bright slide breaks it), no repeated images across concurrent decks, and a plausible visual timeline for the story being told.

```bash
magick montage -label '%f' deck/0*.jpg -tile 6x -geometry 240x400+3+3 -background gray review.jpg
```

## Step 6: Library discipline

- Name files `<scene-archetype>-NN.<ext>`; keep a `manifest.json` mapping each file to source URL, dimensions, and any retouches applied.
- Record provenance (scrape runs, queries, prune dates) in the library's note so future sessions know what standard the images met.
- When a scene runs thin after pruning, re-scrape with candid queries rather than lowering the bar. An empty scene is better than a stock photo.

## Step 7: Text overlays — render deterministically, never generatively

Never bake slide text with an AI image editor: it typos, drops words, and re-rolls pixels. Render overlays with HTML/CSS screenshotted by headless Chrome — the one CLI path that reproduces the native TikTok look:

- **Per-line hugging caption bubbles**: `display: inline` spans with `background`, `border-radius`, padding, and `box-decoration-break: clone` (ImageMagick and ffmpeg cannot do this).
- **Hook style**: bold white text with layered `text-shadow`.
- **Color emoji** (❌ ✅ 📌 😭) render natively from the system emoji font.

```bash
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new \
  --screenshot=out.png --window-size=1080,1920 --hide-scrollbars file://slide.html
```

Keep all slide copy in one JSON file (text, layout position, style per slide) and a small render script that loops over it — editing copy is then a JSON change plus a two-second re-render, with zero typo risk. Write copy in the persona's documented voice and edit it like prose (omit needless words, concrete numbers, emphatic word last).

**Layout rule**: position each text stack around the image's subject, not over it — if the persona's hand, drink, or laptop is center-frame, move the text to the top or bottom third. Re-check after rendering; a centered stack silently covering the subject defeats the image choice.

## Review workflow

Contact sheets make full-library review cheap: montage a whole scene folder into one labeled grid, judge, delete, re-montage the survivors. Review suspect images individually at full size — the persona test can't be run on thumbnails.

## Quality checklist

Before an image ships in a post:

- [ ] Dimension check: phone-native size or HEIC (or visually certain + ambiguous size)
- [ ] Persona test passed at full resolution (body parts, companions, screens, geography)
- [ ] No strangers' PII anywhere in frame
- [ ] Deck cohesion: montaged next to its neighbors, same camera-roll feel
- [ ] Any retouches recorded in the manifest
