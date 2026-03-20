# Practical UI -- Chapter 1: Fundamentals (Distilled Guidelines)

## 1. Minimise Usability Risks

Design decisions should be evaluated through the lens of risk -- the risk that someone will have difficulty using the interface. Cater to the widest possible range of users, including those with poor eyesight, low computer literacy, reduced dexterity, and cognitive impairments.

- **Do:** Proactively identify anything vague, confusing, or unclear and simplify it before investing in usability testing.
- **Don't:** Assume your users are all young, tech-savvy, and fully able-bodied.

## 2. Ensure Sufficient Text Contrast

Thin, light-grey text may look sleek, but it risks being unreadable for users with low vision or in bright-light conditions.

- **Do:** Meet at least WCAG 2.1 AA contrast ratios (4.5:1 for body text).
- **Don't:** Use low-contrast text for aesthetic reasons.

## 3. Always Label Icons

Icons without labels can look clean, but many users -- especially those with cognitive or vision impairments -- may not understand what they mean.

- **Do:** Pair every icon with a visible text label.
- **Don't:** Rely on icons alone to communicate meaning.

## 4. Don't Style Non-Interactive Text Like Links

Adding colour to headings or body text risks users mistaking it for a clickable link.

- **Do:** Reserve your brand/link colour for interactive elements only.
- **Don't:** Apply blue or other link-associated colours to non-interactive text.

## 5. Meet WCAG 2.1 Level AA

Web Content Accessibility Guidelines provide a reliable benchmark for interface accessibility. Level AA is the standard to aim for at minimum, and it is a legal requirement in some jurisdictions.

- **Do:** Audit your designs against WCAG 2.1 AA requirements.
- **Don't:** Treat accessibility as an afterthought or optional polish.

## 6. Have a Logical Reason for Every Design Detail

Every detail in a well-designed interface should have an articulated rationale that improves usability. Objective logic beats subjective opinion and makes it easier to defend decisions and give constructive feedback.

- **Do:** Be able to explain *why* each design choice was made.
- **Don't:** Justify decisions with "it looks nice" or "I don't like it."

## 7. Minimise Interaction Cost

Interaction cost is the total physical and mental effort (looking, scrolling, clicking, typing, thinking, remembering) required to complete a task. Lower interaction cost means easier task completion.

- **Do:** Measure and actively reduce the number of clicks, scrolls, and mouse movements a task requires.
- **Don't:** Add unnecessary steps or force users through extra interactions.

## 8. Keep Related Actions Close Together (Fitts's Law)

The closer and larger a target, the faster it is to click or tap. Place actions near the elements they relate to.

- **Do:** Position the "Add to cart" button directly next to the quantity selector; ensure touch targets are at least 48pt by 48pt.
- **Don't:** Scatter related controls far apart across the screen.

## 9. Reduce Distractions

Animated banners, pop-ups, and unnecessary visuals pull attention away from the user's task.

- **Do:** Remove or de-emphasise elements that compete for attention without supporting the core task.
- **Don't:** Add decorative animations or intrusive overlays that interrupt focus.

## 10. Minimise Choice (Hick's Law)

Decision time increases with the number and complexity of choices. Fewer options lead to faster decisions.

- **Do:** Reduce the number of choices presented at once; highlight recommended or popular options.
- **Don't:** Overwhelm users with large lists of equal-weight options.

## 11. Use Steppers Instead of Dropdowns for Small Numeric Changes

A stepper lets users increment or decrement a number with a single press, reducing interaction cost compared to a dropdown that requires click-scroll-click.

- **Do:** Use a stepper for small, bounded numeric inputs like quantity.
- **Don't:** Default to dropdown selectors when a simpler input pattern works.

## 12. Minimise Cognitive Load

Cognitive load is the brainpower required to use an interface. Reducing it frees mental resources for the actual task. Key techniques:

- Remove unnecessary styles, information, and decisions.
- Break information into smaller groups.
- Use conventional design patterns.
- Maintain consistency so similar elements look and behave similarly.
- Create a clear visual hierarchy showing importance.

## 13. Break Complex Forms into Smaller Steps

Large, complex forms overwhelm users. Splitting them into smaller sequential steps reduces cognitive load and makes completion feel achievable.

- **Do:** Use multi-step wizards with clear progress indicators for long forms.
- **Don't:** Present all form fields on a single page when the form is large.

## 14. Create a Design System

A design system of predefined options and guidelines eliminates decision fatigue, speeds up design, and enforces consistency. Build it in three steps: define style tokens, create reusable components, and write usage guidelines.

## 15. Define a Colour Palette with Purpose

Create a small set of predefined colour options where each colour has a defined role (brand, text strong, text weak, stroke strong, stroke weak, fill). Use the brand colour consistently for interactive elements so users learn what is clickable.

- **Do:** Assign one colour to all interactive elements (buttons, text links).
- **Don't:** Pick ad-hoc colours for every new element.

## 16. Define Predefined Typography Options (Type Scale)

Create a limited set of font size, line-height, and weight combinations and reuse them everywhere. This enforces hierarchy and consistency without per-element deliberation.

- **Do:** Use a type scale (e.g., ratio 1.200) to generate heading and body sizes.
- **Don't:** Pick arbitrary font sizes for each piece of text.

## 17. Set a Line Height of at Least 1.5 for Body Text

Adequate line height improves readability, especially for longer paragraphs and for users with reading difficulties.

## 18. Define Predefined Spacing Options

Create a limited set of spacing values (e.g., 8pt, 16pt, 24pt, 32pt, 48pt, 80pt) and use only those throughout the interface. Consistent spacing produces a neater design and speeds up both design and development.

- **Do:** Pick spacing from a predefined scale.
- **Don't:** Nudge elements pixel-by-pixel until they "feel right."

## 19. Define Shadow and Border-Radius Options

Standardise shadow styles (raised, overlay) and border-radius values (small 8pt, medium 16pt, large 32pt) to keep visual treatments consistent without ad-hoc decisions.

## 20. Build Interfaces with Modular Components

Start with small building blocks (buttons, avatars, inputs), combine them into larger components, and arrange components into page templates. Store everything in a component library for reuse.

- **Do:** Design from small to large -- atomic components first, then compositions.
- **Don't:** Build one-off layouts that can't be reused.

## 21. Write Usage Guidelines for Your Design System

Components and tokens alone are not enough. Without clear rules for how and when to use them, a team will produce inconsistent designs. Document rules such as: use sentence case, left-align buttons, left-align text, front-load text, use plain language, indicate interactive elements with the brand colour.

## 22. Underline Text Links for Colour-Blind Users

Colour alone is not enough to distinguish links from surrounding text. Underlines provide a non-colour cue that the text is interactive.

- **Do:** Underline text links and colour them blue (or your brand colour).
- **Don't:** Rely solely on colour to indicate interactivity.

## 23. Ensure Sufficient Border Contrast on Form Fields

Form field borders must have enough contrast against the background for users with low vision to perceive them. Comply with WCAG 2.1 AA non-text contrast requirements.

- **Do:** Use clearly visible borders on inputs.
- **Don't:** Use very light or barely visible field borders for a "minimal" look.

## 24. Accessibility Benefits Everyone

Accessible design is not just for people with permanent disabilities. Temporary injuries, bright sunlight, and one-handed phone use are all situations where accessible design helps the general population. Good accessibility equals great usability.

## 25. Design for Screen Readers

Screen readers describe interface elements through speech or braille. Ensure headings and links are descriptive so they make sense when read out of context. (Implementation is largely in code, but design choices like descriptive labels and logical reading order directly affect screen-reader usability.)

- **Do:** Write descriptive, self-contained headings and link text.
- **Don't:** Use vague labels like "Click here" or "Read more."

## 26. Design for Screen Magnifiers

Users with screen magnifiers see only a small portion of the interface at a time. Keep related elements close together and left-align important actions so they are not missed.

- **Do:** Left-align buttons and key content so magnifier users find them without panning.
- **Don't:** Place critical actions far to the right or scattered across wide layouts.

## 27. Use Common Design Patterns (Jakob's Law)

Stick with conventional, well-established UI patterns people already understand. Leveraging existing mental models reduces cognitive load, interaction cost, and usability errors.

- **Do:** Use standard form fields, accordions, dropdowns, and navigation patterns.
- **Don't:** Invent novel interaction patterns for routine UI elements.

## 28. Use Conventional Form Field Styles

Unconventional form field designs introduce unnecessary usability risk. Standard bordered rectangles with top-aligned labels are what users expect.

- **Do:** Use recognisable form elements -- rectangles with visible borders and clear labels.
- **Don't:** Replace standard inputs with custom artistic alternatives.

## 29. Apply the 80/20 Rule (Pareto Principle)

Roughly 80% of users use 20% of features, and 80% of attention is spent on 20% of a page. Invest your effort where it has the largest impact.

- **Do:** Optimise for the tasks most users will perform most often.
- **Don't:** Spend equal effort on edge cases and primary flows.

## 30. Keep Development Costs in Mind

Every design decision has a build cost. Simpler designs are cheaper to develop and often easier to use.

- **Do:** Leverage existing design systems, templates, and icon sets. Talk to developers early. Learn technical constraints.
- **Don't:** Design bespoke components when standard ones serve the same purpose.

## 31. Be Consistent Within Your Product

Similar elements should look and behave the same way throughout your product. Consistency makes interfaces predictable, reduces errors, and lowers cognitive load. Enforce this through a design system.

- **Do:** Apply the same visual and interaction rules to all similar elements (e.g., all icons use the same style -- outlined or filled, not mixed).
- **Don't:** Use filled icons for some features and outlined icons for others without a clear semantic distinction.

## 32. Be Consistent with Other Products

Users bring expectations from other apps and platforms. Follow platform guidelines (iOS, Android) and well-established conventions (underlined links, square checkboxes, rectangular inputs with top labels).

- **Do:** Align with conventions users already know from other products.
- **Don't:** Deviate from platform patterns without strong, tested reasons.

## 33. Clearly Indicate Interaction States

Interactive elements must visually change across their five states: default, hover, press/active, focus, and disabled. State changes signal interactivity and give feedback during use.

- **Do:** Design distinct visual treatments for all five states of every interactive element.
- **Don't:** Leave buttons and links looking the same whether hovered, pressed, or focused.

## 34. Use Consistent Icon Styles

Mixing filled and outlined icon styles creates visual noise and can confuse users (filled icons often imply "selected"). Pick one style and apply it uniformly; keep outline stroke thickness consistent.

- **Do:** Choose one icon style (outlined or filled) and use it throughout.
- **Don't:** Mix icon styles arbitrarily within the same interface.

## 35. Make Touch Targets at Least 48pt Tall

Small tap targets are hard to hit, especially for users with motor impairments or those using a phone one-handed. Buttons and interactive elements should be at least 48pt by 48pt.

- **Do:** Size primary action buttons to at least 48pt in height.
- **Don't:** Use small, hard-to-tap buttons on mobile.

## 36. Place Primary Actions Where They Are Easy to Reach

On mobile, move the primary call-to-action button to the bottom of the screen where thumbs can reach it. Stretch it to full width so both left- and right-handed users can tap it easily.

- **Do:** Pin primary mobile actions to the bottom of the viewport, full-width.
- **Don't:** Place primary mobile buttons at the top or in hard-to-reach corners.

## 37. Left-Align Text and Elements

Left alignment creates a neat, consistent left edge that improves readability and reduces cognitive load. It also helps screen-magnifier users find content without horizontal panning.

- **Do:** Left-align headings, body text, icons, and buttons.
- **Don't:** Centre-align blocks of text or scatter elements across varying alignments without reason.

## 38. Use Spacing to Show Relationships (Proximity)

Spacing within a group of related elements should be smaller than the spacing between groups. This visual proximity signals which elements belong together and which are separate.

- **Do:** Use tighter spacing inside groups and wider spacing between groups.
- **Don't:** Use uniform spacing everywhere, obscuring the relationships between elements.

## 39. Create a Clear Visual Hierarchy

Make more important elements more prominent (larger, higher contrast) and less important elements less prominent. Visual hierarchy guides the eye and helps users find what matters first.

- **Do:** Differentiate headings, body text, and secondary text through size and contrast.
- **Don't:** Give all text the same size and weight.

## 40. Make Headings and Links Descriptive and Scannable

Headings and links should communicate their meaning when read in isolation. This helps users scan pages quickly and enables screen readers to navigate by headings.

- **Do:** Write self-explanatory headings like "Email marketing features" and link text like "Explore templates."
- **Don't:** Use generic headings like "Details" or link text like "Click here."

## 41. Use Predefined Spacing from Your Design System

Apply spacing values exclusively from your predefined spacing scale. This enforces rhythm and consistency across every screen and component.

## 42. Use an Accessible Monochromatic Colour Palette

Base your colour system on variations of the brand colour that all meet accessibility contrast requirements. Define rules governing where each variation is used.

- **Do:** Test every colour combination against WCAG contrast requirements.
- **Don't:** Choose palette colours by eye without verifying contrast ratios.

## 43. Innovate Where It Counts

Save creative experimentation for your product's unique selling point, not for routine UI patterns. Standard UI elements should use proven patterns; innovation should target the experience that differentiates your product.

- **Do:** Focus creative energy on features that define your product's value.
- **Don't:** Reinvent standard patterns like form fields, navigation, or checkboxes.
