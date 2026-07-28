---
name: elevenlabs-tts-prompting
description: "Turn plain text into a performance-ready ElevenLabs script using audio tags, punctuation, and pacing controls for Eleven v3. Use this skill whenever the user wants voiceover or TTS from ElevenLabs — writing or improving a script, adding emotion, laughter, whispers, sighs, or accents, controlling pauses and emphasis, fixing pronunciation, formatting multi-speaker dialogue, or choosing a stability setting. Trigger on requests like 'write an ElevenLabs script', 'make this sound excited/sad/sarcastic', 'add pauses to my voiceover', 'why does my TTS sound flat', 'format this dialogue for two voices', or 'how do I pronounce X in ElevenLabs'."
---

# ElevenLabs TTS Prompting

A method for turning plain text into a script that ElevenLabs **Eleven v3** performs the way you intend. v3 reads structure — tags, punctuation, and capitalization steer emotion and pacing. This skill catalogs those controls and gives you a repeatable workflow.

> Default to Eleven v3. It is the only model that reads audio tags. The v2 fallbacks (SSML `<break>` and `<phoneme>`) appear at the end for older models only.

## The workflow

Given plain text and a target delivery, produce a tagged script:

1. **Pick the voice character first.** Tags amplify a voice; they do not override it. A meditative voice will not convincingly shout; a hyped voice will not whisper. Match the script's emotional range to a voice that already sits in that range.
2. **Set stability** for the intended expressiveness (see table below).
3. **Place audio tags** at the moments emotion or sound shifts — before the clause they color, not after.
4. **Shape pacing with punctuation** using the cheat sheet — ellipses, commas, dashes, capitals.
5. **Fix any hard pronunciations** with IPA in slashes.
6. **Read it back.** Cut tags that fight the voice or stack too densely. Over-tagging destabilizes v3.

Deliver the script in a code block so the user can paste it straight into ElevenLabs.

## Punctuation cheat sheet

Punctuation is the primary pacing control in v3. This maps each mark to its effect:

| Write this | Effect |
|---|---|
| `...` (ellipsis) | Long pause; adds weight and hesitation |
| `,` (comma) | Short pause — a breath |
| `?` | Raises the intonation |
| `CAPITALS` | Shout / excitement / emphasis |
| `-` (dash) | Break; a clipped stop |

Example: `"It was a VERY long day [sighs] ... nobody listens anymore."`

Standard punctuation gives natural rhythm — write in complete, well-punctuated sentences. Capitalize whole words only where you want force behind them.

## Audio tags

Tags go in square brackets inline. Place a tag immediately before the words it should affect.

**Voice and emotion** — control vocal delivery:
`[laughs]`, `[laughs harder]`, `[starts laughing]`, `[wheezing]`, `[whispers]`, `[sighs]`, `[exhales]`, `[sarcastic]`, `[curious]`, `[excited]`, `[crying]`, `[snorts]`, `[mischievously]`

**Sound effects** — add environmental sound:
`[gunshot]`, `[applause]`, `[clapping]`, `[explosion]`, `[swallows]`, `[gulps]`

**Experimental** — powerful but inconsistent across voices; test before relying on them:
`[strong X accent]` (replace X, e.g. `[strong French accent]`), `[sings]`, `[woo]`, `[fart]`

### Tag rules

- **Match the tag to the voice.** Some tags land on some voices and not others. Do not expect `[shout]` to make a soft voice roar.
- **Give the tag emotional context.** Tags work best when the surrounding text already leans that way — `[sarcastic] Oh, great. Another meeting.` beats a lone `[sarcastic]` on neutral words.
- **Do not stack tags densely.** Too many tags in one generation destabilizes the output. One clear tag per emotional beat.
- **Experimental tags are a gamble.** Reserve `[sings]`, accents, and novelty tags for drafts you will audition.

## Stability settings

The stability slider controls how closely the output tracks the reference voice.

| Setting | Behavior | Use when |
|---|---|---|
| **Creative** | Most expressive; more prone to hallucination | You want tags and emotion to land hard and will re-roll misfires |
| **Natural** | Closest to the reference recording; balanced and neutral | Default for expressive narration with reliable results |
| **Robust** | Highly stable; least responsive to prompts | You need consistency across long or batched generations |

For tag-driven expressiveness, choose **Creative** or **Natural** — Robust mutes directional cues. Use **Instant Voice Clones or designed voices**; Professional Voice Clones are not yet optimized for v3.

## Pauses

v3 has **no SSML `<break>` support.** Control pauses with the punctuation cheat sheet — ellipses for long pauses, commas for breaths, dashes for clipped stops. This is deliberate: text structure drives pacing in v3.

## Pronunciation

Wrap a phonetic spelling in forward slashes to force pronunciation. v3's IPA support reaches 80–90% consistency. Include stress markers — primary `ˈ` and secondary `ˌ`.

```
The term "/ˌbaɪoʊˈkɛmɪstri/" refers to the study of chemical processes.
```

## Multi-speaker dialogue

Assign a distinct voice from the Voice Library to each speaker, then label lines by speaker. Keep each speaker's tags in their own voice's range.

```
Speaker 1: [excited] You will not believe what just happened!
Speaker 2: [curious] Go on...
Speaker 1: We got the grant. [laughs] We actually got it!
```

## Text normalization

v3 reads symbols and abbreviations literally, so spell out anything you want pronounced a specific way:

- Abbreviations: `Dr.` → `Doctor`, `Ave.` → `Avenue`
- Alphanumerics: `Ctrl + Z` → `control z`, `100km` → `one hundred kilometers`
- Phone numbers, currencies, dates, and URLs: expand to words, respecting locale.

## Do / Don't

**Do**
- Choose a voice whose natural range already covers the emotion.
- Write complete, well-punctuated sentences; let punctuation pace the read.
- Place one tag per emotional beat, right before the words it colors.
- Capitalize whole words for genuine emphasis, sparingly.
- Spell out symbols, numbers, and abbreviations you care about.

**Don't**
- Stack multiple tags on one line — it destabilizes v3.
- Leave stage-direction prose in the script (e.g. "she said angrily") — it gets read aloud. Encode intent as tags or punctuation instead.
- Fight the voice: no `[shout]` on a whisper voice.
- Use SSML `<break>` or `<phoneme>` with v3 — they do nothing.
- Lean on experimental tags in a final script without auditioning them.

## Worked example

**Input:** "I can't believe you did that. It's the best surprise ever. Thank you so much."

**Tagged for a warm, expressive voice on Natural stability:**

```
[gasps] I ... I can't believe you did that. [laughs] It's the BEST surprise ever.
[crying] Thank you ... thank you so much.
```

The ellipses stage the emotional catch, `[gasps]` and `[crying]` bracket the arc, and `BEST` puts weight on the peak — without a single line of stage direction for the model to read aloud.

## v2 fallback (older models only)

Use these only when a task pins an older model. They do **nothing** in v3.

- **Pauses:** `<break time="1.5s" />` up to 3 seconds. Too many break tags in one generation cause instability.
- **Pronunciation:** `<phoneme alphabet="cmu-arpabet" ph="M AE1 D IH0 S AH0 N">Madison</phoneme>`. CMU Arpabet is more reliable than IPA for v2; the `<phoneme>` tag is v2.5 Flash only.
