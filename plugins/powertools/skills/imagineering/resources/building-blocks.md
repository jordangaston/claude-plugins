# The Imagineering Pyramid — Building Blocks Reference

Full tutorials for the 15 blocks. Each entry gives: the Disney origin, the underlying principle, the
translation to creative/product/experience work, focusing questions to ask the user, and how to
"plus" it. Use the focusing questions to generate concrete moves for the user's *actual* artifact —
never just restate the principle.

The overarching frame is **the Art of the Show**: you are staging an experience for an audience, not
assembling features. Two blocks — Creative Intent and Story — are the controlling foundation;
everything else serves them.

## Table of contents

- Tier 1 — Foundations: Story · Creative Intent · Attention to Detail · Theming · Long/Medium/Close
- Tier 2 — Wayfinding: Wienies · Transitions · Storyboards · Pre-Shows & Post-Shows
- Tier 3 — Visual Communication: Forced Perspective · "Read"-ability · Kinetics
- Tier 4 — Making It Memorable: "It's a Small World" Effect · Hidden Mickeys
- Tier 5 — Walt's Cardinal Rule: Plussing

---

## Tier 1 — Foundations

These are the cornerstones. Get them wrong and nothing above compensates.

### 1. It All Begins with a Story

**Disney origin.** Every land and attraction starts from a story. Walt came from film; he knew the
audience experiences a place the way they experience a movie — as narrative. Pirates of the Caribbean
isn't a boat ride, it's a story you move through.

**Principle.** Story is the organizing force. Decisions about what to include, in what order, and how
it should feel all flow from the story you're telling.

**Translation.** A product is a journey with an arc. The user arrives in one state and should leave
transformed (more capable, relieved, delighted). Onboarding is Act 1; the "aha" is the turn; mastery
is the resolution. A pitch, a landing page, a feature, a docset — each has a before → after.

**Focusing questions.**
- In one line, what story does the audience live through here?
- What state does the user arrive in, and what state do they leave in?
- If this experience were the trailer for a film, what's the plot?
- What's the emotional arc — where's the tension, where's the payoff?

**Plus it.** Make the transformation explicit and felt, not implied. Name the "before" so the "after"
lands harder.

### 2. Creative Intent

**Disney origin.** Imagineers fix a single creative objective for a project — e.g., "the romance and
adventure of the Caribbean in the golden age of piracy" — and judge every detail against it. If a
prop doesn't serve the intent, it goes.

**Principle.** One sentence of intent acts as the master filter. It prevents the experience from
becoming a pile of individually-nice things that don't add up.

**Translation.** Your north-star objective/feeling for the experience. Not the feature list — the
*point*. Everything (copy, motion, scope, pricing, edge-case handling) is evaluated against it. This
is the single most useful block for builders who over-scope.

**Focusing questions.**
- State the creative intent in one sentence. Now: does each major element serve it?
- What feeling should the audience walk away with?
- What are you willing to *cut* because it doesn't serve the intent?
- Where is the experience currently fighting its own intent?

**Plus it.** Write the intent on the wall (literally, in the spec). Re-derive a contested decision
from it instead of arguing taste.

### 3. Attention to Detail

**Disney origin.** Trash cans themed to the land, door handles that fit the period, smells piped into
Main Street. The small things create belief; one wrong detail breaks the spell.

**Principle.** Craft in the details signals care and sustains immersion. Believability is cumulative
and fragile.

**Translation.** Microcopy, empty states, error messages, loading states, the 60fps of a transition,
the way the 0.1% edge case is handled. These are where users *feel* whether something was made with
care. A single jarring detail (a broken link, a dead-end error) breaks trust disproportionately.

**Focusing questions.**
- Where are the "trash cans" — the unglamorous details that quietly carry the experience?
- What's the worst-handled edge case, empty state, or error right now?
- Which detail, if a user noticed it, would make them think "these people care"?

**Plus it.** Audit the unsexy surfaces (errors, empties, edges) first — that's where care is cheapest
to add and most felt.

### 4. Theming

**Disney origin.** Within a land, *everything* reinforces the theme — architecture, music, costumes,
typography, menu items. Adventureland and Tomorrowland share no detail by accident.

**Principle.** Cohesion. Every element pulls in the same direction; nothing contradicts the story or
intent. Theming is Attention to Detail aimed at consistency.

**Translation.** A coherent voice, visual language, and metaphor across the whole experience. The
copy, UI, naming, onboarding, and even the pricing page should feel like one authored world, not a
committee. Mixed metaphors and inconsistent voice are theming failures.

**Focusing questions.**
- What's the theme — the consistent world/voice everything should reinforce?
- Where does the experience break theme (a screen, a flow, a doc that feels like a different product)?
- Does the metaphor hold all the way through, or does it leak?

**Plus it.** Find the one surface that feels "off-world" and re-theme it to match.

### 5. Long, Medium, and Close Shots

**Disney origin.** Imagineers compose sightlines like a filmmaker — the long shot establishes the
castle from afar, the medium shot frames a building, the close shot reveals a detail. They control
what you see at each distance and lead you from the whole to the particular.

**Principle.** Lead the audience from general to specific. Establish the big picture before the
details so people aren't lost.

**Translation.** Information hierarchy and progressive disclosure. A landing page opens with the
one-line promise (long), then the how (medium), then specifics/proof (close). Docs go overview →
section → step. Features reveal complexity progressively instead of dumping it.

**Focusing questions.**
- What's the long shot — the single thing the audience must grasp first?
- Does the experience establish the whole before the parts, or drop people into detail cold?
- Where is information out of order (close-up before the establishing shot)?

**Plus it.** Cut or defer anything that arrives before its establishing shot.

---

## Tier 2 — Wayfinding

How the audience moves through the experience and stays oriented.

### 6. Wienies

**Disney origin.** Walt's own term (from using a sausage to lead a dog on camera): a visual magnet — 
Cinderella Castle at the end of Main Street, the Tree of Life, Spaceship Earth — that pulls you toward
it and orients you. Parks place wienies to draw guests forward and prevent dead ends.

**Principle.** Give the audience an obvious, attractive landmark that beckons the next step.

**Translation.** The visual hook and the obvious next action: the hero CTA, the one bright element on
a screen, the "start here," the thing that pulls a user deeper into the product. Good wayfinding means
the user never wonders "what now?"

**Focusing questions.**
- On each key screen/page, what's the wienie — the one thing pulling the eye and the next click?
- Is there ever a moment with no clear "what next"? (a dead end)
- Are there competing wienies fighting for attention and canceling out?

**Plus it.** Reduce to one dominant wienie per moment. Kill the competing magnets.

### 7. Transitions

**Disney origin.** Moving between lands is deliberately smooth — planting, berms, music cross-fades,
"no white space" — so you're eased from one world into the next without a jarring cut.

**Principle.** Make changes seamless. Seams are where immersion and confidence leak.

**Translation.** State transitions and handoffs: between onboarding steps, screens, channels
(email → app, web → mobile, voice → text), free → paid, empty → populated. Friction and disorientation
live at the seams.

**Focusing questions.**
- Where are the hard cuts — moments where the user is yanked between contexts?
- What happens at the channel/handoff seams (signup → first use, trial → paid)?
- Is there a jarring empty-to-full or free-to-paid transition that feels like a wall?

**Plus it.** Smooth the single most jarring transition; add the connective tissue (a bridging screen,
a state animation, a "here's what just happened / here's what's next").

### 8. Storyboards

**Disney origin.** Borrowed from animation: the whole attraction is storyboarded shot by shot before
anything is built, so the team sees the entire guest experience as a sequence and catches problems
early.

**Principle.** See the whole journey before building the parts. Big-picture-first prevents locally-
optimal, globally-broken experiences.

**Translation.** Journey maps, flow diagrams, wireframe sequences — laying out every step the user
takes end to end before building any one screen. Catches gaps, redundant steps, and dead ends.

**Focusing questions.**
- Can you lay out the entire journey, step by step, start to finish?
- Where are the gaps or jumps when you see it as a whole sequence?
- Are you optimizing one screen while the overall flow is broken?

**Plus it.** Storyboard the journey end-to-end (the Visualizer is good for this) and look for the step
that shouldn't exist.

### 9. Pre-Shows and Post-Shows

**Disney origin.** The queue and pre-show (the stretching room in Haunted Mansion) set the story and
expectations before the main event; the exit and gift shop extend and reinforce it after.

**Principle.** Frame before, reinforce after. The core moment lands better when primed, and sticks
better when echoed.

**Translation.** Priming before the core action (anticipation, onboarding, the "queue," expectation-
setting) and the after (confirmation, follow-up, retention loop, "exit through the gift shop"). Most
products over-invest in the core and neglect the pre/post that make it land and last.

**Focusing questions.**
- What primes the user *before* the core moment — or do they arrive cold?
- What happens *after* the payoff — is it reinforced, or does the user fall off a cliff?
- Where's the "gift shop" — the deliberate extension of the experience after the main event?

**Plus it.** Add a deliberate pre-show (set the stakes) and a post-show (reinforce the win, invite the
next loop).

---

## Tier 3 — Visual Communication

How the experience reads and feels at the surface.

### 10. Forced Perspective

**Disney origin.** Cinderella Castle and Main Street use forced perspective — upper floors built at
smaller scale — so the castle reads as taller and Main Street as longer than they are. Framing shapes
perceived scale.

**Principle.** How you frame something changes how big, important, simple, or achievable it feels —
independent of its literal size.

**Translation.** Framing and positioning: making an ambitious vision feel attainable, a complex tool
feel simple, a small team feel credible, a price feel like a deal (anchoring). Demos, narratives, and
pricing all use forced perspective. (Use honestly — Disney's castle still delivers; framing should
amplify a real experience, not fake one.)

**Focusing questions.**
- What impression of scale do you want (bigger/grander, or simpler/more approachable)?
- How is the idea currently framed, and does the framing match the intent?
- Where could reframing make the thing feel more achievable or more significant?

**Plus it.** Reframe the one element whose perceived scale is working against you.

### 11. "Read"-ability

**Disney origin.** Guests instantly "read" what a building is and where to go without reading a sign —
a Western saloon reads as a saloon. Visual literacy does the explaining.

**Principle.** The audience should instantly grasp what something is and what to do, with no manual.

**Translation.** Intuitive affordances and self-evident design: a button that looks tappable, a screen
whose purpose is obvious in a glance, a feature that needs no tooltip. The "squint test" — blur it and
can you still tell what it is and what to do?

**Focusing questions.**
- Does each screen/element pass the squint test — instantly legible without explanation?
- Where does the user need a tooltip, doc, or rescue to understand what to do?
- What reads as something it isn't (looks clickable but isn't, or vice versa)?

**Plus it.** Find the least legible moment and redesign it so it explains itself.

### 12. Kinetics

**Disney origin.** Parks are full of motion — ride vehicles, water, fireworks, swaying figures,
crowds. Movement creates life, energy, and the sense that the place is alive.

**Principle.** Motion and energy make an experience feel alive rather than static.

**Translation.** Animation, responsiveness, momentum, and signs of life: micro-interactions, real-time
updates, activity feeds, progress that visibly moves, a UI that responds instantly. Stillness reads as
dead or broken; well-judged motion reads as alive. (Restraint matters — gratuitous motion is noise.)

**Focusing questions.**
- Where could motion make the experience feel alive and responsive?
- Does anything feel dead, frozen, or unresponsive where energy belongs?
- Is there motion that's just noise and should be cut?

**Plus it.** Add life to the one dead-feeling moment; remove motion that distracts from the wienie.

---

## Tier 4 — Making It Memorable

What people carry out and retell.

### 13. The "It's a Small World" Effect

**Disney origin.** "it's a small world" leaves you with one unifying thing — a single song and a
single feeling — that ties the whole ride together and won't leave your head. One coherent idea,
repeated, becomes unforgettable.

**Principle.** A single unifying feeling or signature moment makes an experience memorable and
repeatable; scattered impressions don't stick.

**Translation.** The one through-feeling or signature moment people remember and retell — the emotional
core, the "you have to try the part where…". If you asked a user to describe the experience in one
sentence to a friend, this is what they'd say.

**Focusing questions.**
- What's the one feeling or moment you want people to remember and repeat?
- If a user described this to a friend in one sentence, what would (and should) they say?
- Is there a single unifying idea, or a scatter of unconnected nice-things?

**Plus it.** Identify the signature moment and concentrate effort there; let it be the thing that
gets retold.

### 14. Hidden Mickeys

**Disney origin.** Mickey silhouettes hidden throughout the parks reward guests who look closely and
create an insider's delight — a secret handshake between Imagineers and fans.

**Principle.** Delightful hidden details reward attention, deepen engagement, and build affinity and
word-of-mouth.

**Translation.** Easter eggs and delight details: a witty empty state, a keyboard-shortcut reward for
power users, a surprise-and-delight moment, a clever 404. They aren't core, but they convert users
into fans and give people something to share.

**Focusing questions.**
- Where could a small hidden delight reward the users who look closely?
- What moment is purely functional that could carry a wink?
- What's worth sharing — what would make a user screenshot and send it to someone?

**Plus it.** Add one well-placed delight where engaged users will find it — not so many that they
cheapen.

---

## Tier 5 — Walt's Cardinal Rule

### 15. Plussing

**Disney origin.** Walt's term for relentlessly improving — adding the extra touch, returning to
"finished" work to make it better. "Disneyland will never be completed as long as there's imagination
left in the world." Abandoned ideas get revived and reworked (the Museum of the Weird became the
Haunted Mansion).

**Principle.** Nothing is ever done. Continuous, deliberate improvement is the cardinal rule that sits
above all others.

**Translation.** Post-launch polish, the +1 on everything, treating shipped work as a draft. The
discipline of returning to a "done" experience to find the next plus. This is the block every session
ends on.

**Focusing questions.**
- What are the 3–5 highest-leverage pluses available right now?
- What "finished" part is worth reopening because it could be meaningfully better?
- What's the single thing most worth obsessing over next?

**Plus it (the meta-move).** Rank the available pluses by impact, do the top one, and schedule the
return visit. The experience is never complete.

---

## Worked micro-example (SaaS onboarding)

To show the translation in action — a B2B onboarding flow audited through the pyramid:

- **Creative Intent:** "Get a non-technical user to their first real result in under 5 minutes,
  feeling capable." Every step judged against this.
- **Story:** Arrives skeptical and busy → leaves having produced something real → "this works."
- **Long/Medium/Close:** Open with the one-line promise + a finished example (long shot) before any
  configuration (close shot). Current flow drops users into settings first — out of order.
- **Wienie:** One bright "Create your first ___" CTA per screen; today three buttons compete.
- **Transitions:** The signup → first-use seam dumps the user on an empty dashboard — a wall. Add a
  bridging "here's what just happened, here's your next step."
- **"It's a Small World" effect:** The signature moment is the first generated result — concentrate
  polish there; it's what they'll describe to a colleague.
- **Hidden Mickey:** A warm, witty empty state before they have data.
- **Plussing (ranked):** (1) reorder to lead with the finished example, (2) collapse three CTAs to
  one, (3) bridge the empty-dashboard seam, (4) polish the first-result moment, (5) plus the empty
  state. Do #1 first.

Note how every move ties back to the Creative Intent and is concrete — not "add theming," but "the
settings-first flow violates Long/Medium/Close; lead with the finished example."