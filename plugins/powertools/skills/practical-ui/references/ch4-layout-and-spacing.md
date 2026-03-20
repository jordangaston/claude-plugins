# Practical UI -- Chapter 4: Layout and Spacing -- Distilled Guidelines

---

## 1. Group Related Elements Using Containers

Place related items inside a shared boundary (border, shadow, or background colour). The principle of common region means people perceive items within the same container as a group. Containers are the strongest visual cue for grouping.

- **Do:** Use cards, dialog boxes, or background regions to associate related content (e.g., an author with their article).
- **Don't:** Wrap every group in a container -- overuse creates clutter. Prefer subtler grouping methods when they suffice.

---

## 2. Group Related Elements Using Proximity

Place related elements close together and separate unrelated elements with more space. The principle of proximity causes people to perceive nearby items as a group.

- **Do:** Replace unnecessary containers with spacing alone to simplify the design.
- **Don't:** Use uniform spacing everywhere -- vary it so groupings are obvious.

---

## 3. Group Related Elements Using Similarity

Give related elements similar visual characteristics (size, shape, colour). The principle of similarity causes people to mentally group items that look alike.

- **Do:** Style navigation links, cards, or list items consistently so they read as a set.
- **Don't:** Make non-interactive elements (icons, badges) look like interactive ones (buttons). If elements look similar, users expect them to function similarly.

---

## 4. Ensure Similar-Looking Elements Function Similarly

If two elements share the same visual treatment, users assume they behave the same way. Conversely, elements with different purposes should look different.

- **Do:** Use a distinct style for badges vs. buttons (different shape, colour, contrast) so users can tell them apart.
- **Don't:** Style informational icons with the same colour and border as actionable buttons.

---

## 5. Group Related Elements Using Continuity

Arrange related items in a continuous straight or curved line. The principle of continuity means people perceive aligned elements as a group, and their eyes naturally follow the line.

- **Do:** Use lists and rows to leverage continuity. Break the line intentionally to signal the end of a group or to highlight a specific element.
- **Don't:** Interrupt alignment within a group without a clear reason.

---

## 6. Combine Grouping Methods for Clarity

Containers, proximity, similarity, and continuity can be combined. When multiple methods reinforce the same grouping, you can safely remove the heaviest one (often the container) to simplify the design.

- **Do:** Check whether proximity + similarity + continuity already make the grouping clear, then drop the container.
- **Don't:** Rely on a single weak cue when the grouping is ambiguous.

---

## 7. Create a Clear Visual Hierarchy

Present information in order of importance by making important elements more prominent. A clear hierarchy helps users scan quickly, focus on what matters, and reduces cognitive load.

Use these levers to control prominence:
- **Size** -- make important elements larger.
- **Colour** -- use brighter, richer, warmer, or higher-contrast colours.
- **Contrast** -- style key elements differently so they stand out.
- **Spacing** -- surround important elements with more space.
- **Position** -- place important items toward the top or first in a row.
- **Depth** -- elevate important elements so they appear closer.

- **Do:** Apply size, weight, and colour differences so the most important element reads first even at a glance.
- **Don't:** Give all elements similar prominence -- it creates a flat, confusing layout.

---

## 8. Order Sections and Content by Importance

Group related information into sections, order the items within each section by importance, then order the sections themselves by importance (most important near the top).

- **Do:** Put the name/title at the top, primary action in a prominent position, and supporting details lower.
- **Don't:** Scatter important and unimportant information randomly through the layout.

---

## 9. Use The Squint Test to Validate Hierarchy

Squint at your design (or blur/zoom out). You should still be able to identify the most important elements and recognise the interface's purpose.

- **Do:** Blur your mockup and confirm the primary action and key content still stand out.
- **Don't:** Ship a design where everything blurs into a uniform grey mass.

---

## 10. Use Depth to Reinforce Visual Hierarchy

Colour and shadows create elevation. Higher-elevation elements appear closer and more prominent; lower ones recede. Use elevation to signal importance and interactivity.

- **Do:** Elevate a sticky header or primary CTA above the content layer with a shadow.
- **Don't:** Apply the same elevation to every element -- it flattens the hierarchy.

---

## 11. Understand the Box Model

Every interface element is a rectangle with margin (space to neighbours), border (stroke around the edge), and padding (space between border and content). Spacing between inner rectangles starts small and increases as you move outward.

- **Do:** Think of your UI as nested boxes and assign spacing systematically from inside out.
- **Don't:** Ignore the box model and set spacing ad hoc.

---

## 12. Design at @1x Using Points

Always work in points (pt), not pixels. 1pt equals 1px at @1x, 4px at @2x, and 9px at @3x. Most design tools default to @1x.

- **Do:** Set dimensions and spacing in points so your design scales cleanly to higher-resolution screens.
- **Don't:** Design in device pixels -- it breaks when rendered on different screen densities.

---

## 13. Create a Predefined Spacing Scale

Define a small set of spacing options based on 8pt increments (e.g., XS 8, S 16, M 24, L 32, XL 48, XXL 80). The scale should grow by larger amounts at the upper end so spacing stays proportional.

Benefits: simplified designs, improved consistency, faster decisions.

- **Do:** Pick from your scale for every spacing decision -- padding, margin, gaps.
- **Don't:** Nudge spacing pixel by pixel with arbitrary values like 11pt, 23pt, 29pt.

---

## 14. Space Elements Based on How Closely Related They Are

Use smaller spacing values for tightly related elements and larger values for unrelated ones. Start with the smallest option for the innermost content and increase as you move outward to larger containers and sections.

- **Do:** Use XS (8pt) between a heading and its subheading; use XXL (80pt) between major page sections.
- **Don't:** Apply the same spacing value everywhere regardless of relationship.

---

## 15. Create Consistent Spacing Rules

Define reusable rules (e.g., M padding inside cards, L gaps between grid columns, XXL vertical padding for page sections) and apply them uniformly. This speeds up decisions and improves rhythm.

- **Do:** Document and follow spacing rules across the whole interface.
- **Don't:** Re-decide spacing for every component from scratch.

---

## 16. Be Generous with White Space

More white space almost always improves a design. It makes groupings and hierarchy clearer, and gives the interface a cleaner, more sophisticated look. When in doubt, choose the next spacing option up.

- **Do:** Increase padding and margins until elements breathe. Use The Squint Test -- if you can't distinguish elements, add more space.
- **Don't:** Pack content tightly to "save space" -- it increases cognitive load and looks cluttered.

---

## 17. Align the Main Layout to a 12-Column Grid

Use a 12-column grid with gutters (gaps between columns) and outer margins. Align the major layout containers to these columns. Smaller elements inside containers use your spacing scale instead.

- **Do:** Use 12 columns on desktop, reduce to fewer columns (e.g., 4) on mobile. Use flexible-width columns and fixed-width gutters.
- **Don't:** Let main content blocks float at arbitrary widths unaligned to any grid.

---

## 18. Keep Gutters Narrower Than Columns

Gutters separate and align columns of content; they should stay empty and be narrower than the columns themselves. Use wider gutters on larger screens (e.g., L 32pt desktop, S 16pt mobile).

- **Do:** Set gutter width from your spacing scale and keep them consistent.
- **Don't:** Let gutters grow as wide as or wider than the columns.

---

## 19. Use Outer Margins to Protect Content Edges

Margins prevent content from touching the left and right screen edges. They can be fixed or flexible and should be wider on larger screens.

- **Do:** Use generous margins on desktop (e.g., XXL 80pt) and smaller ones on mobile (e.g., S 16pt).
- **Don't:** Let content butt up against the screen edge.

---

## 20. Left-Align Text for Readability

Left-aligned text gives the eye a consistent anchor at the start of each line. Maintain a straight left edge when combining text with other elements like icons.

- **Do:** Default to left alignment for body text and most UI labels.
- **Don't:** Place an icon to the left of a heading if it breaks the straight left edge that the body text follows.

---

## 21. Centre-Align Text Only for Short Blocks

Centre alignment works for short, contained text (a title and one line of description). For longer passages it forces the eye to hunt for the start of each line.

- **Do:** Centre-align a brief hero heading or a card title with a one-liner.
- **Don't:** Centre-align paragraphs or multi-line descriptions.

---

## 22. Align Horizontal Text to the Baseline

When different-sized text sits on the same horizontal line, align it to the baseline (the invisible line text sits on), not the vertical centre. This makes the text easier to read and the layout neater.

- **Do:** Baseline-align a large price next to a small "/month" label.
- **Don't:** Vertically centre mixed-size text -- it makes smaller text float disconnected.

---

## 23. Minimise the Number of Alignments

Every additional alignment direction (left, right, centre) adds visual complexity. Our eyes zig-zag trying to follow multiple alignments, increasing cognitive load.

- **Do:** Stick to one alignment (usually left) or at most two within a component or section.
- **Don't:** Mix centre-aligned headings with left-aligned body text and right-aligned metadata in the same card.

---

## 24. Keep Related Actions Close (Fitts's Law)

The closer and larger a target, the faster users can reach it. Place actions near the elements they act on, and make tap/click targets at least 48pt by 48pt.

- **Do:** Put a close button at the same position as the open trigger so users don't have to move. Size menu items generously with visible borders for easy tapping.
- **Don't:** Place a frequently used action far from where the user's cursor or finger already is.

---

## 25. Design for Unbreakable Layouts

Design for long data and edge cases, not just ideal short strings. Avoid hiding overflow when it could conceal essential information. Keep components flexible so content can reflow, or reduce font size to accommodate long text.

- **Do:** Test with realistic worst-case data (long names, long titles). If you must truncate, crop in the middle so users can differentiate items.
- **Don't:** Only design with short placeholder text and ship a layout that breaks with real data.

---

## 26. Use the Rule of Thirds for Photos

Divide a photo into a 3x3 grid. Place the main subject on one of the four intersection points rather than dead centre. This creates a more balanced, natural, and dynamic composition.

- **Do:** Align eyes, horizon lines, or key subjects to the grid intersections.
- **Don't:** Default to centring every subject -- it looks rigid and static, especially in action shots.

---

## 27. Make the Primary Action the Most Prominent Element

The primary call-to-action (e.g., "Book now", "Get started") should be the single most visually prominent element on the screen. Apply the brand colour as a solid fill, increase its size, and elevate it if needed.

- **Do:** Use The Squint Test to confirm the primary button is the first thing that stands out.
- **Don't:** Let decorative elements or secondary content compete with the primary action for attention.

---

## 28. Remove Obvious Labels

If it is already clear what a piece of content is (e.g., a paragraph of descriptive text), drop the label (e.g., "Description:"). Unnecessary labels add clutter without aiding comprehension.

- **Do:** Let context and position communicate the role of content.
- **Don't:** Label every field when the content is self-explanatory.

---

## 29. Sticky + Elevated CTAs on Mobile

For key actions on mobile screens, stick the CTA to the bottom of the viewport and elevate it with a shadow. This keeps it always visible and within thumb reach, per Fitts's Law and the Serial Position Effect (people remember first and last items best).

- **Do:** Pin a "Book now" bar to the bottom with the price next to it.
- **Don't:** Bury the primary action below a long scroll with no persistent affordance.

---

## 30. Use Icons Judiciously for Scannability

Pair icons with text labels for short, repeated metadata (e.g., beds, baths, garage). Use unfilled/outline icons in a muted colour to avoid overpowering the hierarchy.

- **Do:** Use icons to speed up scanning of label-value pairs; keep icon prominence below that of headings and CTAs.
- **Don't:** Use filled, high-contrast icons that compete with primary buttons.
