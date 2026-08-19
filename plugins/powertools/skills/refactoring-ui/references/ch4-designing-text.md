# Refactoring UI — Chapter 4: Designing Text — Distilled Guidelines

## 1. Establish a Type Scale

Most interfaces use too many font sizes — without a system, nearly every pixel value from 10px to 24px ends up somewhere in the UI. This creates inconsistencies and slows your workflow because you waste time deciding between near-identical sizes. Define a fixed, constrained set of sizes and never reach outside it.

- **Do:** Work from a small, deliberate set of sizes so every choice is quick and consistent.
- **Don't:** Pick sizes ad hoc per component, ending up with 10px, 11px, 13px, 15px scattered across the UI.

---

## 2. Prefer A Hand-Crafted Scale Over A Modular Scale

A linear scale doesn't work — small jumps help at the bottom of the scale, but you don't want to agonize over 46px vs 48px for a headline. Modular scales (ratios like 4:5, 2:3, or the golden ratio 1:1.618) are mathematically pure but produce fractional values (31.25px, 39.063px) that round inconsistently across browsers, and they usually give you too few sizes for interface work. Picking values by hand gives total control and avoids subpixel rounding errors.

- **Do:** Use a hand-picked scale such as 12 / 14 / 16 / 18 / 20 / 24 / 30 / 36 / 48 / 60 / 72 px — constrained but never missing a useful size.
- **Don't:** Outsource your sizes to a ratio formula that spits out fractional pixel values like 48.828px.

---

## 3. Round Modular Scale Values If You Use One

If you do want the modular-scale approach — it can suit long-form content like an article — the fractional outputs still cause off-by-one pixel differences because browsers handle subpixel rounding differently. Round every value yourself when defining the scale rather than letting the browser do it. Even then, expect the jumps to feel too limiting for dense interface work.

- **Do:** Round each computed value to a whole pixel before committing it to your scale.
- **Don't:** Ship raw fractional scale values and let each browser round them however it likes.

---

## 4. Never Use Em Units For The Scale

Em units are relative to the current font size, so the computed size of nested elements often won't land on any value in your scale. If a parent is 1.25em (20px), then a child at .875em computes to 17.5px — a size that doesn't exist in your system. This compounding silently breaks the consistency the scale was meant to guarantee.

- **Do:** Define every font size in px or rem so it always resolves to a real value in your scale.
- **Don't:** Use em units for type sizing, where nesting multiplies values into off-scale numbers.

---

## 5. Play It Safe With Neutral Sans-Serifs

Developing an eye for typefaces takes years, and you probably don't have years. For UI text, a fairly neutral sans-serif (think Helvetica) is the safest bet — users are already used to seeing it, so nothing distracts from your content. If you don't trust your own taste at all, the native system font stack is a reliable default.

- **Do:** Reach for a neutral sans-serif, or the system stack (`-apple-system, Segoe UI, Roboto, Noto Sans, Ubuntu, Cantarell, Helvetica Neue`) for UI body text.
- **Don't:** Chase an ambitious or unusual display face for core interface text.

---

## 6. Favor Typefaces With More Weights

As a general rule, typefaces that ship with many weights were crafted with more care and attention to detail than those with only a few. Most font directories let you filter by number of styles (weights plus their italics), which is a fast way to cut the field down to higher-quality options. On Google Fonts, filtering to 10+ styles removes about 85% of the choices, leaving under 50 sans-serifs.

- **Do:** Filter for typefaces with roughly five or more weights (10+ styles counting italics).
- **Don't:** Adopt a family with only one or two weights and hope the details hold up.

---

## 7. Pick Fonts Optimized For The Size You Need

Designers build font families for a specific purpose. Fonts meant for headlines have tighter letter-spacing and a shorter x-height; fonts meant for small sizes have wider letter-spacing and a taller x-height for legibility. Using a headline face for body text — or a condensed, short-x-height face for main UI text — makes reading harder.

- **Do:** Use a face designed for small-size legibility (taller x-height, wider spacing) for main UI text.
- **Don't:** Press a condensed, short-x-height headline face into service as body copy.

---

## 8. Mimic Well-Designed Sites Instead Of Hunting Obscure Fonts

If a font is popular, it's probably good — sorting a directory by popularity leverages the collective judgment of thousands of people and is especially handy when picking something with personality, like a serif. You can also inspect the sites you admire to see what strong design teams chose; they often pick great fonts you'd never find through the safe filters alone. Either way, borrow proven choices rather than gambling on something obscure.

- **Do:** Sort by popularity and steal typeface choices from sites with strong typography.
- **Don't:** Reach for an obscure typeface on a hunch that no well-designed site is using.

---

## 9. Keep Line Length Between 45 And 75 Characters

It's easy to fit text to your layout instead of to the reader, which usually means lines that run too long and become hard to read. For the best reading experience, hold paragraphs to 45–75 characters per line; on the web a width of roughly 20–35em (relative to font size) lands you there. Going a bit past 75 can sometimes work, but you're entering risky territory.

- **Do:** Constrain paragraph width to about 20–35em to keep lines in the 45–75 character range.
- **Don't:** Stretch paragraphs to fill a wide column just because the space is there.

---

## 10. Limit Paragraph Width Even In Wide Layouts

When you mix paragraph text with images or other large components, the overall content area may need to be wide — but the paragraph itself shouldn't be. Cap the paragraph width independently so lines stay readable while the larger elements use the full space. Using two different widths in one content area feels counterintuitive but almost always looks more polished.

- **Do:** Give the paragraph its own capped width while the surrounding content area stays wide.
- **Don't:** Let paragraph text span the entire wide column just to match neighboring images.

---

## 11. Align Mixed Font Sizes By Baseline, Not Center

When you put multiple font sizes on one line — say a large card title beside a smaller list of actions — the instinct is to vertically center them for balance. But centering offsets their baselines, and the misalignment becomes obvious whenever the text sits close together. Aligning by the baseline (the line letters rest on) uses a reference your eyes already perceive, giving a cleaner result.

- **Do:** Align differently-sized text on the same line by their shared baseline.
- **Don't:** Vertically center mixed font sizes, offsetting the baselines your eye tracks.

---

## 12. Scale Line-Height To Line Length

The "1.5 is a good line-height" advice isn't wrong, but it's incomplete — spacing exists to help the eye find the next line when text wraps, and long lines make that jump harder. The further your eyes travel horizontally, the easier it is to lose your place, so line-height and paragraph width should move together. Narrow content can use a shorter line-height like 1.5; wide content may need one as tall as 2.

- **Do:** Give wide, long-line paragraphs a taller line-height (up to ~2) to keep the reader's place.
- **Don't:** Reuse a single tight line-height across both narrow and wide text blocks.

---

## 13. Scale Line-Height Inversely To Font Size

Font size matters as much as line length. Small text needs extra line spacing because the eye struggles to find the next line, so line-height around 1.5+ helps. Large headline text needs no such help — a line-height of 1 (down to ~1.25) is perfectly fine and keeps big type from feeling loose. Line-height and font size are inversely proportional.

- **Do:** Use a taller line-height (~1.5+) for small text and a tight one (~1 to 1.25) for large headings.
- **Don't:** Apply a roomy 1.5 line-height to large headlines, leaving them awkwardly airy.

---

## 14. Don't Give Every Link A Color

A colored, obvious treatment is right for a link embedded in a block of non-link text, so it stands out and looks clickable. But in an interface where almost everything is a link, that "pop" treatment becomes overbearing. Reserve strong color for real navigation and emphasize secondary links more subtly.

- **Do:** Emphasize most in-app links with heavier weight or a darker color, and give truly ancillary links an underline or color only on hover.
- **Don't:** Paint every link a bright accent color so they all fight for attention.

---

## 15. Align Text Left; Center And Right Only With Purpose

Text should follow the reading direction of its language, so for English the vast majority should be left-aligned. Center-alignment looks great on headlines or short, independent blocks, but anything longer than two or three lines reads better left-aligned — if a centered block runs too long, rewrite it shorter rather than leaving it centered. In tables, right-align numbers so their decimals line up and become easy to compare. Justified text can work for a print-style look, but only with hyphenation enabled to avoid ugly word gaps.

- **Do:** Left-align long-form text, center only short headings, right-align numeric columns, and enable hyphenation whenever you justify.
- **Don't:** Center a multi-line paragraph, left-align a column of numbers, or justify text without hyphenation.

---

## 16. Use Letter-Spacing Deliberately

The typeface designer already tuned letter-spacing, so as a rule leave it alone — but two situations benefit from adjustment. A family with wider spacing (like Open Sans, built for small-size legibility) can be tightened when used for headlines to mimic a purpose-built display face; don't try the reverse, since headline fonts rarely work small even with more spacing. All-caps text is the other case: because every letter is the same height, default spacing crowds them, so widen the letter-spacing to improve legibility.

- **Do:** Tighten letter-spacing on large headlines and widen it on all-caps labels.
- **Don't:** Loosen small body text or shove a headline face into a small size hoping spacing rescues it.
