---
name: create-virtual-influencer
description: "Build a complete, reusable identity kit for a new faceless AI virtual influencer, modeled on a real reference creator, ready for later slideshow/content production. Produces the persona doc, voice pack, world bible, master reference + 5-view character sheet + 8-panel face sheet, hairstyle/earring/makeup look sheets, an outfit-variant library, prop sheets, and a verified-real scene-reference library — all indexed and identity-consistent. Use this skill whenever the user wants to create a new virtual influencer, faceless persona, or AI creator/character from a reference account; 'make a character like @so-and-so,' 'design a new persona for our account,' 'build the identity kit/character bible,' 'create the face sheet and outfits for a virtual influencer,' or spin up a synthetic creator before producing content. This is the CHARACTER-CREATION half; producing the actual slideshows is a separate downstream skill (virtual-influencer-slideshows)."
---

# Create Virtual Influencer

Build a complete, reusable character identity kit for a new faceless AI persona, modeled on a reference creator, ready for later slideshow production. This is a one-time setup per character; producing content decks is a separate step — do not produce slideshows here.

## What you need from the user

- **The reference creator to model** — a TikTok handle or URL — and a one-line concept for the new character (or an instruction to design one).
- **Any existing personas the new character must NOT resemble** (name + folder), so the new one is clearly differentiated on every axis.
- **The base working directory.** Follow the conventions already established there.

If a real reference photo of the intended face is supplied, use it as the identity anchor in step 4; otherwise generate the face from the appearance spec.

## Expertise and tools

Adopt the expertise of a brand strategist, a character/casting designer, and an AI-image art director. Use the **consistent-characters** skill for the image method and the **persona-image-curation** skill for the scene-library method. Tools: an Apify TikTok scraper (to study the reference), an image-generation tool that accepts reference images (for all character imagery), and ImageMagick (for contact sheets).

## Steps, in order

1. **Study the reference.** Scrape the reference creator's profile — bio, signature line, follower and engagement stats, a sample of recent posts — and extract the formula that makes it work: credibility angle, niche promise, content structure, aesthetic. Record it.

2. **Design the persona.** Invent a fictional person differentiated from any named existing persona on every axis: name, handle, display name, age, birthplace, location, education, career history, backstory, why they create, niche + point of view. Give them a LOCKED appearance spec — build, skin, eyes, brows, hair with a default styling that never changes color or length, signature accessories worn in every image, makeup, a recurring prop — and a distinct voice. Write `persona-<slug>.md` with a bio table, backstory, the locked appearance spec, and a voice section.

3. **Write the voice pack** (`<slug>-voice.md`): register in one paragraph; mechanics (capitalization, punctuation, line breaks, emoji whitelist); a vocabulary whitelist; a banned-tells lint that strips AI/formal tells AND any slang or register that belongs to another persona in the project, so the voices never converge; and an exemplar bank of captions and slide lines. Derive it from the real reference corpus, not from memory.

4. **Create the master reference image.** Either generate a full-length, front-view photo on a pure white seamless background from the appearance spec, or, if a real reference photo is supplied, use that as the identity anchor. Generate in 9:16. Save as `<slug>-reference.jpg`.

5. **Build the 5-view character sheet** using the consistent-characters composition method — a five-panel model sheet (extreme close-up, both profiles, full front, full back) carrying the reference identity exactly. Save as `<slug>-character-sheet.jpg`.

6. **Build the 8-panel face sheet** — the definitive identity anchor: four camera angles plus four expressions, identity identical in every panel. Save as `<slug>-face-sheet.jpg`. This is the primary reference attached to every future generation.

7. **Build the look sheets**, each anchored on the face sheet: a hairstyles sheet (base hair in six to eight stylings, the locked hair never changing color or length), an earrings sheet (six to eight options, default first), and a makeup sheet (about five looks including a bare-faced option). Save as `<slug>-hairstyles-sheet.jpg`, `<slug>-earrings-sheet.jpg`, `<slug>-makeup-sheet.jpg`.

8. **Build the outfit-variant kit.** Write an outfit-variants prompt pack (`<slug>-outfit-variants.md`) with a shared scaffold and one block per look, mapped to the scene archetypes the account will need. Generate each look as a text-free full-body reference on white — identity from the face sheet plus the character sheet — and 5-view sheets for the three or four highest-recurrence looks. Save into `outfit-refs/`. Keep a palette consistent with the persona.

9. **Build the prop sheets:** a phone sheet (the character's canonical phone and case: front, back, in-hand) and an everyday-carry flat-lay of their recurring objects. Save into `props/`. Any screen contents must be blank or placeholder.

10. **Write the world bible** (`world-bible.md`): locked canon for every recurring object (devices, bag, drink, jewelry, nails, and the pet if any with exact markings), the drink order, the recurring sets, the location's seasonal calendar, and an empty continuity-ledger table for later posts to fill.

11. **Build the verified scene-reference library** (`pinterest-refs/`). Define the scene archetypes the account's target templates require. Scrape candid-biased queries — first-person phrasing like "…from my desk", "…pov", "shot on iphone", and skin/identity-matched queries wherever hands or feet appear. Triage by dimension forensics: native phone-capture sizes or HEIC = real; generator-typical sizes deleted unseen. Download survivors, then run a full-resolution persona test on every one, in parallel review passes: any visible body part must be plausibly the character's; no second person's items; English on any screen; no strangers' names or faces; location and season plausible. Renumber keepers as `<scene>-NN.jpg` and write `manifest.json` mapping each to its source pin and dimensions.

12. **Write `index.md`** for the character folder and every subfolder, linking the chain up to the project root.

## Done means

The character folder contains a persona doc, voice pack, world bible, reference + character + face + hairstyles + earrings + makeup sheets, an outfit-refs library with priority 5-view sheets, prop sheets, and a verified scene-reference library with a manifest — all indexed, with identity consistent across every sheet, and nothing contradicting the existing personas.

## Hard rules

- Do not produce any slideshows; that is a separate downstream task (see the **virtual-influencer-slideshows** skill).
- Never use stock, AI-generated, editorial, or unverified images in the scene library — only verified-real phone photos.
- Use image generation only for the character's own reference imagery.
- Save every generated image into the character folder immediately after generating it — the generation tool's output directory may be volatile.
- Verify every generated image at full resolution — count two arms, two hands, five fingers per hand, and confirm the signature accessories — and regenerate on any doubt.
- Keep the character's appearance and voice locked and self-consistent across all assets, and clearly differentiated from every existing persona in the project.
