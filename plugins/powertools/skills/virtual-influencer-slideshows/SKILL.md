---
name: virtual-influencer-slideshows
description: "Produce a full batch of post-ready TikTok slideshow decks for an EXISTING faceless AI virtual influencer, end to end: format/topic planning, scripts in the persona's voice, exclusive per-deck verified backgrounds, AI-generated hero (hook/payoff) slides, deterministic HTML/CSS text rendering, red-team QA, and per-deck documentation with continuity-ledger updates. Use this skill whenever the user wants to generate, batch, or mass-produce slideshows/carousels for a virtual persona that already has an identity kit — 'make 30 slideshows for Dani,' 'produce the next content batch for our persona,' 'generate decks for the account,' or scaling a faceless account's posting calendar. Requires the character to already exist (persona doc, voice pack, world bible, face/outfit/prop sheets, scene library); if it does not, run the create-virtual-influencer skill first. This is the CONTENT-PRODUCTION half."
---

# Virtual Influencer Slideshows

Produce post-ready TikTok slideshow decks for an existing virtual persona, end to end. The character's identity kit must already exist (built by the **create-virtual-influencer** skill).

## What you need from the user

- **Which character to produce for** — the folder name — and **how many decks** to produce.
- **The product/app to promote and its EXACT positioning** — what it does, what it must NEVER be described as, and whether it is paid, free, or platform-limited — or "none" for no product placement.
- **The base working directory.** Follow the conventions established there.

First read the character's persona doc, voice pack (with its banned-tells lint), and world bible; do not work from memory.

## Expertise and tools

Adopt the expertise of a short-form content strategist and an AI-image art director. Use the **tiktok-slideshows** and **persona-image-curation** skills. Tools: an Apify Pinterest scraper (to extend the scene library), an image-generation tool that accepts reference images (for character slides only), a deterministic HTML/CSS-to-image text renderer run through headless Chrome (for all slide text), and ImageMagick.

## Steps, in order

1. **Set up the render pipeline** in the character's `slideshows/` folder: copy the deterministic text renderer, its fonts, vendor libraries, and logo chips; create a `fragments/` folder; confirm the renderer auto-merges per-deck fragment files; render one throwaway test slide to prove the pipeline works before producing anything.

2. **Plan formats and topics.** Read the format-interaction research and choose a mix leaning on the highest-interaction formats (product roundup, tutorial, listicle), reserving story/POV for relatability. Define the requested number of topics in THIS character's lane, each distinct and none overlapping the topics of any other persona in the project. Assign each a format, and mark the small subset that will carry a product mention.

3. **Extend the scene library if needed** for archetypes or depth the pool lacks: scrape candid-biased first-person queries, triage by dimension forensics, download, run parallel full-resolution persona-test reviews, and merge keepers into the pool with manifest updates. Use only verified-real phone photos.

4. **Partition the pool** into an exclusive background allocation per deck — no background is ever reused across decks. Record the allocation to a file.

5. **Produce each deck** (you may fan out a team of subagents, each owning a few decks and modeling one finished reference deck, and each banking every deck to disk before starting the next). Per deck:
   - **(a) Script** in the character's voice — payoff slide first, then two alternate hooks, one idea per slide, strongest point on slide two, a save CTA. Every tip must end in an exact script or a right-versus-wrong contrast. Then lint every line against the voice pack.
   - **(b) Backgrounds:** copy the assigned backgrounds into the deck folder in slide order and re-run the full-resolution persona test on each; drop and note any that fail rather than substituting from outside the allocation.
   - **(c) Character slides:** generate only the slides the character appears in (usually the hook and the payoff/intro), text-free, attaching the face sheet as the identity anchor plus the chosen outfit reference and any prop sheet whose object appears. Describe only scene, pose, camera, and which outfit/hair/earring/makeup option — never re-describe the character's identity. Copy each generated image into the deck folder immediately after generating it. Verify at full resolution: two arms, two hands, five fingers each, signature accessories present, identity and canon props correct; regenerate on any doubt. Rotate the outfit/look across decks.
   - **(d) Text:** write the deck's copy into `fragments/<slug>.json` and render it deterministically — never bake slide text with the image model.
   - **(e) Review:** montage the rendered slides and inspect at full size; fix wraps, subject collisions, contrast; re-render.
   - **(f) Red-team** every slide as a hostile commenter hunting authenticity tells: hands, in-scene text, prop continuity against the world bible and every other deck, shadow physics, calendar truth for the posting date.
   - **(g) Document:** write the deck's `index.md` with both hooks, slide-by-slide copy, design notes, an assets list giving each image's source and persona-test verdict, a caption with hashtags, audio direction, and one continuity-ledger row.

6. **Final QA across all decks:** montage a full grid and inspect identity consistency; check cross-deck continuity of outfits, props, and the pet; merge every deck's ledger row into the world bible; write the slideshows index; update the project index chain; and send a completion notification.

## Done means

The requested number of decks each exist as numbered `<NN>-<slug>-final.jpg` files, each with a fragment and a documented index; every image passed the persona test and red-team pass; every line passed the voice lint; any product mention is accurate, singular per deck, and capped with one true limitation; no background is reused; and nothing contradicts the world bible or any previously produced deck.

## Hard rules

- Generate scene images only for slides the character appears in; every other slide is a verified-real pool background used as-is.
- Render all slide text deterministically through the HTML/CSS renderer, never through the image model, and never use the renderer's vignette.
- Keep the character's phone, jewelry, nails, hair, pet, and other canon objects exactly as the world bible specifies; carry identity from the reference sheets, never from prompt text.
- Write only in this character's voice; never borrow a register the voice pack marks as belonging to another persona.
- If a product is placed: describe it only by its true positioning, never by what it is not, never call it free unless it is, and never give it a flawless review — cap it with one honest limitation (at most 8/10).
- Plan for two operational hazards: the image-generation service can exhaust its credits mid-run — bank each completed deck to disk before starting the next, and fall back to a text-forward hook over a real background when a character slide cannot be generated; and the image tool's output directory may be volatile — copy every generation into the deck folder immediately.
- If a step fails twice, note it in the deck index and move on rather than stalling.
