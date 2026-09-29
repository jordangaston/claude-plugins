# Practical Typography — Full Reference

Distilled from *Butterick's Practical Typography* (2nd ed.) by Matthew Butterick — https://practicaltypography.com/. Rules reflect US-English professional custom. Values are print-and-web where noted; HTML entities and app shortcuts are given where the book supplies them.

---

## Foundations

### What good typography is
- Typography is **utilitarian, not decorative**. Its only job is to reinforce the meaning of the text and make it more effective. That is the sole measure of quality.
- **Effective-but-ugly beats pretty-but-ineffective.** For a beginner, "ugly and effective" is real progress.
- No formula fits every text. Many solutions work for one document; a solution that works for one won't work for another. Understand the text's goals rather than applying rote rules.
- Reject "invisible typography" as a goal — legibility is largely acclimation, not a settled science.

### Where the rules come from
- Hold your documents to the standard of **professionally published books, newspapers, and magazines**. There's only "typography" — no separate business/legal/academic typography.
- Technological excuses are dead: in print you have near-professional tools; on screen there's no difference at all.
- When choosing between more or less consistency with professional typography, choose **more**.

---

## The Five Core Rules (body text first)

Typographic quality is set mostly by how the **body text** looks, because there's more of it than anything else. Set body text up before anything else, deciding four things: **font, point size, line spacing, line length.**

1. **Body text is everything** — make it look good first, then handle the rest.
2. **Point size** — 10–12 pt in print, 15–25 px on the web. Fonts vary at the same nominal size; judge by eye.
3. **Line spacing** — 120–145% of point size.
4. **Line length** — 45–90 characters per line (≈ 2–3 lowercase alphabets).
5. **Font** — a professional font is the biggest, easiest win over system/free fonts. If forced to use system fonts, choose carefully and **never Times New Roman or Arial**.

- Print: strongly prefer a **serif** font for body text. Web: serif or sans both work on modern screens.

---

## Type Composition (punctuation & characters)

### Straight and curly quotes
- Always use **curly quotes**; straight quotes (`'` `"`) are a typewriter holdover and should never appear. Four characters: opening single ‘ `&lsquo;` (option+]), closing single ’ `&rsquo;` (option+shift+]), opening double “ `&ldquo;` (option+[), closing double ” `&rdquo;` (option+shift+[).
- Enable smart-quotes (on by default). To convert imported text, search-and-replace each straight quote with itself. Fix quotes first, then apostrophes.
- Exceptions: foot/inch marks stay straight; never curl quotes/backticks inside software code; straight quotes are fine in email/texts.

### One space between sentences
- Exactly **one space** between sentences and after any punctuation — never two. Two spaces is an obsolete typewriter habit that creates "rivers" of white space. Backed by Bringhurst, Felici, and Chicago Manual (2.9). Only tolerable (still unnecessary) in monospaced fonts.

### Apostrophes
- Apostrophes are curly and **always point downward** — same glyph as the closing single quote ’ `&rsquo;` (option+shift+]). Uses: possessives (Jessica's) and omissions (isn't, ’211, ’70s).
- Smart-quote conversion wrongly inserts an *upward* opening quote at the start of a word (’70s, ’n’). Fix: type the mark twice and delete the wrong one, or insert directly.
- Hawaiian okinas point **upward** (use an opening single quote) — or use anglicized spellings.

### Question marks and exclamation points
- Use the question mark more freely — a question can make a topic sentence pithier.
- Budget **one exclamation point** per document longer than three pages; never stack (`!!`). `?!` is an interrobang (ligature U+203D exists, rarely used).

### Semicolons and colons
- Semicolon `;` joins two independent sentences in place of a conjunction; also separates list items containing internal commas. Don't use before a conjunction or to attach a subordinate clause.
- Colon `:` connects an introduction to its completion/list. Authority: Garner's Modern English Usage.

### Hyphens and dashes
- Three distinct marks — never fake with `--` or `---`:
  - **Hyphen** `-`: line-break splits, compound words (topsy-turvy), phrasal adjectives (five-dollar bills). No hyphen after most prefixes (nonprofit) or after an -ly adverb.
  - **En dash** – `&ndash;` (option+hyphen): ranges (1880–1912, pages 330–39) — but use "from…to," not "from 1880–1912"; and connection/contrast pairs (Sarbanes–Oxley Act).
  - **Em dash** — `&mdash;` (option+shift+hyphen): strong sentence break, stronger than a comma but weaker than colon/parens. Set flush to text; add word spaces only if crushed on screen.

### Parentheses, brackets, and braces
- `()` for asides/citations; `[]` for edits inside quotations; `{}` only in technical/math writing.
- The marks stay roman even around bold/italic material — **exception**: italicize a parenthesis if a roman one collides with a slanting italic character.

### Ellipses
- Use the real ellipsis … `&hellip;` (option+semicolon) — not three periods (too tight) or spaced periods (too loose). Use a nonbreaking space on any side with adjacent text so it doesn't break across lines. For interrupted dialogue, prefer an em dash.

### Foot and inch marks
- Foot/inch (also minute/second, prime/double-prime) are **straight**, not curly: foot ′ `&#39;`, inch ″ `&#34;`. To override smart quotes: type the mark, then Undo (⌘Z) to straighten.
- Use a nonbreaking space in measurements (6′ 10″). In a quotation: "She's 6′ 10″." (straight measurement, curly quotation).

### Ampersands
- Use **sparingly**. Always correct in proper names (Fromage & Cracotte LLP). Otherwise treat like a contraction — the more formal the document, the rarer it should be.

### Trademark and copyright symbols
- Use real symbols, never `(TM)`/`(c)`: ™ `&trade;` (option+2), ® `&reg;` (option+r), © `&copy;` (option+g).

### Paragraph and section marks
- ¶ pilcrow `&para;` (option+7) cites numbered paragraphs; § `&sect;` (option+6) cites numbered/lettered sections. Always follow with a **nonbreaking space** (§ 1782, ¶ 49). Double for multiples (¶¶, §§). Spell out the word if it starts a sentence.

### Math symbols
- Use real symbols, not letters. `+`, `=`, and en dash as minus are fine for light math. For more: × `&times;` (not letter x), − `&minus;`, ÷ `&divide;`. Use × in dimensions: 8.5″ × 14″.

### Accented characters
- In proper names accents must be exact (Albrecht Dürer, François Truffaut) — otherwise it's a misspelling.
- Loanwords: some naturalize and drop accents (naive, melee); others keep them (cause célèbre, piña colada) — check a dictionary.
- German Eszett (ß): just use `ss` (easily mistaken for B or β).

### Emoticons and emoji
- Fine in email/texts, never in formal writing. Don't overuse. In English, emoticons face right `:-)`. Emoji render differently across platforms — don't rely on nuance.

### Ligatures
- Only **mandatory** when f + i (or ff, ffi, fl) actually collide in your font (check bold and italic too). Otherwise stylistic (Butterick keeps them off).
- Enable via Word (Font → Advanced → Ligatures: Standard Only) or CSS (`liga`, or `text-rendering: optimizeLegibility`). Never insert manually — breaks spell-check, hyphenation, search. Avoid decorative ligatures (e.g. Th).

---

## White Space & Breaks

There are six white-space characters, each with a distinct job — use the right one: word space, nonbreaking space, tab, hard line break, carriage return, hard page break. Make invisibles visible while working (Word: `⌘+8` / `Ctrl+Shift+8`; Pages: View → Show Invisibles). In HTML, any run of white space collapses to a single space (except nonbreaking spaces).

### Word spaces
- Exactly **one** word space at a time — never hold the space bar to dispense space. HTML thin space `&thinsp;` (≈ half a space) is useful where a full space looks too big (e.g. "W. A. Dwiggins").

### Nonbreaking spaces
- Word-space width but glues the two sides so text won't wrap between them. Word `Ctrl+Shift+Space` (Mac `Option+Shift+Space`); Pages `Option+Space`; HTML `&nbsp;`.
- Use before/after numeric or abbreviated references so the number doesn't drop to the next line: § 1782, ¶ 49, Ex. A, Fig. 23, Sgt. Rock, ™/© symbols. Don't chain them to fake bigger gaps.

### Tabs and tab stops
- Use tabs only for horizontal space **mid-line**. Paragraph-start space → first-line indent. Real tabular layout → a table, not tabs. Set your own stops (don't rely on half-inch defaults); pick the right type (left/center/right/decimal). Fill space before a tab with a **tab leader**, never typed periods/underscores.

### Hard line breaks
- Moves the next word to a new line within the same paragraph. Word/Pages `Shift+Return`; HTML `<br />`. Use to fix awkward wraps in headings and balance lines, and for address lines on letterhead.

### Carriage returns
- One carriage return, only to start a **new paragraph**. Word/Pages `Return`; HTML `<p>…</p>`. Never use double returns for vertical space — use space-between-paragraphs instead. (Exception: emails, where there's no alternative.) Clean up by search-replacing `\n\n` → `\n`.

### Hard page breaks
- One hard page break → next word at top of a new page. Word `Ctrl+Enter`; Pages `Ctrl+numpad Enter`. Never fake with carriage returns. Build "page-break-before" into styles (e.g. major headings).

### Optional (soft) hyphens
- Mark where a word *should* break if it lands at a line end; invisible otherwise. HTML `&shy;`. Use on words hyphenation engines mishandle (jargon, trade names: "True&shy;Type"). Won't appear if auto-hyphenation is off.

### Signature lines
- Make with the underscore key (`Shift+Hyphen`) — most portable; survives removing underlining, double-space search-replace, and copy/paste. HTML: use `&nbsp;` (typed spaces collapse). If font underscores leave gaps, use underlined word spaces instead.

---

## Text Formatting

### Underlining
- **Never underline** in print — it's ugly, hurts readability, and is a typewriter workaround. Use bold/italic for emphasis. On the web, drop underlined links too and use color instead.

### Bold or italic
- **Bold OR italic, never both.** Use **as little as possible** — if everything is emphasized, nothing is. Fine for short bits, not long stretches.
- Serif: italic for gentle emphasis, bold for heavier. Sans serif: skip italic (slant barely shows), use bold. Never bold-italic or underlined-bold. Avoid heavier-than-bold weights at body sizes.

### All caps
- Fine only for **less than one line** — headings, headers/footers, captions, labels, letterhead, business cards. Never whole paragraphs (caps flatten word shape and readers skim past).
- Always add **5–12% letterspacing** to caps; keep kerning on. Caps work fine at small sizes.

### Small caps
- Use **real** small caps; never the small-caps checkbox (which just shrinks caps — too tall, too light). Real small caps must be bought (separate font or `smcp` OpenType feature). CSS `font-variant: small-caps` is now safe. Apply the all-caps rules (sparingly, letterspaced, kerned).

### Point size
- Body: 10–12 pt print, 15–25 px web (72 points = 1 inch). 12 pt is a typewriter default, not optimal — try down to 10 pt using half-point increments (10.5, 11.5).
- Point size isn't absolute — two fonts at the same size look different; judge by eye. Emphasize with subtle bumps (half a point), not 11→14. Screen sizes run larger (read from farther). Business-card text can be 6–8 pt.

### Headings
- Limit to **three levels, ideally two.** Best emphasis is space above/below. Use bold (not italic); bump size only slightly (12 → 12.5/13, not 14–15). Don't use all caps, don't underline, don't center, avoid title case. Suppress hyphenation; use keep-lines-together / keep-with-next.

### Hierarchical headings
- Use tiered numbers (1, 1.1, 1.1.1), not the I/A/1/a/i cascade (roman numerals confuse: II vs III; letters lose number correlation). Word processors generate them automatically. CSS: `counter-increment`.

### Letterspacing
- Add **5–12%** to all-caps and small-caps (CSS `letter-spacing: 0.05em`–`0.12em`; Word 0.6–1.4 pt per 12 pt). Don't letterspace normal lowercase. Don't overdo it (if another letter would fit, too wide). Exceptions for lowercase: add a little below ~9 pt; remove at headline sizes.

### Kerning
- **Always on.** Tightens over-spaced pairs to match the font. Word: Font → Advanced → "Kerning for fonts ___ points and above" → 8. Pages: on by default. CSS: `text-rendering: optimizeLegibility` + `kern`. Bake into styles.

### Color
- Print body text: **always black.** On screen, dark gray can read more comfortably than pure black. Contrast (light/dark) draws the eye — that's why bold beats italic and colored type is weak for emphasis at body size.
- Use color sparingly — prefer shades of one color; avoid colored type on colored backgrounds. Color is the idiomatic web signal for links. Avoid knockout type (white on dark) on laser printers (~20× toner). Keep printable PDFs' body text black.

### Alternate figures
- Default figures (0–9) are never wrong. **Lining** figures (cap height) work anywhere and are required with all caps. **Oldstyle** figures suit lowercase body text — never with caps. **Tabular** (fixed width) for aligned number columns; **proportional** for body text. Lining/oldstyle is independent of tabular/proportional. Test tabular: a line of zeros over a line of ones should be equal length. Excel has no OpenType — pick a font with tabular figures in the default position.

### Ordinals
- Don't superscript ordinals — write "1st 2nd 304th." Turn off auto-superscript (Word: AutoCorrect → AutoFormat As You Type). HTML: don't add `<sup>`.

### Web & email addresses
- Don't hyphenate addresses (readers mistake the hyphen for part of it) — control wraps with hard line breaks. Shorten long URLs with a service but note both full and short in footnotes. Turn off auto blue-underlined hyperlinks for print.

### Goofy fonts
- No novelty/script/handwriting/circus fonts in professional documents. Distinctive is fine; goofy is not. Such fonts can work on a sign, never in body-length reading.

### Monospaced fonts
- Don't use for body text (uniform width is harder to read, fewer words/page). Legitimate exception: quoting code. For aligned numbers, use tabular figures, not monospace. Courier is one of the worst choices.

### Mixing fonts
- Less is more — mixing is optional. One font + size/bold-italic/small-caps variation goes far. Diminishing returns past two fonts; almost never four+. The "serif + sans only" rule is false — any two identifiably different fonts work, and lower contrast is often better. Give each font a consistent role; switch only at paragraph breaks. Shortcut: pair fonts by the same designer.

### OpenType features
- Features (alternate figures, small caps, ligatures, ordinals, fractions) need support from **both** font and application. Check the designer's specimen sheet. Best in pro layout apps and desktop browsers; Word supports a limited set; Excel/PowerPoint none. CSS: `font-feature-settings`.

---

## Fonts

### Font basics
- Professional fonts clearly beat system/free fonts. A top family costs under $200 (~$20–50/style), never obsolesces, no learning curve. Body-text styles to buy: **roman, italic, bold, bold italic, roman small caps.**
- Font *names* mean nothing about quality — untrademarked names (Baskerville, Garamond, Caslon) attach to unrelated fonts; trademarked ones (Myriad, Minion) are distinct. Almost any font in a book/newspaper can be licensed. For MS Office on Windows use `.ttf`; otherwise `.otf` works on both.

### System fonts
- Avoid for print when possible (many are poor or screen-optimized — Georgia, Verdana, Cambria, Calibri look clunky in print — and all are overexposed). In PDFs, embed print-optimized professional fonts (they embed automatically).
- If limited to system fonts, best body-capable choices ("A list"): Athelas, Book Antiqua, Californian FB, Calisto MT, Century Schoolbook, Charter, Franklin Gothic, Garamond, Gill Sans, Goudy Old Style, Hoefler Text, Iowan Old Style, Palatino, Seravek, Sitka; sans options Avenir, Helvetica/Helvetica Neue, Optima.
- **Never Arial** (bland Helvetica clone surviving on overuse). Times New Roman rates only "C." Worst ("F"): Comic Sans, Papyrus, Copperplate, Bookman. Prefer Avenir/Franklin Gothic/Gill Sans over Arial.

### Free fonts
- Most are poorly made, but good open-licensed options exist when a project needs them: **Source Serif / Source Code** (Adobe), **Cooper Hewitt**, **IBM Plex** (sans/serif/mono), **Charter** (Matthew Carter, holds up on modern screens). System fonts are NOT free fonts (they carry restrictive proprietary licenses; free fonts use open licenses, usually OFL). Don't hunt the low-quality mass — just buy a professional font.

### Bad fonts
- The damaging fonts are the "poseurs" that fool beginners: **Papyrus** (fake-historic), **Copperplate** (dated novelty on "classy" menus/signage). "Skunked" (once fine, now ruined): **Bookman** (1970s vibe), **Bodoni** (flashy but tiring past three words). Skip old bundled scripts (Brush Script).

### Alternatives to common fonts
- **Times New Roman**: connotes apathy / absence of choice; flaws are narrowness and a mediocre italic. Alternatives: Plantin, Equity.
- **Helvetica/Arial**: Helvetica is fine but dated. For diehards, Neue Haas Grotesk. Neutral-not-dull: Concourse, Hermes Maia, Atlas. You cannot make good typography with Arial.

---

## Page Layout

### Line spacing
- 120–145% of point size ("leading"). Single is too dense; double (~233%) too loose. Set exact/fixed, or unitless CSS `line-height`. In Word avoid Single/1.5/Double (≈117/175/233%); use Multiple 1.03–1.24. Pages: Lines 1.03–1.29. Never "At least." Adjust line spacing first when fitting to a page count.

### Line length
- 45–90 characters per line (including spaces), measured by average characters — not inches. Rule of thumb: 2–3 lowercase alphabets. Control primarily via **page margins**; account for indentation. Over-long lines are the top responsive-web flaw.

### Page margins
- One inch is not enough. At 12 pt on 8.5×11″, use left/right margins of **1.5–2.0″** (a 1″ margin gives a too-long 6.5″ line). Smaller point size → larger margins. Set margins by targeting 45–90 chars/line. Margins needn't be equal — make the bottom ~0.25″ larger than the top so the block doesn't sag; asymmetric layouts differ left/right by ≥1″. Golden-ratio option: 2.23″ all around.

### Centered text
- Use sparingly and only for short items: titles, names on cards/letterhead, major section headings. Never center whole text blocks (both edges uneven, hard to align). If you must center multi-line text, use hard line breaks.

### Justified text
- Justified vs. left-aligned is preference, not professionalism. **If you justify, hyphenation is mandatory.** Prefer left-align in word processors/browsers (crude engines look clunky); justify only in pro layout apps. Distribute extra space between words, never letters.

### First-line indents vs. space between paragraphs
- Signal a new paragraph with **one or the other, never both.** First paragraph needs no indent.
  - **First-line indent**: 1×–4× the point size (12 pt → 12–48 pt / 0.17–0.67″). Narrow blocks use the low end. Set via indent tool / CSS `text-indent`; never fake with spaces/tabs.
  - **Space between paragraphs**: 50–100% of body size. Set via paragraph spacing / CSS margins; rely on "space after." Never add an extra carriage return.

### Body text
- Set up first — it dictates the document's look. Decide font, point size, line spacing, line length. Print: prefer serif. Web: either.

### Hyphenation
- Mandatory for justified text; optional for left-aligned (doesn't improve legibility, often better off). Essential as line length shortens (fewer break points). CSS `hyphens: auto` (support spotty). Suppress on headings (`hyphens: none`).

### Block quotations
- Reduce point size and line spacing slightly; indent 0.5–1.0″ left (optionally right too), or ~2–5 ems on the web. No quotation marks at the ends (redundant). Don't overuse — edit and integrate quoted material instead.

### Bulleted and numbered lists
- Never type bullets/numbers by hand — use automated lists (Word buttons, Pages Bullets & Lists, HTML `<ul>`/`<ol>`). Keep bullets noticeable but no bigger; hollow bullets are subtler; avoid asterisks. The index may be a different font/size than the item. Consider turning off auto list-detection.

### Tables
- Use a real table (not tabs/spaces) for data grids or positioned layouts. Fix two defaults: turn cell borders **off** and re-enable only where needed; **increase cell margins** to open dense tables (start ~0.03″, step 0.01″). CSS: `border: none` + `padding` on `td`.

### Rules & borders
- Use sparingly — first try space above/below instead. Thickness **0.5–1.0 pt** (thinner won't reproduce; thicker is noise). Single solid lines only — no dots/dashes/doubles. Never build rules from repeated characters. Attach heading rules **above** the heading.

### Widow and orphan control
- Widow = last line stranded at page top; orphan = first line stranded at page bottom. Control is all-or-nothing and leaves blank lines at page bottoms — enable only when widows/orphans cause a visible problem. Fix isolated cases with light editing or a nonbreaking space (web); never with hard line breaks/carriage returns.

### Columns
- Print only (web has no fixed bottom). On 8.5×11″, two or three columns work; four is too many. Align baselines across columns (make spacing a whole multiple of line spacing). Web columns only for small amounts of text or link lists.

### Grids
- A grid guides positioning/sizing/alignment and enforces consistency — but the eye is the final judge (a grid won't fix ugly content). Prefer a coarse, simple grid. Starting points: `1rem`/`1vw` for scalable web; a pica grid (1 pica = 12 pt) for print — but don't obsess over ratios. Skip baseline grids for book/web work.

### Maxims of page layout
- Decide how body text looks first. Divide the page into **foreground** (most important, usually body text) and **background**; don't let background upstage foreground — tools are position, size, font, sometimes color.
- Make adjustments in the smallest visible increments; when in doubt, try both ways and react visually.
- Be consistent (same things look the same). Relate each element to existing ones (a grid helps). Keep it simple. Imitate typography you like. **Don't fear white space** — work outward from the text; if the text looks good, the white space takes care of itself.

---

## Sample Document Recipes

### Research papers
- Drop the typewriter default (1″ margins, 12 pt, double-spaced). Recipe: **bigger margins** (~65 chars/line), **smaller point size**, **tighter line spacing**, a **real font** instead of TNR. Plus: one space between sentences, shallow first-line indents, hyphenation if justifying, no underlined headings. Comply with a required style guide if one is dictated; otherwise modernize. Control length by word count, not formatting. Exception: for shared drafts, system fonts (or a PDF) are right.

### Letterhead
- Foreground = the letter's text; background = the address block. Make body text dominate; start the letter at the top; clean two-column layout; legible print fonts; no centered text; don't combine indents with paragraph spacing.
- Printing best→cheapest: letterpress → offset → internet offset (good under ~500, business cards) → laser. Stationery is best in spot color, not process.
- For laser letterhead: fix the typography (no system fonts), use off-white/ivory wove cotton paper, print name/address in a pale color (grayish-blue) since toner reads as dark gray.

### Business cards
- Shrink and simplify — build the layout **outward from the text** (working inward from the edges yields the bad "baseball-diamond" corner layout). Remove nonessentials; small consistent text is fine. Letterspace caps/small caps; avoid goofy/script/Copperplate; one consistent font. Get professionally printed (laser perforated cards are too flimsy). Paper stock matters most; use color sparingly.

### Résumés
- Zero typos + clean typography are decisive. Reject the one-page myth (except students) — go to a second page if it relieves density, but keep the most important info on page one.
- Recipe: bigger margins / shorter lines; a real font instead of Calibri; headings not oversized; school/employer names immediately visible; gentle bullets; nonessentials to page two. Print two pages on two separate sheets. Use plain high-quality business paper (not "résumé paper"); prefer PDF. Have 2+ people each propose 3 edits. Spelling: "résumé" preferred, "resume" wrong.

### Presentations
- Optimize for the room, not your bright workspace. Dark-room recipe: work with your lights off; **pure black background**; thin sans serif; font color starting at 50% gray, brightening only until legible (pure white on black is too harsh). Turn off auto-resize; pick one base size fitting 12–15 lines and keep it consistent across slides. Color with restraint; avoid centered text; drop bullets when each point is under one line. If the room won't be dark, cut contrast (light-gray background or dark-gray type).

### Websites
- Step outside the "cargo cult" — habits detached from their original technical reason become obstructions. Avoid the obsolete '90s habits: tiny body text; huge headings; reliance on a few system fonts; edges crammed with nav links; layouts built from large color blocks.
- Modern browsers/CSS remove technical excuses — remaining problems are the designer's. Templates just swapped "ugly for boring." The web has no 500-year tradition to copy, so borrow visual ideas from books, posters, art, software, other eras. Experiment.
