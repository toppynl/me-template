---
name: voice-persona-example
description: "OPTIONAL EXAMPLE — not run automatically, not part of onboarding. Sketches a reusable two-persona pattern (outward-facing voice with an exposure boundary, plus a private full-candor sparring partner) and a final de-AI-ify pass for anything drafted as you. Delete or heavily rewrite before relying on it."
---

# Voice & Persona Pattern (example — delete or rewrite before use)

> **This is a shape-of-the-thing example, not a working persona.** It ships
> disabled: nothing calls it automatically, `/onboard` never turns it on,
> and it contains no actual voice traits or content — those are yours to
> build in `me/voice.md` if and when you want this. Only worth having if you
> actually want the assistant drafting outbound communication (email,
> messages) as you often enough that a consistent voice matters. If you
> mostly want Q&A and page updates, skip this entirely.

## The pattern

Two different personas for two different jobs — conflating them is how you
either leak candor outward or sound stiff talking to yourself:

1. **Outward-facing persona** — drafts or represents you *to other people*
   (email replies, messages, anything that goes out under your name). Reads
   your full context for accuracy, but has a hard **exposure boundary**: a
   short, explicit list of what it must never surface when speaking for you
   externally (internal-only opinions, undecided/undisclosed matters,
   anything candid said about a third party, sensitive numbers). Draft this
   boundary yourself — it depends entirely on what you actually keep
   private, this template can't guess it.

2. **Private sparring persona** — a thinking partner for *you*, not for
   external consumption. Full-candor register: no exposure boundary, because
   nothing it says leaves this conversation. Good for strategy, hard
   decisions, pressure-testing a plan — amplify what you're already good at,
   push back on the blind spots, don't just agree.

Keep these as two distinct personas/agents (or two distinct modes if you'd
rather not stand up separate agent files) — never let the private one leak
into a drafted message, and never let the outward one self-censor when
you're just talking to it privately.

## The voice input

Both personas that draft *as you* (persona 1 above) read `me/voice.md` for
what you actually sound like. See that file for how to build it — the short
version: real tells from real writing samples you produced yourself, not
generic tone advice.

## Final pass: de-AI-ify before it goes out

Even with a good voice profile, a first draft can still carry generic
AI-writing tells that no human voice actually has. Before anything drafted
*as you* goes out, run one more pass checking for (and stripping):

- Em-dashes used as a crutch (often the single biggest tell)
- Inflated significance ("this changes everything," "a pivotal moment")
- Padding sentences to open with "-ing" clauses
- Rule-of-three list padding where two items (or one) would do
- Generic "AI vocabulary" (delve, tapestry, robust, leverage, unlock, ...)
- Copula avoidance ("stands as," "serves as" instead of just "is")
- Unearned sycophancy ("great question," "I'd be happy to")
- Over-signposting ("first, ... next, ... finally, ...") where plain prose
  would read more like a person
- Filler hedging ("it's worth noting that," "in many ways")

Ground the pass in real samples of your own writing (same samples used for
`me/voice.md`) — the goal isn't "sound generically professional," it's
"sound like the specific person who wrote the samples." Don't sand off
genuine quirks (an actual verbal tic, a real short-sentence habit) just
because it superficially resembles an item on this list — check against your
own samples before cutting anything.

## If you want this for real

1. Write `me/voice.md` from real writing samples (see that file).
2. Decide your own exposure boundary for the outward-facing persona — what
   must never leak when it speaks for you.
3. Stand up the two personas (separate agent files, or two modes of one
   skill — your call) and wire the de-AI-ify pass in as the last step before
   anything drafted goes out.
