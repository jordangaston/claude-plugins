# Refactoring UI — Chapter 1: Starting from Scratch — Distilled Guidelines

## 1. Start With a Feature, Not a Layout

An app is really a collection of features, so designing the "shell" first (top nav vs. sidebar, logo placement, container vs. full-width) leaves you stuck — you don't yet have the information those decisions depend on. Design an actual piece of functionality first, and the layout questions answer themselves later. This is why starting with the navigation bar is a mistake.

- **Do:** Begin with a concrete feature (e.g., for a flight booking service, "searching for a flight" — departure city, destination city, departure date, return date, and a search button).
- **Don't:** Start by "designing the app" as a shell of navigation, containers, and logo placement.

---

## 2. Defer Low-Level Detail

In the earliest stages of a new feature, low-level decisions about typefaces, shadows, and icons don't matter yet — obsessing over them slows you down. That polish will matter eventually, just not now. Keeping fidelity low keeps you focused on structure.

- **Do:** Rough out the feature's structure first and leave typefaces, shadows, and icons for later.
- **Don't:** Get hung up on typefaces, shadows, or icons while first exploring a feature.

---

## 3. Force Low Fidelity With a Thick Marker

If you can't resist details in a high-fidelity tool like the browser or a design app, switch tools to make details impossible. Jason Fried of Basecamp designs on paper with a thick Sharpie precisely because you can't fuss over tiny details with it. This lets you explore many layout ideas quickly.

- **Do:** Sketch on paper with a thick Sharpie to explore many layout ideas fast.
- **Don't:** Fight the temptation to obsess over details inside a high-fidelity environment — change the medium instead.

---

## 4. Design in Grayscale First — Hold the Color

Even when refining an idea in higher fidelity, resist introducing color right away. Working in grayscale forces spacing, contrast, and size to carry the hierarchy. The result is a clearer interface with strong hierarchy that's easy to enhance with color later.

- **Do:** Design in grayscale so spacing, contrast, and size do the heavy lifting; add color afterward.
- **Don't:** Introduce color at the start of refinement.

---

## 5. Don't Over-Invest in Disposable Artifacts

The whole point of low-fidelity work is speed, so you can start building the real thing sooner. Sketches, wireframes, and static mockups are disposable — users can't do anything with them. Use them to explore, then leave them behind.

- **Do:** Treat sketches and wireframes as disposable exploration and move to the real thing quickly.
- **Don't:** Polish or over-invest in static mockups that users can't actually use.

---

## 6. Don't Design Every Feature Up Front

You don't need to design every feature before implementation — it's better if you don't. Figuring out how every feature interacts and how every edge case looks (2000 contacts, where an error message goes, two overlapping calendar events) is really hard in the abstract, using only a design tool and your imagination. Trying to solve all of it up front just sets you up for frustration.

- **Do:** Design a simple version of the next feature, then build it.
- **Don't:** Try to resolve every feature and edge case in advance using only a design tool and imagination.

---

## 7. Work in Short Cycles, Then Build the Real Thing

Instead of designing everything up front, work in short cycles: design a simple version of the next feature, then make it real. You'll hit unexpected complexity — that's the point, because it's far easier to fix design problems in an interface you can actually use than to imagine every edge case in advance. Iterate on the working design until no problems remain, then return to design mode for the next feature.

- **Do:** Design simple → build it → iterate on the working design until it's solved → move to the next feature.
- **Don't:** Stay in the abstract; build the real thing as early as possible so your imagination isn't doing all the heavy lifting.

---

## 8. Be a Pessimist — Ship the Smallest Useful Version

Don't imply functionality in your designs that you aren't ready to build. A comment system that includes an attachments section you can't finish leaves you with nothing to ship — yet a comment system with no attachments would have been better than none at all. Expect new features to be hard to build, and designing the smallest useful version reduces that risk considerably.

- **Do:** Design the smallest useful, shippable version first so you always have something to fall back on; design "nice-to-have" parts later.
- **Don't:** Bake in functionality you aren't ready to build, blocking the whole feature from shipping.

---

## 9. Choose a Personality Deliberately

Every design has a personality — a banking site aims for secure and professional, a trendy startup for fun and playful. Though it sounds abstract, personality is driven by a few concrete factors: font, color, border radius, and language. Decide the feeling you want, then set those factors to match.

- **Do:** Pick the personality you want and drive it through concrete choices — font, color, border radius, and language.
- **Don't:** Treat personality as vague or handwavy and leave it to chance.

---

## 10. Set Personality Through Font Choice

Typography plays a huge part in how a design feels. A serif reads elegant or classic, a rounded sans serif reads playful, and a neutral sans serif reads plainer — useful when you want other elements to provide the personality.

- **Do:** Match the typeface to the target feel — serif for elegant/classic, rounded sans for playful, neutral sans for plain.
- **Don't:** Pick a typeface without considering the personality it signals.

---

## 11. Set Personality Through Color

You don't need color psychology theory — pay attention to how colors feel to you. Blue is safe and familiar (nobody complains about blue), gold can say "expensive" and "sophisticated," and pink feels more fun and less serious. Thinking about the feeling helps you understand why a color fits, even though a lot of it is just what looks good to you.

- **Do:** Choose colors by the feeling they convey (e.g., blue = safe/familiar, gold = expensive/sophisticated, pink = fun) and what looks good to you.
- **Don't:** Try to choose colors from psychology alone as if it were an exact science.

---

## 12. Set Personality Through Border Radius — and Stay Consistent

How much you round corners has a big impact on feel: a small radius is neutral, a large radius feels playful, and no radius at all feels serious or formal. Whatever you pick, stay consistent — mixing square and rounded corners in the same interface almost always looks worse than committing to one.

- **Do:** Choose a radius that matches the personality (small = neutral, large = playful, none = formal) and apply it consistently.
- **Don't:** Mix square and rounded corners in the same interface.

---

## 13. Set Personality Through Language

The words in an interface have a massive influence on personality, even though it isn't a visual technique. A less personal tone feels official or professional; friendlier, more casual language makes a site feel friendlier. Words are everywhere in a UI, so choosing the right ones is at least as important as choosing the right color or typeface.

- **Do:** Match your interface copy's tone to the personality — formal for professional, casual for friendly.
- **Don't:** Treat wording as an afterthought relative to color and typeface.

---

## 14. Borrow Direction From Your Audience, Not Competitors

When you don't have a gut feeling for the personality, look at other sites the people you want to reach already use. If those are "serious business," lean that way; if they're playful with some humor, take that direction. But don't borrow too much from direct competitors or you'll look like a second-rate version of them.

- **Do:** Study the sites your target audience uses to decide your personality's direction.
- **Don't:** Copy direct competitors so closely that you look like a knockoff.

---

## 15. Limit Your Choices — Constraints Beat Infinite Options

Millions of colors and thousands of fonts sound nice but are a paralyzing curse; you can agonize over any minor decision (12px vs. 13px, 10% vs. 15% shadow opacity, medium vs. semibold weight, 18px vs. 20px margin). Without constraints, decision-making is torture because there's always more than one right choice — several button background colors can be effectively indistinguishable. Constraining your options makes confident decisions possible.

- **Do:** Constrain yourself to a small, predefined set of options so decisions are easy.
- **Don't:** Design from a limitless pool of values and agonize over interchangeable choices.

---

## 16. Define Systems in Advance

Rather than hand-picking from a limitless pool each time, start from a smaller set defined ahead of time. Don't reach for the color picker for every new blue — choose from 8–10 pre-picked shades. Don't nudge font size one pixel at a time — define a restrictive type scale up front and pick from it. It's more work up front, but you only do the hard picking once, saving enormous decision fatigue later.

- **Do:** Predefine constrained systems — e.g., a palette of 8–10 shades per color and a restrictive type scale — and choose from them.
- **Don't:** Reach for the color picker or tweak font size one pixel at a time on every decision.

---

## 17. Design by Process of Elimination

With a constrained set, decision-making gets easy because there are far fewer right choices. To pick an icon size from a scale like 12/16/24/32px, guess the best (say 16px), then compare the values on either side (12px and 24px). Usually two options are obviously bad; if the outer two lose, the middle is your answer — if an outer option wins, re-center on it and compare again.

- **Do:** Guess a value, compare it against its neighbors in the scale, and eliminate the obviously worse options.
- **Don't:** Fine-tune from an unlimited range when a constrained scale lets you decide by comparison.

---

## 18. Systematize Everything

The more systems you have, the faster you work and the less you second-guess. Build systems for font size, font weight, line height, color, margin, padding, width, height, box shadows, border radius, border width, and opacity — anything where you feel like you're laboring over a low-level decision. You don't have to define it all up front; just design with a system-focused mindset, introduce new systems as decisions arise, and never make the same minor decision twice.

- **Do:** Approach design with a system-focused mindset, adding systems (font weight, line height, spacing, shadows, opacity, etc.) as new decisions come up.
- **Don't:** Make the same minor low-level decision twice.
