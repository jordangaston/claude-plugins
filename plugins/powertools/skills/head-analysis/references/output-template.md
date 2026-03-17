# HEAD Analysis — Output Template

Use this template to produce the final analysis document. Adapt section length to the complexity of the problem — a car-buying decision needs less prose than a geopolitical threat assessment.

---

## Document Structure

```markdown
# HEAD Analysis: [Key Question in Plain Language]

**Analyst:** [Name/Agent]
**Date:** [Date]
**Decision Maker:** [Who this is for]
**Decision:** [What action this informs]

---

## 1. Decision Context

[2–4 sentences. Who is the decision maker? What are they deciding? What do they already know? What constraints are they operating under?]

## 2. Key Question

**Full question:** [The comparative/scalar question from Phase 2]

**Call Mom version:** [One sentence, plain language]

**Three-line answer:** [The bottom line in three lines of plain language. This is the executive summary — write it last, after the analysis is complete.]

## 3. Driver Analysis

### Driver Matrix

| # | Driver | Metric | Assessment | Confidence | Key Evidence |
|---|--------|--------|------------|------------|-------------|
| 1 | [Name] | [How measured] | [Summary finding] | 🟢/🟡/🔴 | [1–2 sentence evidence summary] |
| 2 | [Name] | [How measured] | [Summary finding] | 🟢/🟡/🔴 | [1–2 sentence evidence summary] |
| ... | ... | ... | ... | ... | ... |

### Confidence Distribution

[State the distribution explicitly. Example: "Of 8 drivers, 1 is green, 5 are yellow, and 2 are red. This indicates moderate overall confidence — the conclusion is directionally sound but sensitive to new information on [red drivers]."]

### Capability vs. Intent

[If applicable, explicitly call out which assessments involve intent and note the inherent uncertainty. Example: "Drivers 3 and 6 involve assessments of intent, which are coded yellow regardless of source quality because intent is inherently changeable and unobservable."]

## 4. Gap Register

### Missing Information
| Driver | What's Missing | Impact if Filled | Priority |
|--------|---------------|-----------------|----------|
| [Driver name] | [What we'd want to know] | [How it might change the analysis] | High/Med/Low |

### Anomalies
| Finding | Expected | Observed | Explanation |
|---------|----------|----------|-------------|
| [What doesn't fit] | [What your framework predicted] | [What actually showed up] | [Your best account — flag if you're explaining it away] |

### What Would Make Us Wrong
[1–3 sentences. "The conclusion is most vulnerable to [X]. If [specific condition], the analysis would change significantly."]

## 5. Red Team Perspective

**Alternative conclusion:** [State the strongest opposing view in 2–3 sentences]

**Key differences:**
| Area | Primary Analysis | Red Team View |
|------|-----------------|---------------|
| [Driver or assumption] | [Primary view] | [Alternative view] |
| ... | ... | ... |

**Agreement zones** (higher confidence): [Where both analyses converge]

**Disagreement zones** (genuine uncertainty): [Where they diverge — these are the real uncertainties]

## 6. Trap Audit

| Trap | Detected? | How It Might Distort | Mitigation Applied |
|------|-----------|---------------------|-------------------|
| [Trap name] | Yes/No | [Specific concern] | [What was done] |
| ... | ... | ... | ... |

## 7. Conclusion

[Answer the key question directly, using hedged language appropriate to the confidence distribution. A mostly-yellow analysis should sound different from a mostly-green one.]

**Bottom line:** [1–2 sentences]

**Confidence:** [Overall confidence level with reasoning]

**Top uncertainties:**
1. [Most important unknown]
2. [Second most important unknown]
3. [Third most important unknown]

**Recommended next steps:**
- [What the decision maker should do]
- [What additional information to seek]
- [When to revisit this analysis]
```

---

## Formatting Notes

- Use the confidence emojis (🟢🟡🔴) in the driver matrix for quick visual scanning
- Keep the Call Mom answer genuinely simple — if a non-expert would struggle with it, simplify further
- The Gap Register and Trap Audit are the analytical humility sections — they should be substantive, not perfunctory
- Write the three-line answer and the conclusion LAST, after the full analysis is done
- For autonomous mode, append a section at the end flagging areas where human input would most improve the analysis

---

## Length Guidance

| Analysis Complexity | Target Length | Example |
|--------------------|---------------|---------|
| Simple (personal decision, 6 drivers) | 2–3 pages | Car purchase, job offer comparison |
| Medium (business decision, 7–8 drivers) | 4–6 pages | Market entry, product strategy, investment thesis |
| Complex (strategic/policy, 8–10 drivers) | 6–10 pages | Geopolitical assessment, M&A evaluation, threat analysis |

The driver matrix and gap register should be the longest sections. The conclusion should be the shortest — if you need more than half a page to conclude, the analysis upstream isn't clear enough.