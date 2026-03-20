# Practical UI -- Chapter 5: Typography Guidelines

## 1. Use a Single Sans Serif Typeface

Sans serif typefaces are the most legible, neutral, and simple option for interface design. They suit most brand personalities, keep content as the focal point, and reduce cognitive load. Stick to one typeface to avoid visual clutter.

- **Do:** Use a single sans serif typeface (e.g., Inter) for all interface text.
- **Don't:** Mix multiple typefaces in the same interface -- it looks cluttered and increases cognitive load.

## 2. Choose a Typeface with a Tall X-Height

Typefaces with taller lowercase letters (higher x-height) and greater letter spacing are more legible at small sizes. This directly affects how easily users read body text and labels.

- **Do:** Pick a typeface with a tall x-height and generous letter spacing (e.g., Inter over League Spartan).
- **Don't:** Use a typeface with a low x-height for small UI text.

## 3. Choose a Popular, Well-Supported Typeface

Popular typefaces have been tested by many designers and users. Those with multiple weights, OpenType features, and broad language support tend to be higher quality and more versatile.

- **Do:** Sort font directories by popularity; pick typefaces with light, regular, medium, semibold, and bold weights.
- **Don't:** Choose an obscure typeface without checking its weight options, language support, or real-world usage.

## 4. Support Multiple Languages If Needed

If your interface serves users in different languages, verify your typeface covers all required character sets before committing to it.

## 5. Default to the System Typeface When in Doubt

The platform's default system typeface is tried, tested, and loads quickly. It is a safe fallback when you cannot decide on a custom typeface.

## 6. Evoke Emotion with a Second Typeface for Headings Only

Once you are confident with typography, you can introduce a second typeface -- but only for headings. This lets you add brand personality without hurting body-text legibility.

- **Do:** Apply the second typeface to headings only; keep body text in your primary sans serif.
- **Don't:** Use a decorative or script typeface for small body text -- they are illegible at small sizes.

## 7. Match Typeface Mood to Brand Personality

Different typeface classifications evoke different feelings: sans serifs feel modern and neutral; serifs feel classic and established; rounded sans serifs feel playful; casual scripts feel handmade; formal scripts feel elegant; light sans serifs feel luxurious. Choose accordingly.

## 8. Use Regular and Bold Font Weights Only

Limiting yourself to regular and bold (or semibold) simplifies your design system, speeds up decision-making, and produces a cleaner interface. Many font weights create visual noise.

- **Do:** Use bold for headings and regular for body text.
- **Don't:** Mix thin, light, medium, bold, and extra bold weights across the interface.

## 9. Reserve Thin and Heavy Weights for Large Text

Very thin or very thick font weights become hard to read at small sizes. Use them only for headings or display text where the size compensates for reduced legibility.

- **Do:** Use thin or black weights at large heading sizes only.
- **Don't:** Set small labels or body text in thin or extra-bold weights.

## 10. Use a Type Scale to Set Font Sizes

Start with a base body font size, then multiply by a consistent ratio (e.g., 1.200 Minor Third) to generate each larger size. This produces a balanced, harmonious set of font sizes and reduces ad-hoc decisions.

- **Do:** Pick a scale ratio, generate your sizes, and round to whole numbers.
- **Don't:** Assign arbitrary font sizes without a governing scale.

## 11. Choose a Scale Ratio That Fits Your Interface Complexity

Small type scales (e.g., Major Second) suit complex dashboards and tools where many text levels live close together. Large type scales (e.g., Perfect Fifth) suit simple marketing pages with strong visual hierarchy.

## 12. Use a Smaller Type Scale on Mobile

Large type scales can cause headings to wrap awkwardly on small screens. Switch to a smaller scale on mobile to keep text readable and well-proportioned.

## 13. Only Create Text Styles You Actually Need

Every text style in your design system should earn its place. Unused styles add noise and complexity without benefit.

- **Do:** Add a new text style only when an existing one cannot serve the purpose.
- **Don't:** Pre-define many text styles "just in case."

## 14. Make Long Body Text at Least 18px

Most people read screens from about arm's length. For long-form body text, 18px is the minimum size that stays comfortable at that distance. Small body text (e.g., 14px) forces readers to squint or zoom.

- **Do:** Set long body text to 18px or larger.
- **Don't:** Use 14px or smaller for paragraphs of content.

## 15. Use at Least 1.5 Line Height for Long Body Text

A line height of 1.5 to 2.0 (150%-200%) adds enough white space between lines to prevent readers from re-reading the same line. It also makes blocks of text feel more comfortable.

- **Do:** Set line height to at least 1.5 for body text.
- **Don't:** Use a line height of 1.0 -- it squashes lines together and hurts readability.

## 16. Adjust Line Height for Typeface Characteristics

Longer lines, darker/heavier typefaces, and typefaces that appear visually larger all require a taller line height to keep text comfortable and separated.

## 17. Decrease Line Height as Font Size Increases

A 1.5+ line height is necessary for body text but excessive for large headings. Because line height is relative to font size, large text gets disproportionately wide gaps. Reduce the multiplier (e.g., to 1.2-1.3) for headings to keep spacing visually consistent.

- **Do:** Use ~1.3 line height for headings and ~1.5-1.6 for body text.
- **Don't:** Apply the same line-height multiplier to headings and body text.

## 18. Keep Line Height Divisible by 4

Round line-height values so they are divisible by 4. This aligns text neatly to a 4pt vertical layout grid, keeping your design consistent and orderly.

## 19. Keep Line Length Between 40 and 80 Characters

Lines that are too long make it hard to track from one line to the next. Lines that are too short cause eye fatigue from constant line breaks. Aim for 40-80 characters per line (including spaces), especially for long body text.

- **Do:** Constrain your text container to 40-80 characters wide; left- or center-align the block on the page.
- **Don't:** Stretch text across the full width of a wide page.

## 20. Left-Align Text

English readers scan in an F-shaped pattern, left to right. Left alignment gives the eye a consistent anchor at the start of each line, making text easiest to read.

- **Do:** Left-align all body text.
- **Don't:** Use mixed alignments within the same block of content.

## 21. Don't Center-Align Long Body Text

Center alignment works for short headings or taglines because they can be read in a glance. For longer paragraphs, the shifting start position of each line forces the eye to search, slowing reading.

- **Do:** Center-align only headings and very short text.
- **Don't:** Center-align paragraphs or multi-line body text.

## 22. Don't Justify Long Body Text

Justified text creates uneven letter and word spacing that makes reading harder -- especially for people with dyslexia. It also produces distracting "rivers" of white space running through the text block.

- **Do:** Use left-aligned (ragged right) text.
- **Don't:** Justify body text for a "clean edge" -- it harms readability.

## 23. Decrease Letter Spacing for Large Headings

Many typefaces ("text type") are designed with wide letter spacing for small-size legibility. At large heading sizes, that same spacing looks loose and awkward. Tighten letter spacing as text gets bigger.

- **Do:** Reduce letter spacing on large headings; reduce more as size increases.
- **Don't:** Leave default letter spacing on large display text if the typeface was designed for body use.

## 24. Ensure Text on Photos Is Legible

Placing text directly on a photo often fails contrast requirements. Meet WCAG 2.1 AA: small text (18px and under) needs at least 4.5:1 contrast; large text (bold above 18px, or regular above 24px) needs at least 3:1.

- **Do:** Use one of these techniques to guarantee contrast:
  - Linear gradient overlay behind the text
  - Semi-transparent dark overlay on the photo
  - Blurred semi-transparent overlay
  - Solid background behind the text (good for captions)
- **Don't:** Place white or light text directly on a photo without an overlay or background.

## 25. Avoid Light Grey Text

Light grey text may look minimal, but it fails accessibility contrast requirements and is hard to read for many users. Always ensure text meets at least a 4.5:1 contrast ratio against its background.

- **Do:** Use a dark enough grey that passes WCAG 2.1 AA (4.5:1 minimum).
- **Don't:** Use very light grey text for aesthetic minimalism at the cost of readability.

## 26. Avoid Pure Black Text on White Backgrounds

Pure black (#000000) on pure white (#FFFFFF) creates maximum contrast that can cause eye strain and fatigue over extended reading. A dark grey softens the contrast while remaining fully accessible.

- **Do:** Use an accessible dark grey (e.g., #333333 or similar) for body text on white.
- **Don't:** Default to pure black text when a dark grey achieves the same readability with less strain.

## 27. Use Monospaced Typefaces for Code and Comparable Numbers

Monospaced typefaces give every character equal width, making code easier to scan and numbers easier to compare in columns or tables.

- **Do:** Use a monospaced typeface for code blocks and tabular numeric data.
- **Don't:** Use a proportional typeface where character alignment matters.
