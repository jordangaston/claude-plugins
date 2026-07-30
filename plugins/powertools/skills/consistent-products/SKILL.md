---

name: consistent-products

description: "Generate consistent AI product shots across images using the product-sheet method — a three-step prompt workflow that creates a product hero shot, locks its form, materials, finish, color, and branding into a five-view product sheet, then places it in new scenes without drift. Use this skill whenever the user wants consistent product photography, a product sheet, product turnaround, multi-angle collage, packshots, catalog imagery, or to keep the same product identical across many generated images. Also trigger on reference-image prompting for products, 'my product looks different in every image,' 'same product across shots,' generating lifestyle/hero/ecommerce imagery, or building a reusable product for a brand or ad campaign."

---
# Consistent Products

A three-step prompt workflow for generating the same product across many images. The core move: create the product hero shot once, lock its identity into a multi-view product sheet, and reference that sheet in every future generation instead of re-describing the product in words (which drifts).

Works with any image model that accepts reference images alongside a text prompt.

## Conventions

- **🔒 marks a locked section.** Copy it verbatim — the exact wording is what keeps results consistent. Unlocked sections are yours to fill in or adapt.
- **Reference images** are attached to the prompt. Refer to them in the prompt text exactly the way your model expects (some models use tags like `@img1`, others accept plain phrases like "the first attached image"). The templates below use plain phrases — swap in your model's syntax if it has one.
- Generate the product image in **1:1 square** (or 4:5) so the whole product fits the frame cleanly.

## Step 1: Create the product (pure text)

Generate the master product image from a text description alone.

```
🔒 [IMAGE TYPE: Full product hero shot, entire product centered and fully visible in frame]

[SUBJECT: enter your product details here — name, category, form factor, exact colorway, materials/finish (matte, gloss, brushed metal, textured), and distinguishing features]

🔒 [ORIENTATION: Neutral three-quarter front angle, product upright and centered, no tilt. Branding/label facing the camera.]

[BRANDING: enter logo, label, and packaging details here]

🔒 [ENVIRONMENT & LIGHTING: pure white seamless background. Soft, even high-key studio lighting, minimal cast shadow, subtle contact shadow directly beneath the product only.]

🔒 [CAMERA & FILM STOCK: shot on Hasselblad H6D, 100mm macro lens, f/11, sharp focus edge-to-edge, Kodak Portra 160 film stock, fine grain, accurate color reproduction, commercial product photography style]
```

### Step 1 (alt): Create the product from an existing photo or clipped shot

If you already have the product — a packshot, a partial photo, or a crop — attach it as the reference image and let it carry the subject:

```
🔒 [IMAGE TYPE: Full product hero shot, entire product centered and fully visible in frame]

[SUBJECT: the attached reference image]

🔒 [ORIENTATION: Neutral three-quarter front angle, product upright and centered, no tilt. Branding/label facing the camera.]

🔒 [ENVIRONMENT & LIGHTING: pure white seamless background. Soft, even high-key studio lighting, minimal cast shadow, subtle contact shadow directly beneath the product only.]

🔒 [CAMERA & FILM STOCK: shot on Hasselblad H6D, 100mm macro lens, f/11, sharp focus edge-to-edge, Kodak Portra 160 film stock, fine grain, accurate color reproduction, commercial product photography style]
```

Either way, the output is a single clean, front-facing product image on white. This is your **product image**.

## Step 2: Build the product sheet (composition prompt)

Attach **two** reference images:

1. **The composition template** — a five-panel product-sheet layout. Use the bundled one at [`assets/product-sheet-template.png`](assets/product-sheet-template.png): macro detail (signature feature), right side profile, left side profile, full shot (front), full shot (back). It controls *layout only*.
2. **Your product image from Step 1.** It controls *identity only* — form factor, proportions, color, materials, finish, branding.

```
🔒 [IMAGE TYPE: Product photo model sheet collage in **exactly** the same 5-shot layout and composition as the attached template image.]

🔒 [SUBJECT: Use the attached product photo as the ONLY reference for the product's exact form factor, proportions, colorway, materials, finish/texture, and branding/logo placement — reproduce them identically and with perfect consistency across all five views.]

🔒 [ENVIRONMENT & LIGHTING: pure white seamless background. Soft, even high-key studio lighting, minimal cast shadow, subtle contact shadow beneath each view only, consistent lighting direction and color temperature across all panels.]

🔒 [CAMERA & FILM STOCK: shot on Hasselblad H6D, 100mm macro lens, f/11, sharp focus, Kodak Portra 160 film stock, fine grain, accurate color reproduction, commercial product photography style]

🔒 [DETAILS: Perfect geometric, material, and branding consistency across every angle, identical scale and framing per panel, high-end catalog look, no text, no callout labels, no graphics, no logos other than the product's own.]
```

The output is your **product sheet**: one image showing the product from five angles.

## Step 3: Place the product in scenes (scene prompt)

Attach your product image from Step 1 as the reference and describe the scene. When the scene needs an angle beyond front view (back shots, profiles, top-down), attach the Step 2 product sheet instead — it gives the model every angle to draw from.

```
[IMAGE TYPE: e.g., lifestyle photograph, dramatic hero shot, flat-lay, in-context editorial, etc.]

🔒 [PRODUCT REFERENCE: the attached product image]

[SCENE / CONTEXT: e.g., resting on a marble kitchen counter, held in a hand, arranged in a flat-lay with props, on a pedestal in a studio set, etc.]

[SHOT TYPE: e.g., hero shot, close-up detail, wide establishing shot, three-quarter packshot, flat-lay top-down, etc.]

[CAMERA ANGLE: e.g., eye-level three-quarter front view]

[LENS: e.g., 100mm macro f/8, or 35mm wide-angle f/4 for environmental context]

[LIGHTING: describe direction, quality & mood]

[ENVIRONMENT: full background and surface description]

[COLOR GRADE: overall color treatment]

[MOOD & ATMOSPHERE: emotional feeling]

[TECHNICAL SPECS: camera, film emulation & effects]
```

## Why this works

Text descriptions of a product drift: every generation reinterprets "matte black bottle with a gold cap." Reference images don't. The bracket structure separates concerns — layout, identity, environment, camera — so the model doesn't blend them, and the locked sections keep the parts that anchor consistency identical across every generation.

## Pitfalls

- **Don't re-describe the product in scene prompts.** The moment you add "a matte black bottle with a gold cap," you compete with the reference image and reintroduce drift. Let the reference carry identity.
- **One product per sheet.** Multiple products in the product image confuse the identity binding — shoot variants and bundles as separate follow-ups.
- **If a view drifts** (usually the back or a fine detail), regenerate rather than accepting it — every future image inherits the sheet's errors.
- **Watch the branding.** Logos and label text are where models drift most; verify they read correctly on every panel before reusing the sheet.
- **Colorways and packaging come later.** Lock the base product first; generate color/variant/packaging shots in follow-up prompts using the sheet as reference.
