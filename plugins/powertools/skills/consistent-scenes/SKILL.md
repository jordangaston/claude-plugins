---

name: consistent-scenes

description: "Generate the same location across many images from consistent camera angles using the scene-sheet method — a three-step prompt workflow that establishes a scene once, locks its geometry, lighting, and shadows into a five-angle coverage sheet, then stages characters or products inside it without the space, light direction, or shadows drifting. Use this skill whenever the user wants a consistent scene, location, set, or environment across multiple shots — a scene sheet, coverage plate, multi-angle location turnaround, establishing shot plus reverse angles, or matching a background across a sequence. Also trigger on 'my background looks different in every image,' 'same location from another angle,' 'keep the lighting consistent across shots,' 'the shadows don't match,' shot/reverse-shot coverage, or building a reusable set for a story, ad campaign, or product/character composite. Composes with consistent-characters and consistent-products: lock the subject with those, lock the space here, then place the subject in the scene."

---
# Consistent Scenes

A three-step prompt workflow for generating the same location across many images from different camera angles. The core move: establish the scene once, lock its geometry **and its lighting** into a multi-angle coverage sheet, and reference that sheet in every future generation instead of re-describing the place in words (which drifts — and re-lights it every time).

Scenes have one failure mode products and characters don't: **light direction and shadows**. A location shot from a new angle is only believable if the sun (or key light) stays in the same place in the world, so shadows fall the same way and anything you drop into the shot is lit to match. That continuity is the whole job here, so it's called out in every locked block below.

Works with any image model that accepts reference images alongside a text prompt.

## Conventions

- **🔒 marks a locked section.** Copy it verbatim — the exact wording is what keeps results consistent. Unlocked sections are yours to fill in or adapt.
- **Reference images** are attached to the prompt. Refer to them in the prompt text exactly the way your model expects (some models use tags like `@img1`, others accept plain phrases like "the first attached image"). The templates below use plain phrases — swap in your model's syntax if it has one.
- Generate the scene in **16:9 landscape** (or 3:2) so the environment and its depth read clearly. Use 9:16 only if the scene is specifically for vertical/mobile delivery — and keep it consistent across the whole sheet.
- **Fix the light once, in Step 1, and never restate it differently.** Name the key-light source, its compass direction and height, the time of day, and the colour temperature. Every later prompt refers back to *that* light — it never re-invents it.

## Step 1: Establish the scene (pure text)

Generate the master establishing shot from a text description alone. Shoot it **empty** (no hero subject) unless the subject is part of the architecture — an empty plate is easier to stage into later.

```
🔒 [IMAGE TYPE: Wide establishing shot, the full location and its depth clearly visible in frame, empty of any hero subject.]

[SCENE: enter your location details here — place, architecture/geography, key landmarks and foreground/midground/background elements, surface materials, set dressing, era, and overall scale]

🔒 [CAMERA POSITION: Neutral eye-level master angle, camera square to the space, lens taking in the whole environment. This is the anchor angle every other view is measured against.]

🔒 [KEY LIGHT & SHADOW: define a single dominant light source — its compass direction, height in the sky, and colour temperature — and describe the length and direction of the shadows it casts. This is the scene's light contract; every later shot obeys it.]

[TIME & WEATHER: enter time of day, weather, sky condition, and any practical/ambient light sources here]

[COLOR GRADE & MOOD: overall colour treatment and atmosphere]

🔒 [CAMERA & FILM STOCK: shot on Hasselblad H6D, 35mm lens, f/8, deep depth of field, sharp focus, Kodak Portra 400 film stock, fine grain, accurate colour, cinematic location photography style]
```

### Step 1 (alt): Establish the scene from an existing photo or plate

If you already have the location — a photo, a still, a plate, or a partial shot — attach it as the reference image and let it carry the environment:

```
🔒 [IMAGE TYPE: Wide establishing shot, the full location and its depth clearly visible in frame, empty of any hero subject.]

[SCENE: the attached reference image]

🔒 [CAMERA POSITION: Neutral eye-level master angle, camera square to the space, lens taking in the whole environment. This is the anchor angle every other view is measured against.]

🔒 [KEY LIGHT & SHADOW: preserve the light source, its direction and height, the colour temperature, and the shadow direction exactly as they appear in the attached image — do not relight the scene.]

🔒 [CAMERA & FILM STOCK: shot on Hasselblad H6D, 35mm lens, f/8, deep depth of field, sharp focus, Kodak Portra 400 film stock, fine grain, accurate colour, cinematic location photography style]
```

Either way, the output is a single clean establishing shot of the empty location with its lighting defined. This is your **scene plate**.

## Step 2: Build the scene sheet (coverage prompt)

Attach **two** reference images:

1. **The composition template** — a five-panel coverage layout. Use the bundled one at [`assets/scene-sheet-template.png`](assets/scene-sheet-template.png): establishing wide (master), left 3/4 angle, right 3/4 angle, reverse angle (180°), high angle (overhead). It controls *layout only*.
2. **Your scene plate from Step 1.** It controls *the location's identity* — geometry, architecture, set dressing, materials, **and its established key light, shadow direction, and colour temperature.**

```
🔒 [IMAGE TYPE: Location coverage sheet collage in **exactly** the same 5-panel layout and composition as the attached template image.]

🔒 [SUBJECT: Use the attached scene plate as the ONLY reference for the location's exact geometry, architecture, landmarks, set dressing, and materials — reproduce the same physical space identically across all five camera angles, as if a single crew shot coverage of one real location without moving anything.]

🔒 [KEY LIGHT & SHADOW CONTINUITY: The key light stays in the SAME fixed world position across every panel. When the camera turns — including the 180° reverse — the light comes from a different side of the *frame* but the SAME direction in the *world*; shadows keep the same real-world direction and length and are never mirrored. Colour temperature and contrast are identical in every panel.]

🔒 [ENVIRONMENT: consistent time of day, weather, sky, and ambient light across all panels — one continuous moment captured from five cameras.]

🔒 [CAMERA & FILM STOCK: shot on Hasselblad H6D, 35mm lens, f/8, deep depth of field, sharp focus, Kodak Portra 400 film stock, fine grain, accurate colour, cinematic location photography style]

🔒 [DETAILS: Perfect spatial, architectural, and lighting consistency across every angle — same space, same light, same hour. High-end cinematic look, no text, no callout labels, no graphics, no people unless part of the fixed set.]
```

The output is your **scene sheet**: one image showing the location from five matched angles under one consistent light.

## Step 3: Place subjects in the scene (staging prompt)

Attach your **scene plate** from Step 1 as the environment reference and describe the subject and action. When you need an angle beyond the master (reverse, profile, overhead), attach the Step 2 **scene sheet** instead — it gives the model that exact angle to match. To stage a locked character or product, also attach its reference/sheet from `consistent-characters` or `consistent-products`.

```
[IMAGE TYPE: e.g., cinematic film still, editorial photograph, lifestyle shot, etc.]

🔒 [SCENE REFERENCE: the attached scene plate — reproduce this exact location, camera angle, and its established key light, shadow direction, and colour temperature.]

[SUBJECT REFERENCE: optional — the attached character/product image; place it into the scene without re-describing its appearance]

[SUBJECT ACTION & PLACEMENT: e.g., standing at the railing looking out, walking through the doorway toward camera, seated at the near table — state where in the space they are and how far from camera]

🔒 [LIGHTING MATCH: light the subject with the scene's established key light — same direction, height, and colour temperature — and cast the subject's shadow in the same direction and length as the shadows already in the scene.]

[SHOT TYPE: e.g., wide establishing, medium two-shot, close-up, over-the-shoulder, etc.]

[CAMERA ANGLE: match the master, or name the coverage angle from the scene sheet]

[LENS: e.g., 35mm f/4 for context, 85mm f/2 for a compressed close-up]

[COLOR GRADE: match the scene plate's grade]

[MOOD & ATMOSPHERE: emotional feeling]

[TECHNICAL SPECS: camera, film emulation & effects]
```

## Why this works

Text descriptions of a place drift, and they re-light it every time: "a rooftop bar at sunset" lands the sun somewhere new in every generation, so shadows swing around and nothing cuts together. A reference image holds the geometry *and* freezes the light. The bracket structure separates concerns — layout, location identity, light, camera — so the model doesn't blend them, and the locked light-and-shadow blocks keep the one thing scenes get wrong identical across every angle. Lock the space here the same way you lock a face in `consistent-characters` or a product in `consistent-products`, then compose them: your locked subject, standing in your locked scene, lit by one consistent sun.

## Pitfalls

- **Fix the light before you shoot coverage.** If Step 1 leaves the key light vague, every panel in Step 2 invents its own sun and the sheet is useless. Name direction, height, and colour temperature up front.
- **The 180° reverse is where shadows break.** Models love to mirror the lighting when the camera flips. It's wrong: the sun doesn't move when the camera does. Verify the reverse-angle panel keeps shadows pointing the same real-world way before trusting the sheet.
- **Don't re-describe the location in staging prompts.** The moment you add "a rooftop bar at sunset," you compete with the scene plate and reintroduce drift. Let the reference carry the place.
- **Match the subject's shadow to the scene's.** A perfectly lit character with a shadow falling the wrong way reads as a fake composite instantly. The shadow direction is the tell — check it every time.
- **One location per sheet.** Multiple places in the plate confuse the spatial binding — shoot separate locations as separate sheets.
- **If an angle drifts** (usually the reverse or the overhead), regenerate rather than accepting it — every future image staged from that angle inherits the error.
- **Empty plate first.** Lock the space and its light unpopulated; add characters and props in Step 3 so you can restage the same set many times.
