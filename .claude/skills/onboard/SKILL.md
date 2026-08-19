---
name: onboard
description: One-time interview that turns this template into your own vault. Triggers: '/onboard', 'set up my vault', first run in a fresh clone of this template.
---

# Onboard

This template ships mechanics only. This skill's job is to make the vault
actually yours — not to copy any specific person's rules.

## Steps

1. **Ask, don't assume.** Interview the user (a few short questions, not a
   form dump):
   - What do you want this vault for? (personal knowledge, a team/company
     brain, a project's institutional memory, ...)
   - Who/what would you actually track? Walk through the suggested entity
     types in `CLAUDE.md` and ask which apply, which don't, and whether they
     want anything not listed. Don't keep types "just in case."
   - How do you want to work with the assistant — do you want it drafting
     things as you, running scheduled routines, or purely answering
     questions/updating pages when asked? Don't default to a heavy
     automation layer unless they ask for it.
   - What should count as "hot" (top-of-mind, belongs in `hot.md`)? Ask for
     examples rather than imposing a word limit or staleness rule.
   - Any sources they'll feed in regularly (email, meeting notes, docs)? This
     shapes what `.raw/` and `ingest` need to handle.

2. **Trim `CLAUDE.md`.** Rewrite the entity-type table to only the types they
   chose. Remove the "suggested starting point" framing once they've decided
   — replace it with their actual rules (their staleness bar, their hot.md
   bar, their conventions). Delete unused `_templates/*.md` files and unused
   `wiki/` subfolders.

3. **Write `me/about.md`** (create the `me/` page) — who they are, what they
   want the assistant to know about how they think and work. Short.

4. **Seed `hot.md`** with a real (short) snapshot of their actual current
   context, using their own bar from step 1 — not a copy of any example.

5. **Adjust `.claude/skills/ingest`, `query`, `lint`** — each has TODOs
   marking where prescriptive detail belongs. Fill those in from the
   interview, or delete the skill if they don't want it.

6. **Log it**: append `## [YYYY-MM-DD] init | onboarding complete` to
   `log.md`, commit.

Do not carry over anything from this template's own suggestions as if it
were a decision already made on the user's behalf — every default here is a
starting suggestion, confirm before it becomes their rule.
