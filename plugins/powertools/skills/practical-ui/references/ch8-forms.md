# Practical UI -- Chapter 8: Forms (Distilled Guidelines)

## 1. Stack forms in a single-column layout

A single column maintains consistent downward momentum, reduces cognitive load, and prevents users from missing fields. Multi-column layouts force the eye to zigzag, slow completion, and create problems for screen-magnifier users.

- **Do:** Arrange all fields in one vertical column.
- **Don't:** Place unrelated fields side by side to save space.

Exception: short, closely related fields (e.g., expiry date and CVC) may sit side by side when they fit within the single-column width.

---

## 2. Stack labels on top of inputs

Labels placed to the left of fields create an inconsistent gap and a zigzag reading pattern that increases interaction cost. Left-aligned labels also cause a jagged left edge; right-aligned labels are hard to scan.

- **Do:** Place labels directly above their inputs so the eye captures both in one fixation.
- **Don't:** Place labels to the left of fields.

---

## 3. Stack checkboxes and radio buttons vertically

Vertical stacking keeps options clearly separated, prevents accidental mis-selection, and maintains downward momentum.

- **Do:** List checkboxes and radio buttons in a vertical stack.
- **Don't:** Lay them out horizontally, where options can blur together.

---

## 4. Place short related fields side by side to reduce form height

When a single-column form grows too tall, short related fields (e.g., expiry date + CVC) can share a row without triggering the problems of a full multi-column layout.

- **Do:** Pair small, logically related fields on one line.
- **Don't:** Force unrelated or wide fields onto the same row.

---

## 5. Break long forms into multiple steps

Long forms overwhelm users. Splitting them into smaller steps reduces cognitive load, cuts errors, and raises completion rates.

- **Do:** Group related questions into steps; show progress; order questions easiest-to-hardest; let users review before submitting.
- **Don't:** Show 30+ questions on a single page, or split every question into its own step (aim for ~5 questions per step).

---

## 6. Minimise the number of form fields

Every extra field increases abandonment risk, completion time, and error rate. Only ask for information essential to providing the product or service.

- **Do:** Remove every field that is not strictly necessary.
- **Don't:** Add "nice to have" fields that inflate the form.

---

## 7. Mark optional fields with the word "optional"

Labelling optional fields tells users they can skip them, reducing uncertainty and speeding completion.

- **Do:** Append "(optional)" to the label of any non-required field.
- **Don't:** Leave optional fields unmarked and hope users will guess.

---

## 8. Replace optional fields with opt-ins (progressive disclosure)

Optional fields add clutter for everyone. Instead, use a checkbox to ask whether the user wants a feature; reveal the field only if they say yes.

- **Do:** Show a checkbox ("Receive updates via text message") and reveal the phone field only when checked.
- **Don't:** Display an optional phone number field to every user by default.

---

## 9. Mark both required and optional fields

Marking only one category forces users to infer the other. Marking both eliminates guesswork, which is especially important for users with cognitive disabilities.

- **Do:** Use an asterisk (*) or the word "required" on required fields AND "(optional)" on optional fields.
- **Don't:** Rely solely on a top-of-form instruction like "All fields are required unless marked optional" -- users skip instructions.

---

## 10. Prefer an asterisk (*) for required fields

The asterisk is concise, widely understood, and lets users quickly scan the form to gauge effort.

- **Do:** Mark required fields with * and include a legend ("Required fields are marked with an asterisk *").
- **Don't:** Colour the asterisk red -- red signals an error.

---

## 11. Use the word "required" for maximum clarity

If any risk of confusion remains, spell out "(required)" on each required field. This removes the need for a legend altogether.

- **Do:** Use "(required)" when your audience may not understand the asterisk convention.
- **Don't:** Assume every user knows what * means.

---

## 12. Know when you can skip marking required fields

For very short, familiar forms (login, single-field subscribe) or single-question-per-screen flows, required markers add noise without value.

- **Do:** Omit required markers on login forms, simple subscribe forms, or single-question screens -- but only after validating with usability testing.
- **Don't:** Omit markers on long or complex forms.

---

## 13. Match field width to the intended input

Field width signals expected input length. A wide field for a 4-digit postcode confuses users; a narrow field for a full address frustrates them.

- **Do:** Size the field to fit the expected content (e.g., 4-character width for a 4-digit postcode).
- **Don't:** Set all fields to the same full width for visual tidiness.

---

## 14. Stick with conventional form field styles

Unconventional field designs break users' mental models (Jakob's Law), making it unclear where to type or what a control does.

- **Do:** Use recognisable borders, input areas, radio-button circles, and checkbox squares.
- **Don't:** Remove iconic elements (e.g., the radio button circle) for the sake of aesthetics -- keep them so behaviour is obvious.

---

## 15. Display hints above form fields

Hint text placed below fields can be covered by autofill menus or on-screen keyboards. Placing hints above the field lets users read instructions before they start typing, preventing errors and maintaining downward flow.

- **Do:** Put helper text between the label and the input.
- **Don't:** Hide hints in tooltips or place them below the field.

---

## 16. Never use placeholder text as a label

Placeholder text disappears on input, can look pre-filled (causing users to skip the field), and almost always fails contrast requirements.

- **Do:** Use a visible label above the field. Avoid placeholder text in most cases.
- **Don't:** Replace labels with placeholder text to save space.

Exception: single search fields may use placeholder text if the contrast ratio is at least 4.5:1 and an accessible label is provided for screen readers.

---

## 17. Avoid unnecessary instructional verbs in labels

Phrases like "Enter email here" or "Type your email" add words without information -- the input field already implies typing.

- **Do:** Label the field "Email."
- **Don't:** Label it "Enter your email here."

---

## 18. Keep labels close to their fields

When the gap between a label and its input is large, it is unclear which label belongs to which field, and the eye must refocus separately on each.

- **Do:** Space a label tightly to its own field and add more space before the next label-field pair.
- **Don't:** Use equal spacing above and below every element.

---

## 19. Prefer radio buttons over dropdowns (for ~10 options or fewer)

Dropdowns hide options, require multiple precise clicks, and are hard for users with motor impairments. Radio buttons are always visible, scannable, and need only one click.

- **Do:** Show radio buttons when you have roughly 10 or fewer options.
- **Don't:** Default to a dropdown just because it is compact.

---

## 20. Use autocomplete instead of long dropdowns

Scrolling through a long dropdown (e.g., country list) is slow and error-prone. An autocomplete search lets users type a few characters and jump to the right option.

- **Do:** Provide a predictive-search input; limit suggestions to ~10; bold the differentiating text.
- **Don't:** Force users to scroll a 200-item dropdown.

---

## 21. Break long dropdowns into multiple fields

When users are unfamiliar with options and need to browse, one massive dropdown overwhelms them. Splitting it into cascading fields (e.g., "Industry" then "Occupation") narrows choices at each step.

- **Do:** Split a long list into two or more related, shorter dropdowns.
- **Don't:** Dump hundreds of unfamiliar options into a single dropdown.

---

## 22. Use steppers for small numeric adjustments

A stepper (plus/minus buttons flanking a number) cuts interaction cost compared to a dropdown for small numeric values.

- **Do:** Use steppers when the numeric range is small. Place buttons horizontally; use +/- icons; ensure a minimum 48pt x 48pt target area.
- **Don't:** Use steppers for large numeric ranges (high interaction cost). Don't use tiny buttons or up/down arrows that look like accordion chevrons.

---

## 23. Use a checkbox for binary options that require a submit action

A single checkbox is simpler than two radio buttons or a dropdown for an on/off choice that only takes effect when the form is submitted.

- **Do:** Use a checkbox with a label describing what happens when it is checked.
- **Don't:** Use a toggle switch when a separate submit button is required.

---

## 24. Use a toggle switch for binary options that take immediate effect

Toggle switches signal instant action. They are appropriate when no submit step exists.

- **Do:** Use a toggle when flipping it immediately changes the interface (e.g., switching between monthly and annual pricing).
- **Don't:** Use a toggle when changes only apply after a form submission.

---

## 25. Use positive phrasing for checkbox labels

Negative phrasing ("Don't allow automatic updates") creates a confusing double negative when the box is checked.

- **Do:** Phrase the label as what happens when selected ("Allow automatic updates"). Test by prepending "Yes," -- the sentence should make sense.
- **Don't:** Use negations in checkbox labels.

---

## 26. Group related fields under headings

When you cannot split a form into steps, group related fields beneath descriptive headings. This reduces visual overwhelm and helps users understand the form's structure.

- **Do:** Add section headings (e.g., "Postal address," "Contact details") above related clusters of fields.
- **Don't:** Present a flat list of unrelated fields with no grouping.

---

## 27. Ensure form field borders have at least 3:1 contrast

Low-contrast borders make fields invisible in bright light or to users with low vision. Borders are the visual cue that distinguishes interactive fields from static content.

- **Do:** Maintain a minimum 3:1 contrast ratio on borders of all interactive elements (inputs, buttons, toggles, checkboxes, radio buttons, steppers).
- **Don't:** Use pale or thin borders for aesthetic minimalism at the expense of visibility.

---

## 28. Choose the right form validation approach

Three approaches exist, each with trade-offs:

### a. Validate on submit
Simplest to build. Show a summary of errors at the top (as links to each invalid field) plus inline error messages above each invalid field. Use a red border, background tint, and an icon (never colour alone).

- **Do:** List all errors at the top with anchor links; highlight fields with red border + icon.
- **Don't:** Disable the submit button -- disabled buttons are problematic.

### b. Validate after the user leaves a field (on blur / inline)
Gives immediate, contextual feedback. Clear the error as soon as the user fixes it (which requires real-time validation).

- **Do:** Show the error right after the user tabs or clicks away from the field.
- **Don't:** Use this for grouped inputs like checkbox lists, where "leaving the field" is ambiguous.

### c. Validate instantly as the user types
Best for guiding users toward a correct answer (e.g., password-strength meters, username availability). Add a debounce delay to avoid premature errors.

- **Do:** Use for fields with specific criteria the user must satisfy in real time.
- **Don't:** Fire errors on every keystroke -- introduce a typing delay.

---

## 29. Display error messages above invalid fields

The space below a field can be occluded by autofill dropdowns or on-screen keyboards. Placing errors above the field keeps them visible.

- **Do:** Show inline errors between the label/hint and the input.
- **Don't:** Place error text below the input.

---

## 30. Never rely on colour alone to indicate errors

Colour-blind users may not perceive red highlights. Always pair colour with an icon or text label.

- **Do:** Combine a red border/background with an error icon and descriptive text.
- **Don't:** Use only a red border or red text to signal an error.

---

## 31. Don't disable the submit button

Disabled buttons give no feedback about what is wrong, frustrate users, and are hard to see due to low contrast.

- **Do:** Keep the submit button enabled and validate on click.
- **Don't:** Grey out the submit button until all fields are valid.

---

## 32. Show progress in multi-step forms

Progress indicators motivate users to finish (Goal-Gradient Effect) and set expectations about remaining effort.

- **Do:** Display a step indicator (e.g., "Step 2 of 3") and let users review answers before final submission.
- **Don't:** Hide the number of steps or leave users guessing how much is left.

---

## 33. Order questions from easiest to hardest

Starting with easy questions gives users early wins and builds momentum, making them more likely to complete harder questions later.

- **Do:** Front-load simple, familiar fields (name, email) before complex ones (tax ID, upload documents).
- **Don't:** Lead with the hardest or most sensitive question.

---

## 34. Let users know what they need before they start

Telling users upfront how long the form takes and what documents or information they will need prevents mid-form abandonment.

- **Do:** Add a brief intro: estimated time, required documents, number of steps.
- **Don't:** Surprise users with unexpected requirements halfway through.

---

## 35. Display a success message after submission

After a form is submitted, confirm success and tell users what happens next (e.g., "You'll receive a confirmation email shortly").

- **Do:** Show a clear confirmation screen with next-step information.
- **Don't:** Leave users wondering whether submission worked.
