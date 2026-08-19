# Refactoring UI — Chapter 8: Finishing Touches — Distilled Guidelines

## 1. Supercharge Existing Elements Instead of Adding New Ones

You don't have to add new elements to add flair — liven up a page by "supercharging" what's already there. Restyling defaults like list bullets, quotes, links, and form controls is a low-effort way to make a design feel polished and intentional. This works because it removes the generic browser-default look that reads as "unfinished."

- **Do:** Restyle the plain elements you already have (bullets, quotes, links, checkboxes) to add personality without new components.
- **Don't:** Leave elements at their raw browser defaults and assume the design is done.

---

## 2. Replace List Bullets with Icons

If your design includes a bulleted list, replace the bullets with icons. Checkmarks and arrows are great generic choices, but you can use something more specific to your content — like a padlock icon for a list of security-related features. Meaningful icons add both visual interest and reinforce the content's meaning.

- **Do:** Swap default bullets for checkmarks, arrows, or content-specific icons (e.g. a padlock for security features).
- **Don't:** Settle for the default round list marker on a feature or benefit list.

---

## 3. Promote Quotes into Visual Elements

When working on a testimonial, "promote" the quotes into visual elements by increasing their size and changing their color. Treating the quotation mark as a design element rather than punctuation gives the testimonial weight and draws the eye. It signals importance and adds character to an otherwise plain block of text.

- **Do:** Enlarge and recolor quotation marks in testimonials so they act as visual accents.
- **Don't:** Present a testimonial as plain text with default-sized punctuation.

---

## 4. Style Links Deliberately

Links are a great candidate for special styling. Do something as simple as changing the color and font weight, or something fancier like a thick, colorful custom underline that partially overlaps the text. Distinctive link styling adds flair and makes interactive text feel designed rather than defaulted.

- **Do:** Give links a deliberate treatment — color, weight, or a thick custom overlapping underline.
- **Don't:** Rely on the default blue underlined link style everywhere.

---

## 5. Use Brand Colors for Form Controls

If you're working on a form, custom checkboxes and radio buttons are an easy way to add color. Just using one of your brand colors for the selected states — instead of the browser defaults — is often enough to take something from feeling boring to feeling polished and well-designed. It's a small change with an outsized impact on perceived quality.

- **Do:** Style checkboxes and radios with a brand color for their selected states.
- **Don't:** Ship native gray browser form controls when a brand color would elevate them.

---

## 6. Add Color with Accent Borders

If you're not a graphic designer, colorful accent borders are a simple way to add visual flair that other designs get from photography or illustration. Add a colored rectangle across the top of a card, along the side of an alert, under a headline, on active nav items, or across the top of the whole layout. It takes no graphic-design talent to add a colored bar, and it goes a long way toward making something feel "designed."

- **Do:** Add a colored accent border — card top, alert side, active nav item, headline underline, or full-layout top edge.
- **Don't:** Leave bland, borderless surfaces plain when a single accent color would add personality.

---

## 7. Change Background Colors to Break Up Monotony

Even with good hierarchy, spacing, and typography, a design can feel plain. Changing a background color adds excitement without drastically altering the design — it works great for emphasizing an individual panel and for adding distinction between entire page sections. It's a quick way to break up a monotonous expanse of one background color.

- **Do:** Use a different background color to emphasize a panel or separate page sections.
- **Don't:** Let the entire page sit on a single flat background when sections could be distinguished by color.

---

## 8. Use Subtle Gradients and Patterns on Backgrounds

For a more energetic look, use a slight gradient (keep the two hues no more than about 30° apart). You can also add a subtle repeating pattern — across the whole background or just along a single edge. Keep the contrast between the background and the pattern low to ensure readability so the decoration never fights the content.

- **Do:** Add a gentle gradient (hues within ~30°) or a low-contrast repeating pattern, optionally along a single edge.
- **Don't:** Use high-contrast gradients or busy patterns that interfere with legibility.

---

## 9. Add Simple Shapes or Illustrations to Backgrounds

Instead of decorating an entire background, place an individual graphic or two in specific positions. Simple geometric shapes work well, as do small chunks of a repeatable pattern or something more complex like a simplified world map. As with full patterns, keep the contrast low so nothing interferes with the content.

- **Do:** Drop a few geometric shapes, pattern fragments, or a simplified illustration into specific spots at low contrast.
- **Don't:** Add loud background graphics that compete with foreground content for attention.

---

## 10. Design Empty States as a First-Class Priority

If your design depends on user-generated content, the empty state should be a priority, not an afterthought — it's often a user's first interaction with a new product or feature. Incorporate an image or illustration to grab attention and emphasize the call-to-action to encourage the next step. Treat it as an opportunity to be interesting and exciting rather than shipping a blank screen.

- **Do:** Give empty states an illustration and a prominent call-to-action that invites the user to add their first content.
- **Don't:** Leave a new feature showing a bare, blank screen when there's no data yet.

---

## 11. Hide Non-Essential UI Until There's Data

When a feature has supporting UI like tabs or filters, consider hiding it entirely while the state is empty. There's no point presenting a bunch of actions that don't do anything until the user has created some content. Removing that clutter keeps the empty state focused on the one action that matters.

- **Do:** Hide charts, tabs, and filters until there's actual content for them to act on.
- **Don't:** Surround an empty state with inert controls and filters that can't do anything yet.

---

## 12. Use Fewer Borders

When you need separation between two elements, resist immediately reaching for a border. Borders work, but they aren't the only way, and too many make a design feel busy and cluttered. Prefer subtler separation techniques, and if you're already using different backgrounds plus a border, try removing the border — you might not need it.

- **Do:** Question every border and remove redundant ones, especially where another separation cue already exists.
- **Don't:** Reach for a border by reflex every time two elements need distinguishing.

---

## 13. Separate with Box Shadows, Backgrounds, or Spacing

Instead of a border, use a box shadow (a subtler outline that works best when the element differs in color from its background), two slightly different background colors, or simply more spacing. Increasing the separation between groups is a great way to create distinction without introducing any new UI at all. These techniques distinguish elements while keeping the design calm and uncluttered.

- **Do:** Reach for a box shadow, a background-color difference, or extra spacing to separate elements.
- **Don't:** Add a hard border when a shadow, background shift, or more whitespace would read more cleanly.

---

## 14. Think Outside the Box for Components

Most people have preconceived notions of how components "should" look, but that doesn't make them true — a dropdown is just a floating box, so break it into sections, use multiple columns, or add supporting text and colorful icons. Tables don't need one-datum-per-column: combine columns that don't need sorting, introduce hierarchy, and add images or color. Turn a boring stack of radio buttons into selectable cards. Constraints are powerful, but a bit of freedom can take an interface to the next level.

- **Do:** Reimagine components — multi-column dropdowns, tables with merged columns and images, radios as selectable cards.
- **Don't:** Assume every component must match its default mental model (a dropdown as a plain link list, a table as one datum per column).
