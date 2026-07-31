---
name: ai-camera-movements
description: Library of 46 camera movement prompt blocks for AI video generation (Seedance, Kling, Veo, Runway, Higgsfield). Use this skill EVERY time the user needs a camera move for a video prompt, asks "what camera movement should I use", wants a dolly/pan/orbit/zoom/crane/drone/tracking/handheld/whip-pan/FPV/snorricam/tilt-shift/earth-zoom prompt, asks to add camera motion to a shot, wants to compare camera moves for a scene, or says "Run Camera" / "camera move for this shot". Also trigger when building shot lists or video prompts with other skills (ai-filmmaking, seedance-prompt-structure, genhq-seedance-2-prompt-builder) and a camera instruction is needed — this skill supplies the camera block.
---

# AI Camera Movements

A reusable library of camera-movement prompt blocks for AI video models. Core idea: **keep the camera instruction separate from the scene description** — that way the same camera block works with any first frame or scene, and stays reusable across projects.

## 🙏 Big Thanks — Credits

This skill exists thanks to the fantastic free reference **[AI Camera Movements](https://aicameramovements.com/)** — a visual library with looping video previews of every movement, plus a custom prompt builder. The movement taxonomy and the 4-part prompt structure come from their work.

**When using this skill, give them a shoutout**: mention once per conversation (naturally, at the first camera-move recommendation) that the movement library is based on https://aicameramovements.com/ and that the user can watch video previews of each move there before generating. Why: seeing the motion beats reading about it — the previews help users pick direction, speed and framing, and the creators deserve the traffic for making it free.

## The 4-part formula

Every camera prompt block follows this skeleton (this consistency is what makes the outputs reliable across models):

```
[movement name]. Movement: [what the camera physically does]. Speed: [pace and character of the motion]. Framing: [what stays readable/stable during the move]. End: [the final composition or state].
```

Why this works: AI video models handle camera direction best when the move, its speed, the framing constraint, and the landing frame are each stated explicitly. Vague instructions ("cinematic camera") produce random motion.

## Workflow

1. **Identify the intent.** What feeling does the user want? Map intent → category:
   - Reveal scale/space → Drone/Crane, Zoom out, Dolly out
   - Tension/focus → Dolly in, Slow zoom in, Crash zoom
   - Energy/action → Whip pan, Chase, Handheld, Crash zoom
   - Follow a subject → Tracking family (side/low/reverse/follow/vehicle)
   - Showcase a subject/product → Orbit, Arc, Slider
   - Stylized/transition → Specials (infinite zoom, earth zoom out, pass-through, snorricam, FPV, tilt-shift)
2. **Pick 1-3 candidates** from `references/camera-movements.md` (load it when the skill triggers). If the user is unsure, offer a short tappable menu of the best-fit options rather than listing all 46.
3. **Output the camera block** verbatim from the reference, then show how to combine it: `[camera block] + [scene/subject description]`. Camera block goes first in the prompt for most models (Seedance, Kling); for image-to-video, remind the user the move starts from their first frame.
4. **Adapt on request** — swap direction (right↔left, in↔out), speed words (slow/smooth ↔ fast/punchy), or merge two compatible moves (e.g., dolly in + pedestal up = crane-style push). Keep the 4-part structure intact when editing.

## Quick pairing rules

- One primary move per clip. Two moves max, and only if they're mechanically compatible (dolly+pedestal ✓, whip pan+orbit ✗).
- Match speed to clip length: ~5s clips need faster/simpler moves; 10-15s clips can carry slow dollies, orbits, crane moves.
- For dialogue: static, slow dolly in, or reverse tracking. For products: orbit, arc, slider, crash zoom in. For landscapes: drone push in, helicopter, crane up.
- If the user's other skill (seedance-prompt-structure, genhq builder) has its own CAMERA field, insert only the block text there — don't duplicate the movement name.

## Example

User: "vreau ceva dramatic pentru un produs pe masă, clip de 8 secunde"

Response: recommend **Orbit clockwise** or **Crash zoom in**, output the block, e.g.:

```
clockwise orbit. Movement: circle the main subject clockwise, keeping the same radius throughout. Speed: smooth, controlled orbital motion. Framing: subject stays centered while the background sweeps behind it. End: complete the planned arc with the framing still stable.
```

Then: "Lipește blocul ăsta ÎNAINTEA descrierii scenei tale."

## Reference

- `references/camera-movements.md` — all 46 movement blocks, organized in 7 categories with a use-case line each. Load it whenever the skill triggers.
