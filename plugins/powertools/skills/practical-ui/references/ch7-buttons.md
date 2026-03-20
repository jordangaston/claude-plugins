# Practical UI - Chapter 7: Buttons - Distilled Guidelines

## 1. Define Three Button Weights

Every interface needs three button levels — primary, secondary, and tertiary — to communicate action importance. Without distinct weights, users cannot tell which action matters most.

- **Primary:** Solid fill with brand colour and white text. Most prominent; highlights the single most important action.
- **Secondary:** Outlined (border only) with brand-colour text. No solid fill, to avoid competing with primary.
- **Tertiary:** Transparent with underlined text (styled like a link) in the brand colour. Least prominent.

**Do:** Differentiate button weights by style (fill vs. outline vs. text), not just by colour.
**Don't:** Use a light-grey fill or outline for secondary buttons — users will mistake them for disabled buttons.

---

## 2. Maintain a Visual Hierarchy Independent of Colour

Button hierarchy must remain clear even without colour. People who are colour-blind rely on shape, weight, and style differences to distinguish buttons.

**Do:** Use structurally different styles (filled, outlined, text-only) so buttons are distinguishable in greyscale.
**Don't:** Rely on colour alone (e.g., two identically shaped buttons in different hues) to convey hierarchy.

---

## 3. Meet Contrast Requirements for Button Shapes

The button's visible boundary (fill or border) must have a contrast ratio of at least 3:1 against its background. This ensures people with low vision can identify the element as interactive.

**Do:** Check the contrast ratio of every button border or fill against the page background.
**Don't:** Use a light-coloured fill or border that falls below the 3:1 threshold.

---

## 4. Meet Contrast Requirements for Button Text

Button label text must have a contrast ratio of at least 4.5:1 against the button background (WCAG 2.1 AA). Insufficient contrast makes labels hard to read, especially for users with low vision.

**Do:** Verify text contrast on every button variant, including secondary and tertiary styles.
**Don't:** Use light-grey text on a white or light button background.

---

## 5. Ensure Sufficient Contrast Between Button Variants

When two buttons sit side by side with similar styles, the contrast ratio between them must be at least 3:1. Without this, users with low vision cannot tell them apart.

**Do:** Test the contrast difference between adjacent primary and secondary buttons.
**Don't:** Place two similarly coloured, similarly styled buttons next to each other.

---

## 6. Keep Button Shapes Consistent

Elements that function the same way should look the same way. Mixing shapes (e.g., one rounded button, one pill-shaped button) for actions that behave identically introduces confusion.

**Do:** Use the same border-radius and shape for all buttons at a given weight level.
**Don't:** Vary button shapes arbitrarily without a functional reason.

---

## 7. Use a Single Primary Button per Screen

The primary button signals "this is the most important action." Multiple primary buttons compete for attention and undermine that signal.

**Do:** Limit each screen or context to one primary button. Demote other actions to secondary or tertiary.
**Don't:** Give every action a primary button style (e.g., a list of "Follow" buttons all rendered as primary).

---

## 8. Use Secondary Buttons for Equally Important Actions

When two or more actions have equal importance and no single action should dominate, use secondary buttons for all of them. This avoids creating bias toward one option.

**Do:** Present equally weighted choices (e.g., "Report" / "Don't report") with matched secondary button styles.
**Don't:** Make one option primary when neither action is more important than the other.

---

## 9. Use Tertiary Buttons for Least-Important and Destructive Actions

Tertiary buttons reduce visual prominence. They work well for repeated low-priority actions (e.g., "Remove" in a list) and for destructive actions you want to de-emphasise.

**Do:** Style repeated or destructive secondary actions as tertiary to keep focus on the primary action.
**Don't:** Style destructive actions prominently (e.g., red filled buttons) when a primary positive action exists nearby.

---

## 10. Avoid Disabled Buttons

Disabled buttons cause three problems: they give no feedback on why they are unavailable, their low contrast makes them invisible to some users, and they are not keyboard-accessible.

**Do:** Prefer alternatives — enable the button and validate on submit, remove unavailable actions with an explanation, or use a lock icon.
**Don't:** Grey out a submit button and leave users guessing what they need to do.

---

## 11. Enable Buttons and Validate on Submit

Instead of disabling a form's submit button until all fields are complete, keep it enabled and show inline error messages when the user submits. This prevents users from getting stuck and makes errors immediately clear.

**Do:** Keep the submit button active and surface validation errors on press.
**Don't:** Disable the submit button on incomplete forms with no guidance on what is missing.

---

## 12. Remove Unavailable Actions (and Explain Why)

Rather than showing a greyed-out button, hide the action entirely and display a message explaining why it is unavailable and what the user can do to unlock it.

**Do:** Replace disabled buttons with a short explanatory message.
**Don't:** Show a disabled button with no context about why it cannot be pressed.

---

## 13. Use Lock Icons on Unavailable Actions

As an alternative to disabling or hiding a button, display a lock icon on a normal-contrast button. This keeps the action discoverable while communicating that it is currently inaccessible. Pair it with a message explaining how to unlock it.

**Do:** Use a lock icon for premium or gated features, then explain on press how to gain access.
**Don't:** Lock a button without telling the user why or how to unlock it.

---

## 14. Make Disabled Buttons More Inclusive (When Unavoidable)

If you must use a disabled button, mitigate its problems: add a nearby message or tooltip explaining why it is disabled and what the user must do, and ensure the button remains keyboard-focusable so assistive technology users can reach the tooltip.

**Do:** Include explanatory text near or on hover/focus of the disabled button, and keep it in the tab order.
**Don't:** Use a disabled button with no explanation and no keyboard accessibility.

---

## 15. Left-Align Buttons, Ordered Most to Least Important

English readers scan left to right in an F-pattern. Placing the most important button at the left edge reduces interaction cost and prevents it from being missed on large screens or by screen-magnifier users.

**Do:** Order buttons left-to-right from primary to tertiary.
**Don't:** Right-align buttons on standard forms — they can be missed on wide viewports.

---

## 16. Stack Buttons Vertically on Mobile

On narrow screens, stack buttons top to bottom (most important on top) and make them full-width. This preserves the importance order and makes buttons easy to reach with one hand for both left- and right-handed users.

**Do:** Use full-width stacked buttons on mobile, primary on top.
**Don't:** Place small side-by-side buttons on mobile that are hard to tap with one thumb.

---

## 17. Keep Consistency on Dialog Boxes

For small dialog boxes, either left-align or right-align buttons — but stay consistent across your product. Right alignment can indicate forward momentum (primary = forward, secondary = back) and is common on macOS. Left alignment is common on Windows and maintains consistency with form layouts.

**Do:** Pick one alignment for dialogs and use it everywhere.
**Don't:** Left-align on some dialogs and right-align on others within the same product.

---

## 18. Left-Align the Primary Button on Multi-Step Forms

On multi-step forms, keep the "Next" / "Continue" button left-aligned near the form fields. Place a tertiary "Back" link at the top-left of the form (mirroring browser and mobile back-button conventions). This reduces mis-clicks on "Back" and shortens the distance from the last field to the primary action.

**Do:** Put the forward action at the bottom-left and the back action at the top-left.
**Don't:** Split "Back" (left) and "Next" (right) at the bottom of the form — users may accidentally hit "Back" and lose entered data.

---

## 19. Exception: Inline Single-Field Forms

For single-input patterns (search bars, email subscribe fields), placing the primary button to the right of the field is acceptable. Attaching the button to the field saves space and reinforces the relationship between input and action.

**Do:** Connect the button visually to the field for single-input forms.
**Don't:** Apply this exception to multi-field forms.

---

## 20. Write Descriptive Button Text (Verb + Noun)

Button labels should make sense when read out of context. Use a verb followed by a noun: "Save post," "Delete message," "Start workout." Screen-reader users navigate by jumping between buttons and links, so vague labels like "OK" or "Submit" fail to communicate the action.

**Do:** Label buttons with a specific verb + noun (e.g., "Save post," "Edit article").
**Don't:** Use generic labels like "OK," "Yes," "Submit," or "Click here."

---

## 21. Ensure a Sufficient Target Size

Small tap/click targets slow users down and cause errors, especially for those with motor impairments or one-handed phone use. Aim for at least 48 x 48 pt (exceeding the WCAG minimum of 44 x 44 pt). Separate adjacent targets by at least 8 pt.

**Do:** Size buttons at 48 pt minimum; make frequently used buttons even larger.
**Don't:** Use small, tightly packed buttons (e.g., tiny stepper arrows) without expanding their hit area.

---

## 22. Extend the Target Area Beyond Visual Bounds

For visually small interactive elements (icons, text links), extend the invisible tap/click target beyond the visible boundary. This catches near-misses and reduces frustration.

**Do:** Add transparent padding to small interactive elements so the tappable area exceeds the visible area.
**Don't:** Limit the clickable region to the exact pixel boundary of a small icon or link.

---

## 23. Indicate the Target Area Visually

If you extend a hit target, also make the larger area visible (e.g., with a background highlight on hover or a container shape). If the target still looks small, users will aim carefully and move slowly, negating the benefit of the larger hit area.

**Do:** Use a visible hover/focus state or container that reflects the true target size.
**Don't:** Extend the hit area invisibly and leave the element looking tiny.

---

## 24. Balance Icon-and-Text Pairs by Weight

When an icon sits next to text in a button, match their visual weight (stroke thickness). Mismatched weights make the pair feel disconnected and unbalanced.

**Do:** Pair regular-weight icons with regular-weight text; bold icons with bold text.
**Don't:** Combine a heavy filled icon with thin text, or vice versa.

---

## 25. Balance Icon-and-Text Pairs by Size

Icons paired with text should match the text's optical size. An oversized or undersized icon draws disproportionate attention and disrupts the visual balance.

**Do:** Scale the icon to roughly the same optical height as the text.
**Don't:** Use a large icon next to small text or a tiny icon next to large text.

---

## 26. Use Contrast to Balance Icons and Text

When you cannot perfectly match icon and text weight or size, adjust the icon's colour contrast relative to the text. Reduce icon contrast slightly if the icon is heavier or larger, so neither element dominates.

**Do:** Lower icon contrast when icons are bolder or larger than their companion text.
**Don't:** Use identical high contrast for both icon and text when the icon is visually heavier.

---

## 27. Add Friction to Destructive Actions (Graduated)

Destructive actions (delete, remove, cancel) deserve increasing friction proportional to their severity. This protects users from accidental, irreversible mistakes.

- **Initial friction:** Make the destructive action less prominent (tertiary style, tucked away). Do not colour it red — red increases prominence.
- **Light friction:** Show a confirmation dialog asking the user to confirm the action.
- **Moderate friction:** Show a confirmation dialog with a red warning message explaining the consequences.
- **Heavy friction:** Show a confirmation dialog with a red warning and a required checkbox (e.g., "I confirm I want to delete my account") before enabling the destructive button.

**Do:** Escalate friction with severity: de-emphasise < confirm < warn in red < require checkbox.
**Don't:** Colour destructive actions red at the initial stage — it draws attention to the action you want users to avoid.

---

## 28. Allow Users to Undo Destructive Actions

Even with friction, mistakes happen. Provide an undo or restore option after a destructive action (e.g., a toast message with "Restore message"). This removes a large amount of risk and builds user trust.

**Do:** Offer a time-limited undo/restore option after destructive actions.
**Don't:** Assume confirmation dialogs alone are sufficient protection against accidental deletion.
