# Refactoring UI — Chapter 6: Creating Depth — Distilled Guidelines

## 1. Emulate a Light Source From Above

Depth in an interface comes from mimicking how real light hits a shape, and the one rule that governs it is that light comes from above. Because of this, edges angled toward the sky are lighter and edges angled away are darker — and our brains read those cues as raised or inset. Figure out the profile you want an element to have, then simulate how an overhead light would interact with it.

- **Do:** Decide whether an element should read as raised or inset first, then apply light and shadow consistent with a single overhead light source.
- **Don't:** Light elements from arbitrary directions or mix inconsistent light directions across the same interface.

---

## 2. Give Raised Elements a Light Top Edge and a Shadow Below

A raised element with flat top and bottom edges can only reveal one of those edges at a time, and since people look slightly downward at their screens, you reveal a little of the top edge. Make that top edge slightly lighter than the face of the element — using a top border or an inset box shadow with a slight vertical offset — because it faces upward toward the light. Then account for the element blocking light from the area below it.

- **Do:** Add a light top edge plus a small dark box shadow with a slight vertical offset that appears only below the element.
- **Don't:** Overlay a semi-transparent white for the light edge — it sucks saturation out of the underlying color; hand-pick a lighter color instead.

---

## 3. Give Inset Elements a Dark Top Shadow and a Light Bottom Edge

An inset or "well" element reverses the raised treatment because the geometry is flipped. Looking slightly downward, only the bottom lip is visible, and since it faces the sky you give it a slightly lighter color with a bottom border or inset shadow with a negative vertical offset. The lip above the well blocks light from the top, so a dark inset shadow there completes the recessed look.

- **Do:** Add a dark inset box shadow with a slight positive vertical offset at the top and a light bottom edge; use this for text inputs and checkboxes too.
- **Don't:** Let the top shadow poke through at the bottom, and don't skip the dark top shadow — without it the element won't read as recessed.

---

## 4. Keep Shadows Sharp and Subtle — Don't Get Carried Away

The small shadows that create raised and inset effects should have pretty sharp edges, like the shadow cast by the bottom of a wall outlet or window frame. A couple of pixels of blur is plenty; large blur radii undermine the effect. Borrowing real-world light cues adds depth, but chasing photo-realism produces busy, unclear interfaces.

- **Do:** Keep effect shadows tight (a couple pixels of blur) and use light cues sparingly to add just a bit of depth.
- **Don't:** Tinker endlessly toward photo-realism or pile on effects until the interface becomes busy and unclear.

---

## 5. Use Shadow Size to Convey Elevation on a Z-Axis

Shadows position elements on a virtual z-axis and create a meaningful sense of depth, not just a flashy effect. Small shadows with a tight blur radius make an element feel only slightly raised off the background, while larger shadows with a higher blur radius make it feel much closer to the user. The closer something feels, the more it attracts focus.

- **Do:** Use small shadows for buttons, medium shadows for dropdowns, and large shadows for modal dialogs where you want to capture attention.
- **Don't:** Give a low-priority element a large shadow — it will pull focus and dominate the page.

---

## 6. Define a Consistent Elevation System

Just like color, typography, spacing, and sizing, a fixed set of shadows speeds up your workflow and keeps designs consistent. You don't need many — five options is usually plenty. Define the smallest and largest shadows first, then fill in the middle with shadows that increase in size fairly linearly.

- **Do:** Establish a small set of about five reusable shadow steps that scale roughly linearly between your smallest and largest shadow.
- **Don't:** Invent one-off shadow values per element, producing an inconsistent, sprawling set of elevations.

---

## 7. Use Shadows as Interaction Cues

Shadows position elements statically, but they also give visual feedback as users interact. Adding a shadow to a draggable list item when clicked makes it pop forward above the others and signals it can be dragged. A button can feel pressed into the page by switching to a smaller shadow or removing it entirely on click.

- **Do:** Think about where you want the element to sit on the z-axis during interaction, then assign a shadow accordingly — raise a dragged item, lower a pressed button.
- **Don't:** Fiddle with shadow values in the abstract; don't leave interactive elements without any elevation feedback.

---

## 8. Build Realistic Shadows From Two Parts

A really nice shadow is often two shadows, each doing a specific job rather than random experimentation. The first is larger and softer, with a considerable vertical offset and large blur radius, simulating the shadow cast behind an object by a direct light source. The second is tighter and darker, with less vertical offset and a smaller blur radius, simulating the shadowed area underneath an object where even ambient light struggles to reach.

- **Do:** Layer a large soft ambient shadow with a tighter, darker contact shadow so the larger shadow stays subtle while the edges stay defined.
- **Don't:** Rely on a single shadow when you need both a subtle spread and well-defined edges — one shadow can't do both well.

---

## 9. Fade the Contact Shadow as Elevation Increases

As an object moves further from a surface, the small dark shadow created by a lack of ambient light slowly disappears — try it with something on your desk. So when using the two-shadow technique, make that tight dark shadow more subtle for higher elevations. It should be quite distinct at your lowest elevation and almost or completely invisible at your highest.

- **Do:** Scale down the tight contact shadow as elevation rises, keeping it distinct for low elevations and nearly invisible for the highest.
- **Don't:** Keep the same strong contact shadow at every elevation — it breaks the illusion for elements meant to float high above the surface.

---

## 10. Create Depth in Flat Designs With Color

Flat design means designing without shadows, gradients, or other light-mimicking effects, but the most effective flat designs still convey depth through other means. With shades of the same color, lighter objects feel closer and darker objects feel further away. Make an element lighter than the background to feel raised, or darker than the background to feel inset like a well.

- **Do:** Use lighter-than-background fills for raised elements and darker-than-background fills for inset elements; this applies to non-flat designs too.
- **Don't:** Assume flat design must be depth-less — color is another tool for conveying distance.

---

## 11. Use Solid Shadows to Keep a Flat Aesthetic

Another way to communicate depth in a flat design is a short, vertically offset shadow with no blur radius at all. This makes a card or button stand off the page a little without sacrificing the flat look. It reads as a deliberate stylistic choice rather than a realistic light simulation.

- **Do:** Apply short, vertically offset, blur-free solid shadows to lift cards or buttons within a flat aesthetic.
- **Don't:** Add soft blurred shadows to a flat design — it undercuts the flat style you're trying to preserve.

---

## 12. Overlap Elements to Create Layers

One of the most effective ways to create depth is overlapping elements so a design feels like it has multiple layers. Instead of containing a card entirely within another element, offset it so it crosses the transition between two backgrounds, or make an element taller than its parent so it overlaps on both sides. This works for small components like carousel controls as well as large ones.

- **Do:** Offset cards, images, and controls so they cross boundaries between backgrounds or extend past their parent's edges.
- **Don't:** Overlap images without care — give overlapping images an "invisible border" matching the background color so there's always a gap and they don't clash.
