# Refactoring UI — Chapter 2: Hierarchy is Everything — Distilled Guidelines

## 1. Treat Visual Hierarchy as the Core of "Looking Designed"

Visual hierarchy is how important each element appears relative to the others, and it is the most effective tool for making an interface feel deliberately designed. When everything competes for attention, the result reads as a noisy, chaotic wall of content where nothing signals what matters. Deliberately de-emphasizing secondary and tertiary information while highlighting what is most important makes an interface immediately more pleasing — even with the same colors, fonts, and layout.

- **Do:** Decide what is primary, secondary, and tertiary, then style each tier to reflect its rank.
- **Don't:** Give every element equal emphasis so the whole screen fights for attention.

---

## 2. Don't Lean on Size Alone for Hierarchy

Relying too heavily on font size to control hierarchy leads to primary content that is too large and secondary content that is too small. Font weight and color can do the same job while keeping every element at a reasonable, readable size. This produces clearer hierarchy without extremes.

- **Do:** Signal importance with a combination of font weight and color, not just size.
- **Don't:** Make primary text oversized or shrink secondary text to tiny, hard-to-read sizes.

---

## 3. Use Weight to Emphasize Primary Elements

Making a primary element bolder lets you keep a more reasonable font size, and it often communicates importance better than a larger size would. Weight adds emphasis without forcing the layout to accommodate huge text.

- **Do:** Make a primary element bolder so you can keep its font size modest.
- **Don't:** Inflate the font size just to make something read as important.

---

## 4. Use Color to De-emphasize Supporting Text

A softer color makes text read as secondary while sacrificing far less readability than shrinking it would. This keeps supporting text legible while clearly ranking it below the primary content.

- **Do:** Use a softer (lighter) color for supporting text to mark it as secondary.
- **Don't:** Cram supporting text into a tiny font size to push it into the background.

---

## 5. Stick to Three Text Colors and Two Font Weights

Constraining your palette keeps hierarchy consistent and easy to reason about. Use a dark color for primary content (like an article headline), a grey for secondary content (like a publish date), and a lighter grey for tertiary content (like a footer copyright notice). For weight, a normal weight (400 or 500 depending on the font) covers most text, and a heavier weight (600 or 700) handles anything you want to emphasize.

- **Do:** Limit yourself to primary/secondary/tertiary text colors and two font weights.
- **Don't:** Use font weights under 400 for UI work — they are too hard to read at small sizes; reach for a lighter color or smaller size to de-emphasize instead.

---

## 6. Don't Use Grey Text on Colored Backgrounds

Lightening text to grey works on white because the real effect is reduced contrast against the background — not the greyness itself. On a colored background, true grey does not create the same hierarchy; what actually helps is moving the text color closer to the background color. Hand-pick a new color for this rather than defaulting to grey.

- **Do:** Hand-pick a lower-contrast text color that shares the background's hue, adjusting saturation and lightness until it looks right.
- **Don't:** Drop true grey text onto a colored background expecting it to read as de-emphasized.

---

## 7. Don't Use White Text at Reduced Opacity Over Color or Images

White text with lowered opacity does reduce contrast, but it often looks dull, washed out, or even disabled. Worse, over an image or pattern the background bleeds through the text and muddies it. Choosing a solid, hand-picked color avoids the faded look entirely.

- **Do:** Set a solid hand-picked color (same hue as the background, tuned saturation and lightness) to reduce contrast cleanly.
- **Don't:** Fake de-emphasis with translucent white text, especially over images or patterns where the background shows through.

---

## 8. Emphasize by De-emphasizing the Competition

Sometimes the element you want to feature will not stand out no matter what you add to it. When you hit that wall, stop pushing harder on the target element and instead de-emphasize whatever is competing with it. Softening the neighbors makes the important element rise naturally.

- **Do:** Give competing elements (like inactive nav items) a softer color so the active or primary one stands out.
- **Don't:** Keep piling emphasis onto one element while its neighbors remain just as loud.

---

## 9. De-emphasize Whole Regions That Compete for Attention

The same logic scales up to large sections of the interface. If a sidebar competes with the main content area, the fix can be to remove emphasis from the sidebar rather than add it to the content. Letting a region sit on the plain page background quiets it.

- **Do:** Drop a competing region's background color and let its content sit on the page background so the main area leads.
- **Don't:** Wrap secondary regions in their own background color when it pulls attention away from the primary content.

---

## 10. Treat Labels as a Last Resort

Displaying database data in a naive label: value format gives every field equal emphasis and makes hierarchy nearly impossible. Often the format alone identifies the data — `janedoe@example.com` reads as an email, `(555) 765-4321` as a phone number, `$19.99` as a price. When format is not enough, context usually is: "Customer Support" under a name in an employee directory reads as a department without a label. Dropping labels frees you to emphasize the identifying information and makes the interface feel more designed.

- **Do:** Omit the label whenever format or surrounding context already makes the data's meaning clear.
- **Don't:** Reflexively prefix every value with a label and give both equal styling.

---

## 11. Combine Labels and Values Into a Single Phrase

When a value is not self-explanatory, you can often fold the clarifying word into the value itself instead of adding a separate label. "In stock: 12" becomes "12 left in stock"; "Bedrooms: 3" becomes "3 bedrooms". Merging label and value into one unit lets you style each data point meaningfully without losing clarity.

- **Do:** Rewrite `label: value` pairs as a single natural phrase when the label carries little independent weight.
- **Don't:** Split clarifying wording into a separate label when it could just be part of the value.

---

## 12. When You Do Need a Label, Make It Secondary

Sometimes you genuinely need labels — for example when several similar data points must stay scannable, as on a dashboard. In those cases, keep the label but treat it as supporting content: the data is what matters, the label only adds clarity. De-emphasize it by making it smaller, lowering its contrast, using a lighter weight, or some combination of the three.

- **Do:** Add the label but de-emphasize it (smaller, lower contrast, lighter weight) so the data stays the focus.
- **Don't:** Give the label the same emphasis as the value it merely clarifies.

---

## 13. Emphasize the Label Only When Users Scan for It

On information-dense pages like technical specifications, users often scan for the label rather than the value — someone hunting a phone's dimensions looks for "depth", not "7.6mm". There it makes sense to emphasize the label instead of the data. Even so, keep the value readable; it is still important information.

- **Do:** On spec-style pages, use a darker color for the label and a slightly lighter color for the value — enough emphasis without burying the data.
- **Don't:** De-emphasize the value so heavily that the information the user ultimately needs becomes hard to read.

---

## 14. Separate Visual Hierarchy From Document Hierarchy

Semantic markup means using heading tags like h1–h6, and browsers assign progressively smaller default sizes to them. That is fine for articles and documentation, but in application UIs it tricks you into oversizing titles simply because they are marked up as headings. Section titles often behave more like labels than headings — they are supporting content and should not steal attention from the content beneath them, so they should frequently be quite small (or even visually hidden while kept in markup for accessibility).

- **Do:** Choose heading elements for semantics, then style them freely — often small — to serve the visual hierarchy.
- **Don't:** Make a title big just because it is an h1, or let the chosen HTML element dictate its styling.

---

## 15. Balance Weight Against Contrast

Bold text feels emphasized because it covers more surface area — more pixels are ink rather than background in the same space. That relationship between surface area and hierarchy extends to any heavy element, so you can counterbalance a heavy element by lowering its contrast. Reducing contrast makes a heavy element feel lighter even though its actual weight is unchanged.

- **Do:** Give a heavy element (like a solid icon sitting next to text) a softer color so it stops dominating the text.
- **Don't:** Leave a heavy icon at full contrast next to lighter text, where it will feel over-emphasized.

---

## 16. Use Weight to Compensate for Low Contrast

The relationship runs both ways: increasing weight adds emphasis to elements that are too low-contrast to hold their own. This helps when a thin 1px border is too faint in a soft color, but darkening the color would make the design feel harsh and noisy. Thickening the border restores presence while keeping the soft look.

- **Do:** Increase a subtle element's weight (for example, a slightly wider border) instead of darkening its color when a soft look matters.
- **Don't:** Crank up contrast on a subtle element when doing so makes the whole design feel harsh.

---

## 17. Design Actions by Hierarchy, Not Just Semantics

When a page offers multiple actions, it is tempting to style them purely by semantics, but semantics do not excuse ignoring hierarchy. Every action sits somewhere in a pyramid of importance: most pages have one true primary action, a couple of secondary actions, and a few seldom-used tertiary ones. Communicating each action's rank yields a far less busy, clearer UI.

- **Do:** Give primary actions a solid, high-contrast background; give secondary actions an outline or lower-contrast fill; and style tertiary actions like links.
- **Don't:** Style every action as a prominent solid button because they are all technically buttons.

---

## 18. Keep Destructive Actions Low-Emphasis Until Intent Is Shown

Being destructive or high-severity does not automatically make a button big, red, and bold. If the destructive action is not the primary action on the page, a secondary or tertiary treatment usually serves it better. Save the big, red, bold styling for a confirmation step where destroying is the primary action.

- **Do:** Give a non-primary destructive action a secondary or tertiary treatment, then apply bold red styling on the confirmation step where it becomes the primary action.
- **Don't:** Make every destructive action big, red, and bold just because it is dangerous.
