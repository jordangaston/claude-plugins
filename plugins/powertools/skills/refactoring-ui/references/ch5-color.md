# Refactoring UI — Chapter 5: Working with Color — Distilled Guidelines

## 1. Use HSL, Not Hex or RGB

Hex and RGB are common but not useful: colors that are visually similar look nothing alike in code, so you can't reason about a color by reading it. HSL represents color using the three attributes the human eye actually perceives — hue, saturation, and lightness — which makes colors intuitive to read and adjust. Browsers understand HSL, so it should be your default format for the web.

- **Do:** Represent and adjust colors in HSL so a small perceptual change is a small numeric change.
- **Don't:** Store your palette in hex or RGB and try to eyeball relationships between values.

---

## 2. Understand What Hue, Saturation, and Lightness Each Do

Hue is a color's position on the color wheel measured in degrees (0° red, 120° green, 240° blue). Saturation is how vivid the color is: 0% is grey, 100% is intense — and when saturation is 0%, rotating the hue changes nothing. Lightness measures closeness to black or white: 0% is pure black, 100% is pure white, and 50% is the pure color at that hue.

- **Do:** Reach for the specific channel that matches the change you want — hue to shift color, saturation for vividness, lightness for light/dark.
- **Don't:** Bother adjusting hue on a color with 0% saturation, since it has no visible effect.

---

## 3. Don't Confuse HSL with HSB

HSL and HSB are different: lightness in HSL is not the same as brightness in HSB. In HSB, 100% brightness is only white when saturation is 0% — at 100% saturation, 100% HSB brightness equals 100% saturation and 50% lightness in HSL. Design software often defaults to HSB, but browsers only understand HSL.

- **Do:** Design in HSL when targeting the web, and switch your tool's color picker to HSL mode.
- **Don't:** Assume the brightness slider in your design app behaves like CSS lightness.

---

## 4. You Need Far More Colors Than a Palette Generator Gives You

Five perfect hex codes from a palette generator are seductive but you can't build a real interface with them. A usable palette breaks into three categories: greys, one or two primary colors, and a few accent colors. For a complex UI it's not uncommon to need as many as ten different colors, each with 5–10 shades.

- **Do:** Plan for a comprehensive palette — greys, primaries, and accents — each with a full range of shades.
- **Don't:** Try to ship a real interface from a five-color scheme.

---

## 5. Include Plenty of Greys

Almost everything in an interface is grey — text, backgrounds, panels, form controls — so grey is the workhorse of the palette. Three or four shades sound like enough but you'll quickly want something between shade #2 and shade #3; in practice you want 8–10 greys to choose from. That's enough to avoid compromise without wasting time deciding between near-identical shades.

- **Do:** Build 8–10 grey shades, starting from a very dark grey and stepping up to white in steady increments.
- **Don't:** Use true black as your darkest grey — it looks unnatural.

---

## 6. Include Primary Colors with a Full Range of Shades

Most sites need one or two primary colors used for primary actions and active navigation — these define the site's identity (the colors that make you think of Facebook as "blue"). Like greys, each primary needs a variety of 5–10 lighter and darker shades. Ultra-light shades work as tinted backgrounds for things like alerts, while darker shades work well for text.

- **Do:** Give each primary color 5–10 shades so you have both tint-background and dark-text options.
- **Don't:** Rely on a single primary value and try to make it work everywhere.

---

## 7. Include Accent and Semantic Colors

Beyond primaries, every site needs accent colors to communicate different things — an eye-grabbing yellow, pink, or teal to highlight a new feature, plus semantic states like red for destructive actions, yellow for warnings, and green for positive trends. These should be used sparingly, but each still needs multiple shades. If you're color-coding categories like graph lines, calendar events, or tags, you may need even more accents.

- **Do:** Define accent and semantic colors (red / yellow / green) each with multiple shades, even if used rarely.
- **Don't:** Introduce a one-off flat accent color the first time you need it mid-design.

---

## 8. Define Your Shades Up Front

Don't get clever generating shades on the fly with preprocessor functions like "lighten" or "darken" — that's how you end up with 35 near-identical blues that all look the same. Instead, define a fixed set of shades up front and choose from them as you work. This keeps the palette disciplined and consistent across the whole UI.

- **Do:** Commit to a fixed, named set of shades before building screens.
- **Don't:** Call `lighten()` / `darken()` ad hoc to fabricate colors while designing.

---

## 9. Choose the Base Color First

Building a scale starts with a base color — the middle shade that your lighter and darker variants derive from. There's no scientific rule for picking it, but for primary and accent colors a good heuristic is to choose a shade that would work well as a button background. Don't anchor to arbitrary rules like "start at 50% lightness"; every hue behaves differently, so trust your eyes.

- **Do:** Pick a base that reads well as a button background, then build outward from it.
- **Don't:** Force every base color to the same fixed lightness value.

---

## 10. Find the Edges, Then Fill the Gaps

After the base, pick the darkest and lightest shades by thinking about where they'll be used — the darkest is usually text, the lightest usually tints a background (an alert component exercises both). Nine shades is a great count because it divides cleanly: call the darkest 900, base 500, lightest 100. Fill 700 and 300 first as the midpoints of each gap, then fill 800, 600, 400, and 200 the same way. For greys the base matters less, but the edges-then-gaps process is identical.

- **Do:** Set base (500), darkest (900), and lightest (100), then bisect the gaps down to a balanced nine-shade scale.
- **Don't:** Try to place all nine shades at once instead of working inward from the edges.

---

## 11. Trust Your Eyes, Not the Math

A systematic scale gets you started, but you can't craft a perfect palette with math alone. Once you use the colors in real designs it's almost inevitable you'll want to nudge a shade's saturation or make a couple lighter or darker — do it. Just don't add brand-new shades casually, because a palette you don't discipline is no system at all.

- **Do:** Tweak individual shades by eye when they don't feel right in context.
- **Don't:** Keep adding new shades until the palette sprawls and stops being a system.

---

## 12. Don't Let Lightness Kill Your Saturation

In HSL, as a color approaches 0% or 100% lightness the impact of saturation weakens — the same saturation looks more colorful at 50% lightness than at 90%. So to keep lighter and darker shades from washing out, increase the saturation as lightness moves away from 50%. It's subtle, but it matters most when a color covers a large section of the UI.

- **Do:** Raise saturation on the lightest and darkest shades to keep them from looking washed out.
- **Don't:** Hold saturation constant across a scale and let the extremes go grey.

---

## 13. Change Brightness by Rotating the Hue

Every hue has an inherent perceived brightness — yellow reads lighter than blue at identical HSL lightness — with local brightness maximums at yellow, cyan, and magenta (60°, 180°, 300°) and minimums at red, green, and blue (0°, 120°, 240°). Adjusting lightness alone pushes a color toward white or black and drains its intensity, so instead rotate the hue toward the nearest bright hue to lighten or the nearest dark hue to darken. This is what makes a yellow's dark shades feel warm and rich instead of dull brown — but keep rotations to 20–30° or the color changes identity.

- **Do:** Rotate hue toward a brighter or darker neighbor (within 20–30°) to shift brightness while preserving intensity.
- **Don't:** Rotate more than 20–30°, which reads as a different color rather than a lighter or darker one.

---

## 14. Greys Don't Have to Be Grey

True grey has 0% saturation and no color at all, but the greys we like in practice are often saturated toward a hue — that's what makes some feel cool and others warm. Like choosing warm-white versus cool-white light bulbs, tint greys with a bit of blue to feel cool or a bit of yellow/orange to feel warm. Remember to bump saturation on the lightest and darkest greys too, or they'll look washed out and break the temperature.

- **Do:** Tint greys with a consistent hue (cool blue or warm yellow/orange) and hold that temperature across all shades.
- **Don't:** Default to pure 0%-saturation neutral grey and let the extreme shades drift off-temperature.

---

## 15. Accessible Doesn't Have to Mean Ugly — Flip the Contrast

WCAG asks for a 4.5:1 contrast ratio for normal text (under ~18px) and 3:1 for larger text. White text on a colored background often forces the color surprisingly dark to pass, and dark backgrounds grab attention that non-focus elements shouldn't. Flip the strategy: use dark colored text on a light colored background instead — the color still supports the text but stays out of the way.

- **Do:** Meet contrast by putting dark colored text on a light colored background when a colored element isn't the page's focus.
- **Don't:** Force white-on-color and end up with an over-dark background that fights for attention.

---

## 16. Rotate the Hue to Keep Colored Text Accessible

Colored text on a colored background is the hardest case — taking the background hue and only adjusting saturation and lightness can't reach the contrast ratio without going nearly pure white, which flattens the hierarchy between primary and secondary text. Because some hues are inherently brighter, rotate the hue toward a brighter color like cyan, magenta, or yellow to gain contrast without heading to white. This keeps secondary text both accessible and colorful.

- **Do:** Rotate secondary text's hue toward a brighter color to hit contrast while staying distinct and vibrant.
- **Don't:** Push colored text toward pure white to pass contrast, collapsing your text hierarchy.

---

## 17. Never Rely on Color Alone

Color enhances information, but if it's the only signal, colorblind users can't read your UI — a red-green colorblind user can't tell an up metric from a down one by color. Pair color with another cue: add icons for positive/negative change, or on graphs rely on light-versus-dark contrast instead of two distinct hues, since contrast is far easier to distinguish than color. Color should support what the design already communicates, never carry the message by itself.

- **Do:** Back every color signal with an icon, label, shape, or light/dark contrast difference.
- **Don't:** Encode meaning (status, categories, trend direction) in color as the only channel.
