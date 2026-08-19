# Refactoring UI — Chapter 3: Layout and Spacing — Distilled Guidelines

## 1. Start With Too Much White Space

The easiest way to clean up a design is to give every element more room to breathe. Focused on one element in isolation, "a little too much" space usually turns out to be "just enough" in the context of a complete UI. Generous white space almost always reads as cleaner and simpler.

- **Do:** Give elements generous breathing room up front, aiming for more space than feels strictly necessary.
- **Don't:** Cram elements together so tightly that they only avoid looking actively bad.

---

## 2. Remove White Space, Don't Add It

On the web, white space is almost always added — you nudge in margin or padding only until something stops looking cramped. That gives elements the minimum room to not look bad, not the room to look great. Instead, start with way too much space and remove it until you're happy, because it's far more obvious when there's too much space than when there's too little.

- **Do:** Start with excessive spacing and subtract until it looks wrong, then add a little back.
- **Don't:** Keep adding small increments of margin until things merely stop looking broken.

---

## 3. Make Dense UIs a Deliberate Choice

Interfaces with lots of breathing room feel cleaner, but some designs — like an information-dense dashboard — legitimately need to be compact so everything fits on one screen. Density is fine when it's a conscious decision, not when it's just the default you fell into. Because it's easier to notice you need to remove space than to add it, defaulting to airy and tightening deliberately is the safer workflow.

- **Do:** Choose a dense layout on purpose when the content genuinely benefits from seeing a lot at once.
- **Don't:** Let a cramped design happen by default instead of as an intentional trade-off.

---

## 4. Establish a Constrained Spacing and Sizing System

Don't nitpick between 120px and 125px or trial arbitrary values one pixel at a time — that's slow and produces inconsistent designs. Limit yourself to a small set of values defined in advance so sizing becomes a quick pick from a scale. You'll design faster and pick up a subtle consistency that makes everything look cleaner.

- **Do:** Predefine a constrained scale of spacing and sizing values and only choose from it.
- **Don't:** Hand-tune arbitrary one-off pixel values every time you size or space an element.

---

## 5. Use a Non-Linear Scale With ~25%+ Jumps

"Everything is a multiple of 4px" doesn't help — it still leaves you choosing between 120px and 125px. What matters is the relative difference between adjacent values: jumping 12px→16px is a 33% change, while 500px→520px is only 4% (eight times less significant). If no two values in your scale are ever closer than about 25%, sizing decisions become easy because adjacent steps are always visibly distinct.

- **Do:** Build a scale where each step differs from the next by roughly 25% or more, packed tight at the small end and spreading out at the large end.
- **Don't:** Use a linear scale where large adjacent values differ by imperceptible amounts.

---

## 6. Build the Scale From a Sensible Base Value

Don't assemble your scale from arbitrary numbers any more than you'd size individual elements arbitrarily. Start from a sensible base and derive the scale using factors and multiples — 16px is ideal because it divides cleanly and is the default browser font size. A practical example scale: 4 / 8 / 12 / 16 / 24 / 32 / 48 / 64 / 96 / 128 / 192 / 256 / 384…

- **Do:** Anchor your scale to a base like 16px and generate values from its factors and multiples.
- **Don't:** Invent scale values out of thin air with no shared base.

---

## 7. You Don't Have to Fill the Whole Screen

High-resolution displays tempt you to fill 1200–1400px just because the space is there, but having the space doesn't mean you need to use it. If a layout only needs 600px, use 600px — spreading content out or making it unnecessarily wide just makes the interface harder to interpret, and extra space around the edges never hurt anyone. This applies to individual sections too: nothing must be full-width just because the navigation is.

- **Do:** Give each element only the width it needs and let extra space sit around the edges.
- **Don't:** Stretch content to fill the viewport, or make a section full-width just to match another one.

---

## 8. Shrink the Canvas to Design Small Interfaces

Designing a small interface on a huge canvas is hard because the constraints aren't real. Shrink the canvas — start responsive work at a ~400px width and design the mobile layout first, where the tight constraints force good decisions. When you bring that mobile design up to a larger screen and fix anything that felt like a compromise, you'll usually find you change less than expected.

- **Do:** Design mobile-first on a ~400px canvas, then adapt upward to larger screens.
- **Don't:** Try to design a compact interface on a 1400px canvas where nothing constrains you.

---

## 9. Split Into Columns Instead of Widening

When something works best at a narrow width but looks unbalanced inside an otherwise wide UI, don't just stretch it. Break it into columns instead — for example, pull a form's supporting text out into a second column beside the form. This uses the available space and feels balanced without pushing any element past its optimal width or making it harder to use. And don't force the opposite either: if you genuinely need a lot of space, take it.

- **Do:** Split a narrow component into columns to fill space while keeping each part at its ideal width.
- **Don't:** Widen a component past its optimal size, or cram content into a small area just to look tidy.

---

## 10. Don't Make Every Element Fluid

A grid system is just fluid, percentage-based widths chosen from a constrained set — in a 12-column grid each column is 8.33%. Treating that like a religion breaks down whenever an element should have a fixed width instead. A sidebar sized at 3 columns (25%) grows too wide on large screens (wasting space the main content could use) and shrinks below its usable minimum on narrow screens (causing awkward wrapping or truncation). Give the sidebar a fixed width tuned to its contents and let the main area flex to fill the rest.

- **Do:** Give elements like sidebars a fixed width optimized for their contents, and let a fluid main area fill the remaining space using its own internal grid.
- **Don't:** Assign percentage widths to something unless you actually want it to scale — inside components as well as across layouts.

---

## 11. Don't Shrink an Element Until You Need To

Sizing a login card as 6 columns (50%) on large screens and bumping it to 8 columns on medium screens creates an absurd result: because columns are fluid, there's a range where the card is wider on medium screens than on large ones. If 500px is the card's optimal size, it should never drop below that while you still have the space. Give elements a max-width so they don't grow too large, and only force them to shrink once the screen is narrower than that max-width.

- **Do:** Cap elements with a max-width and let them shrink only when the viewport falls below it.
- **Don't:** Size elements in fluid grid columns that make them randomly smaller on larger screens.

---

## 12. Relative Sizing Doesn't Scale Across Screens

It's tempting to encode a fixed relationship — headline at 2.5em of an 18px body, so 45px — and assume it holds everywhere. It doesn't: drop body copy to 14px on small screens and 2.5em renders a 35px headline, far too big. A good small-screen headline is more like 20–24px, only 1.5–1.7× the body copy — a completely different relationship, which means there's no real relationship to encode at all. As a rule, elements that are large on large screens must shrink faster than already-small ones, so the gap between big and small elements is less extreme on small screens.

- **Do:** Set element sizes independently at each screen size, shrinking large elements faster than small ones.
- **Don't:** Assume a relative ratio (like 2.5em) that's right on desktop stays right on small screens.

---

## 13. Don't Scale a Component's Properties Proportionally

Within a single component, tying padding to font size (so one change scales the whole button) works but feels wrong — it's just zooming. Better buttons give padding that's disproportionately more generous at large sizes and disproportionately tighter at small sizes, so a large button feels genuinely large and a small button genuinely small rather than merely zoomed. Let go of proportional scaling and fine-tune each property independently to fit each context.

- **Do:** Adjust padding and other properties independently per size, making them relatively looser when large and tighter when small.
- **Don't:** Define a component's padding purely as a multiple of its font size and scale everything together.

---

## 14. Avoid Ambiguous Spacing

When a border or background separates a group, membership is obvious; when spacing is the only cue, it must do that job clearly. If a form label sits the same distance above its input as the group sits from the next, the label and input don't read as connected — at worst users enter data in the wrong field. The same failure shows up above section headings, between list bullets that match single-bullet line-height, and in horizontally laid-out components. Whenever spacing connects a group, always put more space around the group than within it — and more space above a heading than below it.

- **Do:** Give a group more surrounding space than internal space, and place more space above a heading than below it.
- **Don't:** Use equal spacing inside and around a group, leaving which element belongs to which ambiguous.
