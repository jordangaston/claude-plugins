# Practical UI — Chapter 2: Less is More (Distilled Guidelines)

## 1. Remove Unnecessary Information

Every element added to an interface competes with existing elements, increasing cognitive load. Each element must earn its place with a logical reason. Remove repeated elements, cut unneeded words, and reveal less-important information gradually.

- **Do:** Factor out repeated text (e.g., make a shared course name a subheading instead of repeating it in every list item).
- **Don't:** Show redundant or duplicated content that adds no new information.

## 2. Remove Unnecessary Styles

Decorative lines, colours, backgrounds, and animations that carry no meaning increase cognitive load and can mislead users (e.g., colours mistaken for status indicators, underlines mistaken for links). Strip styles that do not convey information.

- **Do:** Use styling purposefully — every colour, icon, or decoration should communicate something.
- **Don't:** Add decorative colours to list items that could be mistaken for meaningful categories, or underline headings that are not links.

## 3. Be Cautious with Style Trends

Trendy visual styles (glassmorphism, neumorphism, etc.) age poorly and often introduce usability and accessibility problems such as poor contrast and unclear visual hierarchy. Minimal, content-focused styles last longer.

- **Do:** Stick with clean, proven styles that highlight quality content.
- **Don't:** Adopt a visual trend that sacrifices contrast, hierarchy, or readability for aesthetics.

## 4. Not All Links Need Underlines

The standard coloured-and-underlined link treatment is safest for plain text links. However, components that already signal interactivity — cards, navigation menus, tabs — do not need it. Removing the conventional treatment from these elements reduces visual noise.

- **Do:** Keep colour + underline for inline text links for accessibility.
- **Don't:** Apply the full link treatment to cards, nav items, or tabs where other visual cues already signal interactivity.

## 5. Tone Down Link Styling to Preserve Visual Hierarchy

When a coloured, underlined text link becomes more prominent than surrounding primary actions or headings, it disrupts the visual hierarchy. In those cases, remove the colour or underline from the link to restore the correct order of importance.

- **Do:** De-emphasise secondary links (e.g., use underline only, no colour) when they compete with primary actions.
- **Don't:** Let a brightly coloured link visually outweigh a primary button or heading.

## 6. Use Progressive Disclosure

Show people only what they need to complete the task at hand. Hide secondary information behind a descriptive link or interaction. This reduces cognitive load and speeds up decision-making, even though it adds an extra click.

- **Do:** Collapse supplementary details behind a clearly labelled "show more" link or a checkbox that reveals optional fields.
- **Don't:** Dump all information on screen at once, or hide details behind vague, unlabelled triggers.

## 7. Don't Confuse Minimalism with Simplicity

A minimal interface has fewer elements but is not necessarily simple to use. Removing or hiding too much — labels, selected-state indicators, important actions — creates ambiguity. Simplification is about clarity, not just reduction.

- **Do:** Ensure every element is labelled, selected states are obvious, key actions are visible, and contrast is sufficient.
- **Don't:** Strip labels, hide critical actions, or reduce contrast just to achieve a cleaner look.

## 8. Make Important Content and Actions Visible

Users do not use what they cannot see. Hiding key actions behind menus is convenient but risky. If space allows, keep important content and actions visible when users need them.

- **Do:** Show primary actions (e.g., share, bookmark) directly in the UI when space permits.
- **Don't:** Bury frequently needed actions inside a hamburger or overflow menu if there is room to display them.

## 9. Make Hidden Content Discoverable

When space constraints force you to hide content (e.g., a horizontal scrolling list), provide visual cues so users know the content exists. Expose the edge of off-screen cards or add scroll indicators.

- **Do:** Let the edge of the next card peek into view so users know they can scroll.
- **Don't:** Clip off-screen content completely, leaving no hint that more items exist.

## 10. Design for the Smallest Screen First

Starting on the smallest screen forces you to prioritise essential elements and cut unnecessary ones. This discipline carries over to larger screens. Starting on a large screen tempts you to fill space with low-value content that increases cognitive load.

- **Do:** Design mobile-first, then expand to larger breakpoints.
- **Don't:** Design desktop-first and then try to cram everything into a mobile layout.

## 11. Reduce Choices to Speed Up Decisions (Hick's Law)

Decision time grows with the number and complexity of options. Present fewer, simpler choices so users decide faster. Four strategies follow.

### 11a. Remove Choices

Every option should earn its place. If a form field, menu item, or setting is not necessary, it is a distraction. Removing it makes the task faster and increases completion rates.

- **Do:** Strip a subscription form down to only the essential field (e.g., email only).
- **Don't:** Ask for first name, company name, and other optional fields when they are not needed.

### 11b. Group or Categorise Choices

Choosing from a small number of categories is faster than scanning a flat list of many items. Group related options together.

- **Do:** Break a long list of articles into labelled categories (e.g., Interiors, Architecture, Gardens).
- **Don't:** Present 185 items in a single undifferentiated list.

### 11c. Break Choices into Multiple Steps

Large, complex tasks feel less overwhelming when split into smaller sequential steps. Each step lets users focus on one decision at a time.

- **Do:** Split long forms into a multi-step wizard; nest deep navigation into multiple levels.
- **Don't:** Present dozens of fields or options on a single screen.

### 11d. Recommend Choices

When certain options are popular or commonly selected, surface them as recommendations. This helps undecided users move forward faster.

- **Do:** Show suggested search terms, highlight popular plans, or feature trending content.
- **Don't:** Present all options with equal weight when data shows clear user preferences.
