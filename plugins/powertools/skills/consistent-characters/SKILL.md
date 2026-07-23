---

name: consistent-characters

description: "Generate consistent AI characters across images using the character-sheet method — a structured prompt that locks a character's face, body, hair, and outfit across multiple views by combining a composition-template reference with a character reference. Use this skill whenever the user wants to create a consistent character, character sheet, model sheet, character turnaround, 360-degree view, or keep the same person/character identical across multiple generated images. Also trigger on mentions of Nano Banana, Freepik AI Suite character workflows, reference-image prompting for characters, 'my character looks different in every image,' 'same face across images,' or building a reusable character for a brand, story, or ad campaign."

---
# Consistent Characters

A prompt method for generating the same character across many images, from GenHQ's character-sheet workflow. The core move: instead of describing the character in words (which drifts), you pin the character to **two reference images** and let a structured prompt bind them together.

Built for **Google Nano Banana 2 in the Freepik AI Suite**, but the method works with any image model that accepts multiple reference images (`@img1`, `@img2`, ...).

## Why this works

Text descriptions of a character drift: every generation reinterprets "red-haired woman in a cream dress." Reference images don't. This method splits the job:

- **`@img1` — the composition template.** A model-sheet layout (e.g., a 5-shot collage showing front, back, side, and three-quarter views). It controls *layout only* — where each view sits and how the collage is framed.
- **`@img2` — the character reference.** A single photo of the character. It controls *identity only* — face, skin, body, hair, makeup, expression, outfit, accessories.

The prompt tells the model to copy the layout from one and the identity from the other. The output is a **character sheet**: one image showing the character from five angles, which then becomes your master reference for every future generation.

## The prompt template

Fill the brackets and attach both references:

```
[IMAGE TYPE: Fashion photo model sheet collage in **exactly** the same 5-shot layout and composition as @img1.]

[SUBJECT: Use the uploaded input photo @img2 as the ONLY reference for the character's exact face, skin details, body type, hair, makeup, expression, and full outfit/accessories — apply them identically and with perfect consistency across all five views.]

[ENVIRONMENT & LIGHTING: pure white seamless background. High-key lighting, minimal cast shadow on the floor.]

[CAMERA & FILM STOCK: shot on Hasselblad H6D, 85mm lens, f/8, sharp focus, Kodak Portra 160 film stock, fine grain, accurate skin tones, commercial fashion photography style]

[DETAILS: Perfect anatomical and clothing consistency across every angle, high-end editorial look, no text, no logos, no graphics.]
```

## The workflow

1. **Get a character reference (`@img2`).** One clear, well-lit photo of the character — generated or real. Full outfit visible if you want the outfit locked too.
2. **Get a composition template (`@img1`).** Any model-sheet collage with the layout you want. You only need its *composition*, so a rough example is fine.
3. **Run the template prompt** with both references attached. This produces the character sheet.
4. **Use the character sheet as the reference for all future images.** Because it shows the character from every angle, the model can now place them in new scenes, poses, and outfits without drifting.

## Adapting each section

Keep the bracket structure — it separates concerns so the model doesn't blend them.

| Section | What it controls | How to adapt |
|---|---|---|
| IMAGE TYPE | Output format and layout | Swap "fashion photo model sheet" for your genre; keep "**exactly** the same layout and composition as @img1" verbatim — the emphasis matters. |
| SUBJECT | Character identity | Keep "as the ONLY reference" and the explicit trait list (face, skin, body type, hair, makeup, expression, outfit/accessories). Listing traits explicitly is what prevents partial drift. |
| ENVIRONMENT & LIGHTING | Background and light | White seamless is best for a master sheet — it isolates the character. Change only for stylized sheets. |
| CAMERA & FILM STOCK | Photographic realism | Swap camera, lens, and film stock to match your target look (or replace with an illustration style for non-photo characters). |
| DETAILS | Quality guardrails | Keep "perfect anatomical and clothing consistency across every angle" and "no text, no logos, no graphics" — collage layouts invite unwanted labels. |

## Pitfalls

- **Don't describe the character in text.** The moment you add "a woman with auburn hair," you compete with `@img2` and reintroduce drift. Let the reference carry identity.
- **One character per sheet.** Multiple people in `@img2` confuses the identity binding.
- **If a view drifts** (usually the back view), regenerate rather than accepting it — every future image inherits the sheet's errors.
- **Outfit changes come later.** Lock the base character first; generate outfit variants in follow-up prompts using the sheet as reference.
