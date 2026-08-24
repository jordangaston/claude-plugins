# UI Inventory Collection Reference

How to take stock of an existing UI, either manually or automatically (via MCP integration).

## Table of Contents

- [What to Collect](#what-to-collect)
- [Manual Approach](#manual-approach)
- [Automated Approach (MCP Integration)](#automated-approach-mcp-integration)
- [Inconsistency Detection](#inconsistency-detection)
- [Extracting Design Token Candidates](#extracting-design-token-candidates)
- [Limitations and Caveats](#limitations-and-caveats)

---

## What to Collect

### UI Element Categories

| Category | Example elements |
|----------|------------------|
| Interactive | Button, Input, Select, Checkbox, Toggle, Link |
| Navigation | Header, Sidebar, Breadcrumb, Tab, Pagination |
| Feedback | Toast, Modal, Tooltip, Badge, Alert |
| Data display | Table, Card, List, Avatar, Chart |
| Layout | Grid, Container, Divider, Spacer |

### Properties to Collect

```
color, background-color, border-color,
font-size, font-family, font-weight, line-height, letter-spacing,
border-radius,
padding-top, padding-right, padding-bottom, padding-left,
margin-top, margin-right, margin-bottom, margin-left, gap
```

### State Matrix

Collect the following states for each element:

```
default / hover / focus / active / disabled / error / loading
```

---

## Manual Approach

### Steps

1. **Build a screen list**: create the target URL list from routes/sitemap/Storybook
2. **Collect screenshots**: capture each screen
3. **Classify elements**: group by category (buttons/forms/cards, etc.)
4. **Mark inconsistencies**: flag elements with the same intent but different styles
5. **Tabulate**: organize element name, screen, and style values in a spreadsheet

### Strengths of the Manual Approach

- Can judge intent and context (identifies cases where the same look carries different meaning)
- Human judgment can fill in state coverage
- Requires no tooling; can start immediately

---

## Automated Approach (MCP Integration)

### Role of Each Tool

| MCP | What it captures | Use |
|-----|------------------|-----|
| Playwright MCP | Screenshots, DOM manipulation, state reproduction | Screen capture + capturing UI per state |
| Chrome DevTools MCP (CDP) | Computed style, DOM structure | Quantitative extraction of CSS properties |
| Mobile MCP | UI hierarchy XML/JSON | Retrieving UI elements of mobile apps |

### Recommended Workflow

```
1. Fix the set of screens
   Build the target URL / screen-ID list from routes/sitemap/Storybook

2. Define the state matrix
   default / hover / focus / active / disabled / error / loading
   → Force-reproduce each state with Playwright

3. Capture evidence twice
   Playwright  → screenshots (fullPage: true)
   DevTools CDP → styles per element via CSS.getComputedStyleForNode

4. Normalize to a common schema
   { platform, screen_id, tag, role, className, style }

5. Automatic clustering
   Compare style fingerprints within the same intent → treat diffs as inconsistency candidates

6. Human final confirmation
   Assigning token names / semantic tokens is finalized in review
```

### Using the CDP API

Center CSS value extraction on `CSS.getComputedStyleForNode`:

```js
const cdp = await context.newCDPSession(page);
await cdp.send("DOM.enable");
await cdp.send("CSS.enable");

const { root } = await cdp.send("DOM.getDocument", { depth: -1, pierce: true });
const { nodeIds } = await cdp.send("DOM.querySelectorAll", {
  nodeId: root.nodeId,
  selector: 'button,[role="button"],a,input,select,textarea'
});

for (const nodeId of nodeIds) {
  const { computedStyle } = await cdp.send("CSS.getComputedStyleForNode", { nodeId });
  // extract target properties from computedStyle
}
```

`DOMSnapshot.captureSnapshot` is also effective when you want fast, wide-scope capture.

---

## Inconsistency Detection

### Algorithm

1. **Intent classification**: determine an element's intent from role/tag/class/aria attributes
   - `button`: role="button", tag=BUTTON, class contains "btn"
   - `input`: tag=INPUT/TEXTAREA, class contains "input"/"field"
   - `link`: tag=A
2. **Style fingerprint**: generate a string concatenating the key CSS properties
3. **Cluster comparison**: multiple fingerprint patterns within the same intent → inconsistency candidate
4. **Outlier detection**: surface low-frequency fingerprints as outliers with priority

### Visual Aids

To detect cases where the CSS values are identical but the appearance differs (e.g., due to parent-element effects):
- pHash (perceptual hash): compare hashes of element screenshots
- SSIM: quantitative evaluation of structural similarity

---

## Extracting Design Token Candidates

Aggregate the frequency of the collected CSS property values to generate Global Token candidates.

### Extraction Logic

1. Collect the CSS property values of all elements
2. Aggregate by category (color / font size / spacing)
3. List the most frequent values as candidates
4. Group near-values (e.g., merge 15px and 16px)
5. Output `token-candidates.tokens.json` in W3C DTCG format

### From Candidate to Confirmed

```
Automatic extraction → present candidate list → human review → finalize naming → tokens.json
```

Judgment when naming:
- Global Token names: "appearance"-based (blue-500, font-size-16)
- Semantic Token names: "purpose"-based (color-primary, text-body)

---

## Limitations and Caveats

| Limitation | Mitigation |
|------------|------------|
| Automation is strong on "visible facts" but weak on "intent" | Always finalize with human review |
| Missed state reproduction (covering hover/error, etc.) | Define the state matrix up front and force-reproduce with Playwright |
| Computed style is context-dependent | The same token can yield different values under parent-element effects |
| Mobile has more limits on color/font info | Hybrid of hierarchy capture + manual completion |
| Missed collection of dynamic content | Set appropriate wait conditions for SPA/SSR pages |

### Complementary Tools

| Tool | Use |
|------|-----|
| Style Dictionary | Convert extracted candidates into Web/iOS/Android tokens |
| css-analyzer / cssstats | Get an overview of the whole CSS color/typography distribution |
| axe-core | Use a11y info (role/name) for intent classification |
