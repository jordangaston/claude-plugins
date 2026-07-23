---

name: consistent-characters

description: "Generate consistent AI characters across images using the character-sheet method — a three-step prompt workflow that creates a character, locks their face, body, hair, and outfit into a five-view character sheet, then places them in new scenes without drift. Use this skill whenever the user wants to create a consistent character, character sheet, model sheet, character turnaround, 360-degree view, or keep the same person/character identical across multiple generated images. Also trigger on reference-image prompting for characters, 'my character looks different in every image,' 'same face across images,' or building a reusable character for a brand, story, or ad campaign."

---
# Consistent Characters

A three-step prompt workflow for generating the same character across many images. The core move: create the character once, lock their identity into a multi-view character sheet, and reference that sheet in every future generation instead of re-describing the character in words (which drifts).

Works with any image model that accepts reference images alongside a text prompt.

## Conventions

- **🔒 marks a locked section.** Copy it verbatim — the exact wording is what keeps results consistent. Unlocked sections are yours to fill in or adapt.
- **Reference images** are attached to the prompt. Refer to them in the prompt text exactly the way your model expects (some models use tags like `@img1`, others accept plain phrases like "the first attached image"). The templates below use plain phrases — swap in your model's syntax if it has one.
- Generate the character image in **9:16 portrait** so the full body fits the frame.

## Step 1: Create the character (pure text)

Generate the master character image from a text description alone.

```
🔒 [IMAGE TYPE: Full-length fashion photo]

[SUBJECT: enter your subject details here]

🔒 [POSE: Neutral standing pose, front view. Direct gaze at camera — expression neutral, composed, slightly guarded.]

[OUTFIT: enter your outfit details here]

🔒 [ENVIRONMENT & LIGHTING: pure white seamless background. High-key lighting, minimal cast shadow on the floor.]

🔒 [CAMERA & FILM STOCK: shot on Hasselblad H6D, 85mm lens, f/8, sharp focus, Kodak Portra 160 film stock, fine grain, accurate skin tones, commercial fashion photography style]
```

### Step 1 (alt): Create the character from a headshot or clipped shot

If you already have a face — a headshot, a partial photo, or a crop — attach it as the reference image and let it carry the subject:

```
🔒 [IMAGE TYPE: Full-length fashion photo]

[SUBJECT: the attached reference image]

🔒 [POSE: Neutral standing pose, front view.]

[OUTFIT: add your outfit description here]

🔒 [ENVIRONMENT & LIGHTING: pure white seamless background. High-key lighting, minimal cast shadow on the floor.]

🔒 [CAMERA & FILM STOCK: shot on Hasselblad H6D, 85mm lens, f/8, sharp focus, Kodak Portra 160 film stock, fine grain, accurate skin tones, commercial fashion photography style]
```

Either way, the output is a single full-length, front-view character image on white. This is your **character image**.

## Step 2: Build the character sheet (composition prompt)

Attach **two** reference images:

1. **The composition template** — a five-panel model-sheet layout. Use the bundled one at [`assets/character-sheet-template.png`](assets/character-sheet-template.png): ECU (head & shoulders), right side profile (upper body), left side profile (upper body), full shot (front), full shot (back). It controls *layout only*.
2. **Your character image from Step 1.** It controls *identity only* — face, skin, body, hair, makeup, expression, outfit.

```
🔒 [IMAGE TYPE: Fashion photo model sheet collage in **exactly** the same 5-shot layout and composition as the attached template image.]

🔒 [SUBJECT: Use the attached character photo as the ONLY reference for the character's exact face, skin details, body type, hair, makeup, expression, and full outfit/accessories — apply them identically and with perfect consistency across all five views.]

🔒 [ENVIRONMENT & LIGHTING: pure white seamless background. High-key lighting, minimal cast shadow on the floor.]

🔒 [CAMERA & FILM STOCK: shot on Hasselblad H6D, 85mm lens, f/8, sharp focus, Kodak Portra 160 film stock, fine grain, accurate skin tones, commercial fashion photography style]

🔒 [DETAILS: Perfect anatomical and clothing consistency across every angle, high-end editorial look, no text, no logos, no graphics.]
```

The output is your **character sheet**: one image showing the character from five angles.

## Step 3: Place the character in scenes (scene prompt)

Attach your character image from Step 1 as the reference and describe the scene. When the scene needs an angle beyond front view (back shots, profiles), attach the Step 2 character sheet instead — it gives the model every angle to draw from.

```
[IMAGE TYPE: e.g., cinematic film still, dramatic photograph, moody portrait, etc.]

🔒 [CHARACTER REFERENCE: the attached character image]

[SUBJECT ACTION: e.g., standing still with hand on hip, walking slowly through grass, turning to look over the shoulder, etc.]

[SHOT TYPE: e.g., full-length, medium shot, wide establishing shot, close-up portrait, three-quarter length, etc.]

[CAMERA ANGLE: e.g., eye-level front view]

[LENS: e.g., 35mm wide-angle f/4 deep depth of field]

[LIGHTING: describe direction, quality & mood]

[ENVIRONMENT: full background description]

[COLOR GRADE: overall color treatment]

[MOOD & ATMOSPHERE: emotional feeling]

[TECHNICAL SPECS: camera, film emulation & effects]
```

## Why this works

Text descriptions of a character drift: every generation reinterprets "red-haired woman in a cream dress." Reference images don't. The bracket structure separates concerns — layout, identity, environment, camera — so the model doesn't blend them, and the locked sections keep the parts that anchor consistency identical across every generation.

## Pitfalls

- **Don't re-describe the character in scene prompts.** The moment you add "a woman with auburn hair," you compete with the reference image and reintroduce drift. Let the reference carry identity.
- **One character per sheet.** Multiple people in the character image confuses the identity binding.
- **If a view drifts** (usually the back view), regenerate rather than accepting it — every future image inherits the sheet's errors.
- **Outfit changes come later.** Lock the base character first; generate outfit variants in follow-up prompts using the sheet as reference.
