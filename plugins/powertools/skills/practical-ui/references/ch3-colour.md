# Practical UI -- Chapter 3: Colour -- Distilled Guidelines

## 1. Ensure Sufficient Contrast

Meet WCAG 2.1 level AA contrast requirements so people with low vision can read your interface. Two ratios matter: **3:1** minimum for large text (>18px bold or >24px regular) and UI elements (form fields, checkboxes); **4.5:1** minimum for small text (18px or less).

- **Do:** Check every text element, icon, and form control against its background using a contrast checker.
- **Don't:** Assume a colour "looks fine" without measuring it.

---

## 2. Consider APCA for More Accurate Contrast

The Accessible Perceptual Contrast Algorithm (APCA), part of the WCAG 3 draft, fixes limitations of WCAG 2 -- especially for dark interfaces and certain colour combinations like white-on-orange. Use it alongside WCAG 2 for optimal results.

- **Do:** Use APCA on personal projects and as a secondary check on commercial projects.
- **Don't:** Rely solely on WCAG 2 for dark-background interfaces, where its measurements are unreliable.

---

## 3. Never Rely on Colour Alone to Convey Meaning

Some users are colour blind. If colour is the only differentiator (e.g., a red border for errors, a blue word for a link), colour-blind users will miss the signal entirely.

- **Do:** Pair colour with additional cues -- icons, underlines, thicker borders, background fills.
- **Don't:** Use colour as the sole indicator for errors, links, status, or any meaningful distinction.

---

## 4. Use Traffic-Light System Colours for Status

Reserve red for errors, amber for warnings, and green for success. These colours already carry familiar, universal associations from traffic signals.

- **Do:** Apply red, amber, and green consistently for error, warning, and success states.
- **Don't:** Repurpose system colours (e.g., using red for a primary action button), as it creates conflicting meaning.

---

## 5. Make System Colours Accessible

System colours used for text need at least 4.5:1 contrast; for icons and UI elements, at least 3:1. Always pair them with non-colour cues like icons so colour-blind users understand the status.

- **Do:** Add an error icon next to red text; add a checkmark next to green success text.
- **Don't:** Use a low-contrast green or red that fails minimum contrast ratios.

---

## 6. Use Colour to Define Visual Hierarchy

Not all content is equally important. Use **saturation** (richer colours for key elements), **hue** (prominent hues like red for urgent items), and **contrast** (darker headings, lighter secondary text) to direct attention.

- **Do:** Make headings higher contrast than body text; make primary buttons more saturated than secondary ones.
- **Don't:** Give every element the same colour weight -- it flattens the hierarchy.

---

## 7. Design in Black and White First

Building the interface in greyscale forces you to get spacing, sizing, layout, and contrast right before adding the complexity of colour. Colour is then introduced with purpose rather than decoration.

- **Do:** Start with a greyscale mockup to nail the layout, then layer in colour.
- **Don't:** Pick colours early and let them mask hierarchy or spacing problems.

---

## 8. Avoid Pure Black

Pure black (#000000) against white creates maximum contrast, which causes eye strain during extended reading. A dark grey is easier on the eyes and still looks "black."

- **Do:** Use a very dark grey (e.g., #1A1A1A) instead of pure black for text and backgrounds.
- **Don't:** Set body text or large backgrounds to #000000.

---

## 9. Add a Tinge of Colour to Black and White

Instead of neutral greys, use greys with a subtle tint of the brand hue. This differentiates the brand while preserving the simplicity of a near-monochrome palette.

- **Do:** Shift greys slightly toward the brand hue for a cohesive, branded feel.
- **Don't:** Over-saturate the greys -- a subtle tinge is enough.

---

## 10. Use One Brand Colour

A single, distinctive brand colour alongside black and white keeps the interface clean and lets you assign functional meaning to that colour (e.g., "this colour means interactive").

- **Do:** Pick one high-contrast brand colour and use it purposefully.
- **Don't:** Scatter multiple brand colours across the interface without clear rules.

---

## 11. Apply the Brand Colour to Interactive Elements

Reserve the brand colour for links, buttons, and other interactive controls. This teaches users what is clickable. Avoid using it on non-interactive elements like headings or decorative icons, which could be mistaken for links.

- **Do:** Colour text links and primary buttons with the brand colour.
- **Don't:** Apply the brand colour to headings, static icons, or decorative elements.

---

## 12. Ensure the Brand Colour Has 4.5:1 Contrast

The brand colour used on interactive elements must meet 4.5:1 contrast against its background so that button labels and link text remain readable for people with low vision.

- **Do:** Test the brand colour against white, fill, and dark backgrounds using both WCAG 2 and APCA.
- **Don't:** Choose a brand colour that looks good but fails contrast checks.

---

## 13. Handle Low-Contrast Brand Colours Carefully

Light brand colours (e.g., yellow) cannot serve as text or button-label colours against white. Darken the brand colour, use the text colour for interactive labels, or add borders to buttons to reach a 3:1 contrast ratio.

- **Do:** Use dark text on a light brand-coloured button, or darken the brand colour for text links.
- **Don't:** Place white text on a light-coloured button and ignore the contrast failure.

---

## 14. Avoid Using Meaningful Colours for Interactive Elements

If the brand colour doubles as a system colour (e.g., red = errors), using it on buttons and links creates conflicting signals. In that case, keep interactive elements black-and-white and use the brand colour only decoratively.

- **Do:** Use a neutral colour for interactive elements when the brand colour (red, green, amber) conflicts with system meanings.
- **Don't:** Make all buttons red when red already means "error" or "destructive action."

---

## 15. With Multiple Brand Colours, Use One for Interaction

If the brand has several colours, assign the highest-contrast one to interactive elements. Use the others sparingly for decoration (backgrounds, borders, illustrations). Never use more than one colour to signal interactivity.

- **Do:** Pick the highest-contrast brand colour for buttons/links; relegate others to decorative roles.
- **Don't:** Alternate brand colours on different buttons -- users won't know what each colour means.

---

## 16. Create a Colour Palette with Usage Rules

Define a small set of predefined colours -- each with a clear functional role -- rather than picking ad-hoc colours. A practical palette has: **Brand** (interactive elements), **Text strong** (headings, labels), **Text weak** (supporting text), **Stroke strong** (non-decorative borders, icons), **Stroke weak** (decorative dividers), and **Fill** (secondary backgrounds like badges).

- **Do:** Document each colour's role and enforce it across the team.
- **Don't:** Let designers or developers freely choose from an unlimited colour set.

---

## 17. Use the HSB Colour System

HSB (Hue, Saturation, Brightness) makes it intuitive to create colour variations. Keep the hue constant, then adjust saturation and brightness to derive text, stroke, and fill variants from the brand colour.

- **Do:** Start with the brand colour's HSB values and derive all palette variations by tweaking S and B.
- **Don't:** Pick unrelated hex values for each palette slot.

---

## 18. Five Colour Variations Are Often Enough

Large palettes are hard to learn and follow. In most cases, one brand colour plus five derived variations (text strong, text weak, stroke strong, stroke weak, fill) cover all needs. Add more only when required.

- **Do:** Start minimal and expand the palette only if a real use case demands it.
- **Don't:** Pre-create dozens of colour swatches "just in case."

---

## 19. Use Monochromatic Greys Over Neutral Greys

Deriving all grey variations from the brand hue (monochromatic) creates a more cohesive, branded feel than pure neutral greys (saturation = 0). Monochromatic palettes simplify the interface and strengthen brand presence.

- **Do:** Give your greys a subtle tint of the brand hue.
- **Don't:** Default to neutral greys when a monochromatic approach would reinforce the brand.

---

## 20. Create a Dark Colour Palette

For dark mode, invert the palette logic: start with a dark background and derive progressively lighter/less-saturated foreground colours. Increase contrast well above WCAG minimums, since dark interfaces are harder to read. Avoid pure black for backgrounds.

- **Do:** Use APCA to verify contrast on dark backgrounds; aim above the minimum.
- **Don't:** Simply invert your light palette -- dark mode needs its own tuned values.

---

## 21. Lighten and Desaturate the Brand Colour for Dark Backgrounds

A brand colour that works on a light background may lack contrast on a dark one. Lighten and desaturate it until it passes contrast checks. If the result drifts too far from the brand, use white for interactive elements and apply the brand colour decoratively.

- **Do:** Adjust the brand colour's brightness and saturation for dark mode separately.
- **Don't:** Use the same brand colour on dark and light backgrounds without re-checking contrast.

---

## 22. Add Depth with Colour and Shadows

Use shadows and lighter/darker fills to create elevation levels. Lighter elements appear closer; darker elements recede. Define two shadow options: **Raised** (small, sharp shadow for cards) and **Overlay** (larger, softer shadow for dropdowns and dialogs).

- **Do:** Limit your shadow tokens to two or three well-defined levels.
- **Don't:** Invent a new shadow for every component.

---

## 23. Use Colour (Not Just Shadows) for Dark-Mode Depth

Shadows are hard to see on dark backgrounds. Instead, define three progressively brighter background colours -- Base, Raised, Overlay -- to indicate elevation. Ensure each level looks consistent between light and dark mode.

- **Do:** Increase background brightness slightly for each elevation level in dark mode.
- **Don't:** Rely on shadows alone to convey depth on dark interfaces.

---

## 24. Use Light Colours on Top of Dark for Natural Depth

Light naturally comes from above, so lighter colours feel elevated and darker colours feel receded. Place lighter-coloured cards on a slightly darker background so they "pop" without relying solely on shadows.

- **Do:** Set card backgrounds to white or near-white on a subtle grey page background.
- **Don't:** Put white cards on a white background and wonder why they feel flat.

---

## 25. Shadow Colour Should Match the Palette

Instead of using pure black for shadows, use the "Text strong" variation from your palette. This keeps the shadow colour harmonious with the rest of the interface.

- **Do:** Derive shadow colour from your palette's darkest variation.
- **Don't:** Default to `rgba(0,0,0,...)` for every shadow.

---

## 26. Consider Transparent Colours for Complex UIs

Solid colours look inconsistent on different backgrounds (e.g., a grey tag on a grey card blends in). Transparent colours let the background bleed through, maintaining consistent visual prominence across varying surface colours. This is especially important for dark mode with multiple elevation levels.

- **Do:** Use transparent foreground colours when elements must sit on backgrounds of varying brightness.
- **Don't:** Use solid colours for foreground elements if they appear on more than one background colour.

---

## 27. Use Transparent Layers for Interaction States

Rather than defining new colours for hover and press, layer a transparent overlay on top of the element. Use the "Fill" variation for hover and "Stroke weak" for press. This approach works across any base colour without expanding the palette.

- **Do:** Overlay a semi-transparent fill on hover; a slightly more opaque one on press.
- **Don't:** Create separate solid hover/press colours for every component.

---

## 28. Use Opacity Changes to Indicate States

Lower the opacity of interactive elements to communicate hover (e.g., 80%), disabled (e.g., 20%), and other states without introducing new colours. Use an outline for focus state.

- **Do:** Adjust opacity for state changes so you avoid palette bloat.
- **Don't:** Leave disabled buttons at full opacity -- users cannot tell they are inactive.

---

## 29. Use Elevation Changes to Indicate Hover

Raise elements on hover using a larger shadow or upward animation. The press state can revert to the default elevation, since it only needs to differ from hover. Keep animations quick and subtle.

- **Do:** Add a slight shadow increase or vertical shift on hover for cards and buttons.
- **Don't:** Use large or slow animations that distract from the task.

---

## 30. Toggle Text Underlines for Link Hover States

For underlined text links, remove the underline on hover. For non-underlined interactive text (e.g., nav items), add an underline on hover. The toggle itself signals interactivity.

- **Do:** Reverse the underline state on hover to provide a clear visual change.
- **Don't:** Leave links with no hover feedback.

---

## 31. Test Your Colour Palette in a Real Interface

Create a "kitchen sink" mock-up that uses every colour variation in context. Seeing all colours together is the only way to confirm they work harmoniously. Test both light and dark mode for consistency.

- **Do:** Build a single reference screen containing all palette colours applied to real components.
- **Don't:** Evaluate colours only as isolated swatches in a style guide.

---

## 32. Name Colours with Primitive and Semantic Layers

Use **primitive names** based on appearance (e.g., `grey.light.700`) and **semantic names** based on function (e.g., `text.strong`, `stroke.error`). Primitive colours are the raw values; semantic colours map to primitives and are what designers and developers reference. This makes theme switching (light/dark) trivial.

- **Do:** Assign primitives a numbered scale (0-1000) indicating relative contrast; assign semantics a `[element.tone.emphasis.state]` structure.
- **Don't:** Use semantic colours in code without a primitive layer, or let people reference raw hex values directly.

---

## 33. Keep Semantic Colour Names to Four Words or Fewer

A practical naming pattern is `element.tone.emphasis.state` (e.g., `fill.success.weak`, `text.error`, `stroke.strong.hover`). This is easy to learn and scales to larger systems without over-complicating names.

- **Do:** Follow a consistent, documented naming convention across the whole team.
- **Don't:** Create component-specific colour names (e.g., `button-primary-hover-bg`) unless truly necessary.

---

## 34. Adjust Photo Colour Temperature to Match the Palette

If the colour palette leans cool (blue-based), use photos with a cooler temperature for a cohesive feel; for warm palettes, use warmer photos. This is a finishing touch for decorative imagery, not product photos where realistic colour matters.

- **Do:** Shift decorative hero images toward the palette's temperature for visual harmony.
- **Don't:** Alter product photography where accurate colour representation is essential.
