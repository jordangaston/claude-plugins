---
name: practical-typography
description: Apply Matthew Butterick's Practical Typography to any text a human will read — documents, résumés, slides, web pages, PDFs, UI. Use when setting body text, choosing fonts, fixing punctuation (quotes, dashes, apostrophes, spaces), laying out pages, or reviewing a document's typography. Covers the five core rules plus detailed rules for composition, formatting, fonts, and layout.
---

# Practical Typography

## Overview

Matthew Butterick's *Butterick's Practical Typography* teaches typography for people who make documents — not designers. Its premise: **typography is the visual component of the written word, and good typography reinforces the meaning of the text.** Most documents look bad by default; a handful of rules fixes that.

**Read `reference.md`** (~10k tokens) for the full rule set. Don't read it for trivial edits — the five rules below cover most cases.

## When to Use This Skill

Use it whenever text will be read by a human and you control its appearance:

- Writing or reviewing documents, reports, résumés, letters, papers
- Setting up CSS/HTML for body text, or reviewing a web page's readability
- Fixing punctuation and special characters (quotes, dashes, apostrophes, ellipses, spaces)
- Choosing or pairing fonts
- Laying out pages, PDFs, slides, or tables
- Any request to "make this look professional / less amateur / more readable"

## The Five Rules (cover ~80% of cases)

Typographic quality is determined mostly by how the **body text** looks, because there's more of it than anything else. Get these right first:

1. **Body text is everything.** Start every project by making the body text look good, then handle the rest. Its appearance is set by the next four choices.
2. **Point size** — body text: **10–12 pt** in print, **15–25 px** on the web. Fonts vary; adjust by eye.
3. **Line spacing** — **120–145%** of point size. In word processors use the "Exact" option (single is too tight, 1½ too loose). In CSS use unitless `line-height` (e.g. `1.3`).
4. **Line length** — average **45–90 characters** per line (≈ 2–3 lowercase alphabets). In print this means margins wider than 1 inch; on the web, stop text before the window edge.
5. **Font choice** — the biggest, easiest win is a professional font over system/free fonts. If you must use system fonts, choose carefully and **never Times New Roman or Arial**.

## Fast Punctuation Fixes

- Curly quotes `" "` `' '`, not straight `" '`. Apostrophes point downward `'`.
- One space between sentences, never two. No runs of multiple spaces.
- Em dash `—` or en dash `–` for ranges — never `--` or a hyphen as a dash.
- Real ellipsis `…`, not three periods.
- Straight marks `′ ″` for feet/inches; curly quotes are wrong there.
- Real `™ © ®`, not `(tm) (c)`.

## How to Apply

1. **Quick pass** — apply the five rules + punctuation fixes above from memory.
2. **Thorough pass or review** — read `reference.md`, then work top-down: body text → composition → formatting → layout.
3. **Producing a specific document** (résumé, paper, letterhead, slides, website) — see the "Sample Documents" recipes in `reference.md`.

## Bottom Line

Fix body text first (size, spacing, length, font). Use real typographic characters. Add nothing you don't need. Restraint beats decoration.
