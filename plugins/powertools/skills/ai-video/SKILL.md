---
name: ai-video
description: "Turn a seed idea into a polished AI video-generation prompt. Picks the right mode — T2V (text-to-video), I2V (image-to-video), or V2V (video-to-video) — then builds the prompt: for T2V, an 8-part structure [medium] + [shot] + [angle] + [movement] + [focus] + [subject] + [lighting] + [color]; for I2V, a shorter motion-first structure. Use whenever the user wants a prompt for generating video with any model — Sora, Veo, Runway, Kling, Pika, Luma/Dream Machine, Hailuo/MiniMax, Wan, Seedance, or unnamed — or asks to 'write a video prompt,' 'make a prompt for this clip,' 'animate this image,' 'improve my video prompt,' or gives a rough motion idea ('a samurai on a neon rooftop,' 'my logo forming from smoke') and wants it video-ready. Also trigger when the user asks why their generated video looks static, frozen, or like a moving JPEG, or how to describe camera moves."
---
# AI Video Prompts

A method for expanding a seed idea into one high-quality video-generation prompt, adapted from GenHQ's video prompting structure. It works for any model (Sora, Veo, Runway, Kling, Pika, Luma, Hailuo, Wan, Seedance) and any look — cinematic live-action, animated 3D, anime, VHS footage.

## Think like a director, not a photographer

A still-image prompt describes a frozen moment. A video prompt must describe **two layers over time**:

- **The World** — the subject and environment, and above all the **action**: what moves inside the frame (a character smiles, wind blows the trees, a car explodes). If you never describe motion, the model returns a near-frozen shot that looks like a moving JPEG.
- **The Lens** — the camera as an observer: is it locked off and watching, creeping in, flying over, orbiting?

The prompt comes alive when you combine them **intentionally**. Two quick rules keep every clip from going dead:

- **If the subject is still, move the camera** (to keep it interesting).
- **If the camera is still, move the subject** (to keep it alive).

## First, pick the mode

| Mode | Meaning | Use when |
|------|---------|----------|
| **T2V** | Text-to-Video — start from nothing | The user has only an idea, no image |
| **I2V** | Image-to-Video — lock in an exact look, then animate it | The user has (or will make) a starting frame |
| **V2V** | Video-to-Video — transform an existing clip | The user has footage to restyle or alter |

If the user supplies or references an image, default to **I2V**. Otherwise use **T2V**. Ask only if it's genuinely ambiguous.

---

## T2V structure — the "burger" formula

Build the prompt in layers. Output **one** prompt in this order:

```
[medium] + [shot] + [angle] + [movement] + [focus] + [subject] + [lighting] + [color]
```

Write it as flowing cinematic description (not literal bracket labels), ideally **60–140 words**. Not every field needs a keyword every time, but **[movement]** and **[subject]** action are mandatory — they are what make it a video.

### [medium] — type and style of the video

The format and texture. Cinematic live-action, animated 3D render, 2D anime, or an analog film stock for organic grain and history:

| Stock | Look | Best for |
|-------|------|----------|
| 8mm / Super 8 | Heavy grain, soft focus, flicker, warm nostalgic color, jittery edges | Memories, home-movie, indie music videos |
| 16mm | Notable grain, raw gritty texture, high contrast, doc-style color | Indie drama, 70s crime thriller, raw fashion |
| 35mm | Fine grain, rich dynamic range, creamy skin tones, classic depth | Standard Hollywood drama, prestige TV |
| 70mm / IMAX | Crystal clear, immense detail, sweeping scale, ultra-sharp | Epic landscapes, space, blockbusters |
| Polaroid / Instant | Blown highlights, crushed blacks, 1:1 ratio, chemical color shifts | Retro fashion, dream sequences, "lost" evidence |

### [shot] — framing distance (how close to the subject)

| Code | Shot | Frames |
|------|------|--------|
| ECU | Extreme Close-Up | Tiny detail / macro |
| CU | Close-Up | Face / emotion |
| MCU | Medium Close-Up | Chest up / dialogue |
| MS | Medium Shot | Waist up / interaction |
| MFS | Medium Full Shot | Thigh up / the "cowboy" |
| FS/LS | Full / Long Shot | Entire body / movement |
| WS | Wide Shot | Character + environment |
| EWS/ELS | Extreme Wide / Long | Landscape / scale |

### [angle] — camera position relative to the subject

Low angle (subject looms powerful), high angle (subject diminished), eye level, over-the-shoulder, overhead / top-down, Dutch tilt.

### [movement] — the language of the lens

The energy and flow. Core moves:

| Move | What it does |
|------|--------------|
| Static / locked-off | Camera doesn't move. Great for subtle motion (rain, wind, a blink) |
| Pan (L/R) | Swivels like turning your head — follow action, reveal a landscape |
| Tilt (up/down) | Angles like nodding — look up a skyscraper, down at feet |
| Jib / crane (up/down) | Physically changes height through the air (unlike a tilt, which only changes angle) |
| Push-in (dolly in) | Physically moves forward — builds intensity or focus |
| Pull-out (dolly out) | Physically moves backward — reveals, or ends a scene |
| Truck (L/R) | Slides sideways — travel beside a walking character |
| Orbit / arc | Circles the subject — makes them epic, heroic, isolated |
| Zoom | Lens magnifies, camera stays put (flatter and faster than a push-in; name it explicitly so the model doesn't confuse the two) |
| Handheld | Raw and chaotic — documentaries, high-stress scenes |

Advanced moves for specific emotions:

| Move | Effect / vibe |
|------|---------------|
| FPV drone | Flies fast and aggressive like a bird or jet — adrenaline, chasing, diving |
| Barrel roll ("vortex") | Rotates 360° on its axis, horizon spins — disorienting, dream-like, sci-fi |
| Dolly zoom ("Vertigo"/Hitchcock) | Moves in while zooming out (or vice versa); subject stays, background warps — panic, dread, realization |
| Crash / snap zoom | Zooms in almost instantly with motion blur — comedic shock, sudden intensity |
| God's eye view | Straight-down 90° top view, world as a flat map — clinical, detached, geometric |
| Bullet time (frozen orbit) | Subject frozen mid-motion while camera orbits 360° — superhuman, "The Matrix" |

### [focus] — sharpness of the image

| Code | Focus | Vibe |
|------|-------|------|
| RF | Rack focus | Shifts focus between subjects — redirecting attention |
| DF | Deep focus | Everything sharp — objective |
| SF | Shallow focus | Blurry background bokeh — intimate |
| SPD | Split-field diopter | Two separate planes sharp at once — surreal |

### [subject] — what action is happening

Who or what, plus **what they do over time**. This is the beating heart of the clip: "a lone samurai draws his blade and turns," "the barista slides the cup forward as steam curls up," "the car drifts around the corner, tires smoking." Include key descriptors (age, build, wardrobe, expression) and a clear, dynamic action.

### [lighting] — mood, subtext, texture

| Style | Vibe / best for |
|-------|-----------------|
| Chiaroscuro (high-contrast) | Deep shadow vs. bright highlight — dramatic, moody; film noir, thrillers |
| Three-point (key/fill/back) | Studio-clean — professional; interviews, character intros |
| Motivated | Mimics a real in-scene source (lamp, window) — realistic, grounded; period drama |
| Neon noir (cyberpunk) | Vibrant artificial color on dark grit — electric; sci-fi cities, clubs |
| High-key | Flooded with light, few shadows — upbeat, airy; comedy, dream sequences |
| Low-key | Dominated by shadow — suspenseful, scary, intimate; horror, standoffs |
| Volumetric ("god rays") | Beams through dust/fog/smoke — ruins, churches, morning forests |
| Color gels | Colored wash over a scene (e.g. red gel = danger) — music videos, stylized horror |
| Rim / hair light | Glowing backlit outline separating subject from background — heroic silhouettes |
| Rembrandt | Small triangle of light on the shadowed cheek, 45° key — painterly portraits |
| Butterfly | Key light above and in front, small shadow under the nose — Hollywood glamour |
| Practical | In-scene lamps, candles, neon, screens as visible motivators — moody interiors |
| Haze / atmospheric | Smoke or fog adding visible beams and depth — dream sequences, dystopia |

### [color] — how color tells the story

| Palette | Vibe |
|---------|------|
| Orange & teal | The "blockbuster" look — cinematic, professional |
| Monochromatic | Shades of one color — obsessive, dreamlike, claustrophobic (The Matrix) |
| Analogous (neighbors: red/orange/yellow) | Harmonious, natural, comforting |
| Complementary (opposites: purple/yellow) | Vibrant, high-energy, conflicting |

---

## I2V structure — motion-first, and shorter

When a starting image exists, the frame already bakes in ~70–80% of the visual (subject, pose, lighting, style). **Over-describing the scene fights the input** and causes drift. Describe only what should *change over time*:

```
[action/sequence], [subject/environment shifts], [camera movement], [mood/lighting shifts], [technical specs]
```

- **[action/sequence]** — what the subject does: "slowly draws sword and strikes," "accelerates through the tunnel then drifts," "subtle smile, then waves and walks away."
- **[subject/environment shifts]** — how they change: "expression shifts from serious to joyful," "hair flows in the breeze," "leaves scatter across the floor."
- **[camera movement]** — one clear move: "slow 360° orbit," "gentle pull-out revealing the landscape," "static locked-off with a subtle push-in."
- **[mood/lighting shifts]** — "warm daylight transitions to cool twilight," "rim light intensifies."
- **[technical specs]** — aspect ratio, "natural motion, no warping," shallow depth of field, filmic color grade.

Keep it tight — usually **25–70 words**.

## V2V — transforming an existing clip

The source video supplies the motion and composition. Describe the **target transformation**: the new medium/style, palette, lighting, or era to map onto the existing footage (e.g. "restyle this handheld street footage as 1980s VHS neon-noir anime, preserve the original motion"). Keep camera and action language minimal — the input already carries them.

## Output rules

- Output the finished prompt inside a Markdown code block so it's easy to copy. For T2V/V2V write flowing prose; for I2V use the comma-separated segments above.
- Lead with the mode when it isn't obvious (e.g. a one-line "**I2V prompt:**" label above the block).
- Always include motion — camera move, subject action, or both. A prompt with neither is the #1 cause of dead clips.
- Adapt fields to the seed; don't force analog-film or portrait-lighting terms onto ideas that don't want them.
- Match the model's known limits when named (clip length, whether it takes negative prompts or audio cues); otherwise stay model-agnostic.

## Working with the user

- **One seed, one prompt.** For variations, give each as its own complete prompt in its own code block — e.g. an "observer" version (subject moves, camera static) and a "tracking" version (both move).
- **Respect stated choices.** If the user names a medium, shot, or camera move, fix that field and infer only the rest.
- **Diagnosing weak or static video:** map the prompt onto the structure. A frozen result almost always means missing **[movement]** or missing **[subject]** action — add motion rather than piling on adjectives. Warping or a "fighting" look in I2V usually means the prompt over-described the baked-in scene — cut it back to what changes.
