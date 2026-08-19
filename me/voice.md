---
type: meta
title: "Voice"
updated: 2026-08-19
---

# Voice

> **Optional — only worth building once you actually want the assistant
> drafting outbound communication (email, messages) *as you*.** If you
> mostly want it to answer questions and update pages, skip this file
> entirely; leave it a placeholder or delete it.

## What this is for

A voice profile is what makes a drafted email sound like *you* wrote it
instead of reading as generic AI-polite prose. It's the input the
`voice-persona-example` skill (see `.claude/skills/voice-persona-example/`)
uses when drafting on your behalf.

## What to capture (and what not to)

Capture your **real, specific tells** — the things that would be wrong if
missing, not generic advice any writer could follow:

- Words/phrases you actually reach for, and ones you'd never use.
- Sentence rhythm — short and blunt, or does it wind up before the point?
- How you open and close messages (or pointedly don't).
- Where you're direct vs. where you soften, and with whom that changes.
- Formatting habits — bullets vs. prose, how long before you'd trim it.
- Language-switching habits, if relevant (do you mix languages, register
  shift for internal vs. external readers, etc.).

Do **not** fill this with "professional but friendly tone," "clear and
concise," or other advice that would apply to literally anyone — that's the
opposite of a voice profile; it produces exactly the generic-AI sound you're
trying to avoid.

## How to build it for real

Don't answer a handful of interview questions and call it done — a voice
profile built that way is a guess, not a fingerprint. Instead:

1. Pull a handful of messages you actually wrote yourself (before any AI
   drafting existed, if you can — drafts an assistant already wrote for you
   will contaminate this with *its* tells, not yours).
2. Have the assistant name the concrete patterns it sees, and correct what
   it gets wrong.
3. Keep this file short — a fingerprint, not an essay — and revise it the
   next time a draft comes back sounding off.
