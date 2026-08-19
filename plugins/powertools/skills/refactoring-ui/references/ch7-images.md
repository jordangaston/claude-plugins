# Refactoring UI — Chapter 7: Working with Images — Distilled Guidelines

## 1. Use Genuinely Good Photos

Bad photos ruin a design even when everything else looks great, so photography quality is not a detail you can defer. If your design needs photos and you are not a talented photographer, treat sourcing them as a real task — great photos depend on lighting, composition, and color, skills that take years to develop.

- **Do:** Hire a professional photographer when you need specific shots, or use high-quality stock photography for generic needs.
- **Don't:** Rely on cheesy, low-quality, or amateur smartphone photos to carry an otherwise polished design.

---

## 2. Never Design Around Placeholder Images

Designing with placeholders and planning to swap in "real" photos later never works, because the placeholders hide the contrast and composition problems the final images will introduce. Committing to real, quality imagery from the start keeps the design honest.

- **Do:** Source real, high-quality images (paid stock, or free sites like Unsplash) and design with them in place.
- **Don't:** Design using placeholder images and expect to shoot quick smartphone photos and drop them in afterward.

---

## 3. Fix Contrast at the Image, Not the Text

When a headline is hard to read over a hero image no matter what color you try, the problem is the image, not the text. Photos are dynamic — with very light and very dark areas — so white text gets lost in light areas and dark text gets lost in dark areas. The fix is to reduce that dynamic range so contrast between text and background stays consistent.

- **Do:** Treat unreadable text over a photo as an image problem and reduce the image's dynamic range.
- **Don't:** Keep changing the text color hoping to find one that reads clearly across the whole image.

---

## 4. Add a Semi-Transparent Overlay

Placing a semi-transparent overlay over a background image raises overall text contrast by evening out the light and dark areas. A dark overlay tones down light areas so light text stands out; a white overlay brightens dark areas so dark text stands out.

- **Do:** Add a semi-transparent black overlay for light text, or a white overlay for dark text.
- **Don't:** Drop text straight onto a high-contrast photo with no overlay and hope it reads.

---

## 5. Lower the Image's Contrast

The tradeoff of an overlay is that it lightens or darkens the whole image, not just the problem areas. For more control, lower the contrast of the image itself so its lightest and darkest regions move toward the middle.

- **Do:** Lower the image contrast, then adjust brightness to compensate for how much lighter or darker the image now feels.
- **Don't:** Assume lowering contrast alone is enough — skipping the brightness adjustment leaves the image feeling washed out or muddy.

---

## 6. Colorize the Image With a Single Tint

Colorizing (tinting) an image with a single color flattens its dynamic range and helps text stand out, while also letting a photo pair more nicely with your existing brand colors. Some editors offer this as a built-in feature; if yours does not, you can build it in three steps.

- **Do:** Lower the contrast, desaturate to remove existing color, then add a solid fill using the "multiply" blend mode.
- **Don't:** Layer a tint over a fully saturated, high-contrast image — the leftover color and dynamics will fight the fill.

---

## 7. Add a Subtle Text Shadow

When you want to preserve more of a background image's dynamics, a text shadow adds contrast only where it is needed most — directly behind the text. It should read like a subtle glow rather than a hard shadow.

- **Do:** Use a large blur radius with no offset so the shadow reads as a soft glow, and still reduce overall image contrast a little.
- **Don't:** Add a shadow with a hard offset or small blur — it looks like a literal drop shadow instead of gentle contrast.

---

## 8. Respect Every Image's Intended Display Size

Everything — icons, logos, screenshots — has a size it was designed to be seen at, and drifting from it degrades the result. Scaling bitmaps up makes them fuzzy, but even vector and detailed graphics go wrong when resized, so treat the intended size as a real constraint rather than a starting point.

- **Do:** Plan layouts around the size each graphic was drawn to be displayed at.
- **Don't:** Assume any image can be freely resized to fit whatever space you have.

---

## 9. Don't Scale Small Icons Up

Icons drawn at 16–24px stay crisp when enlarged (they are vectors) but never look professional at 3x or 4x their intended size — they lack detail and feel disproportionately chunky. Keep them near their intended size instead of blowing them up to fill space.

- **Do:** Enclose a small icon inside a larger shape with a background color, keeping the icon near its intended size while filling the larger area.
- **Don't:** Grab a 16–24px SVG icon and bump its size up to fill a large "features" slot.

---

## 10. Don't Shrink Detailed Screenshots

Taking a full-size screenshot and shrinking it 70% crams far too much detail into too little space — a 16px font becomes a 4px font that visitors squint to read. Capture or crop the screenshot so it needs little or no scaling down.

- **Do:** Screenshot at a smaller screen size (like your tablet layout), reserve generous space for it, show only a partial screenshot, or draw a simplified UI with small text replaced by simple lines.
- **Don't:** Shrink a full-resolution, whole-app screenshot to fit a small slot.

---

## 11. Don't Scale Icons Down Either — Redraw Them

Just as small icons look chunky when enlarged, large icons look choppy and fuzzy when shrunk. The extreme case is favicons: shrinking a 128px logo to a 16px browser-tab square turns it to mush as the browser struggles to render all that detail.

- **Do:** Redraw a super-simplified version of the icon or logo at the target size so you control the compromises.
- **Don't:** Leave it to the browser to shrink a detailed 128px logo down to favicon size.

---

## 12. Assume the Worst for User-Uploaded Content

With user-uploaded images you lose the luxury of tuning contrast, adjusting colors, or cropping the perfect frame, so design defensively. Constrain uploads with fixed containers and consistent shapes so arbitrary images can't wreck your layout.

- **Do:** Center images inside fixed containers and crop overflow (in CSS, set the image as a `background-image` with `background-size: cover`), and use consistent shapes like uniform avatars.
- **Don't:** Display user images at their intrinsic aspect ratios and let them throw off your page structure.

---

## 13. Prevent Background Bleed With an Inner Shadow

When a user's image has a background color similar to your UI's background, the two bleed together and the image loses its shape. A border seems like the fix but often clashes with the colors in the image.

- **Do:** Add a subtle inner box-shadow — or a semi-transparent inner border if you dislike the inset look — so edges stay defined without most people noticing.
- **Don't:** Use a solid border, which tends to clash with the colors inside the uploaded image.
