# The Introduction: Situation–Complication–Question–Answer

The introduction is where most documents are won or lost. Its job is **not** to summarize what you'll say — it's to make the reader feel the question your document answers, so that your answer lands as the relief to a tension they now hold.

## Why a story

A reader will only accept your main point if they're already asking the question it answers. The introduction manufactures that question by retelling a small, agreed-upon story. Because it's a story, it should be **narrative, not analytical** — it contains only things the reader already knows or will instantly accept, never your analysis or your conclusions. Save those for the body.

## The four elements

- **Situation** — A statement about the subject that the reader will accept as obviously true. It establishes time and place. It must be uncontroversial: you're looking for a nod, not a debate. ("We launched the self-serve tier in Q1 to reach smaller teams.")

- **Complication** — Something that has happened, changed, or gone wrong within that situation — the destabilizing event that makes action or thought necessary. This is what creates tension. ("Three months in, self-serve accounts are converting at a third of the rate we modeled.")

- **Question** — The question the complication raises in the reader's mind. You rarely write it out as a literal question, but the reader should be silently asking it. ("So what do we do about it?")

- **Answer** — Your governing thought: the top of the pyramid, which answers that exact question. ("Cut the self-serve trial from 30 days to 7 and gate the highest-value feature behind it.")

The flow is mechanical and reliable: Situation and Complication together produce the Question; your document is the Answer.

## The four orderings

The elements can be reordered for effect. Pick based on the reader and the stakes:

| Ordering | Sequence | Use when |
|---|---|---|
| **Standard** | S → C → Q → A | Default. Calm, builds the case before the ask. |
| **Direct** | A → S → C → Q | The reader wants the bottom line immediately (busy execs, "BLUF"). Lead with the answer, then ground it. |
| **Concerned** | C → S → Q → A | You want to foreground urgency or a problem. Open on what's wrong. |
| **Aggressive** | Q → S → C → A | You want to put the question itself on the table first, e.g. when the reader may not realize there's a question. |

All four contain the same four elements — only the entry point changes.

## Rules of thumb

- **Keep it short.** A few sentences to a short paragraph for most documents; a page is the ceiling for a long report. If the introduction runs long, you're probably smuggling analysis into it.
- **Include only what the reader already accepts.** The test: would the reader argue with any sentence here? If yes, it belongs in the body as a supported point, not in the introduction as a given.
- **Surface exactly one question.** If the introduction raises several questions, the document will feel like it's answering the wrong one. Narrow to the single question your answer addresses.
- **The answer in the introduction must equal the top of your pyramid.** If they differ, either the introduction is set up wrong or the pyramid is.

## Worked openings

**Email (direct ordering):**
> Recommend we push the launch two weeks. *(Answer)* We committed to June 1 assuming the data migration finished in May. *(Situation)* The migration hit a schema conflict that adds 10 days of validation. *(Complication)* Two weeks buys clean data and avoids a public rollback. *(supports the answer)*

**Memo (standard ordering):**
> Since the reorg, the support and success teams report into separate VPs. *(Situation)* Renewal conversations now bounce between them, and three enterprise accounts have flagged the handoffs as a reason they're evaluating alternatives. *(Complication)* [Reader's question: how do we stop the churn?] We should give one owner end-to-end responsibility for each enterprise account through renewal. *(Answer)*

**Executive summary (concerned ordering):**
> Gross margin fell six points last quarter — the first decline in two years. *(Complication)* It came entirely from the AI features we shipped in Q2, whose inference costs scale with usage we don't yet meter. *(Situation, as explanation)* [Question: how do we restore margin without pulling the features?] Introduce usage-based pricing on the three highest-cost features and cap the free tier. *(Answer)*

## A common mistake

Writers often open with their *credentials for the question* ("This memo reviews our Q2 performance and proposes next steps") instead of the *story that raises the question*. That's a table of contents, not an introduction. Replace it with an SCQA that makes the reader want the answer.