---
name: onboard
description: One-time interview that turns this template into your own vault. Triggers: '/onboard', 'set up my vault', first run in a fresh clone of this template.
---

# Onboard

This template ships mechanics only. This skill's job is to make the vault
actually yours — not to copy any specific person's rules — and to leave you
knowing exactly what to do next, not staring at an empty wiki.

Work through the steps in order. Keep the interview conversational (a few
questions at a time, not a form dump), but don't skip steps — each one feeds
something concrete you write later.

## Steps

1. **Purpose.** What is this vault for? (personal knowledge, a team/company
   brain, a project's institutional memory, a specific domain...) This
   framing colors every later answer, so get it first.

2. **Entity types.** Walk through the suggested types in `CLAUDE.md` and ask
   which apply, which don't, and whether they want anything not listed.
   Don't keep types "just in case" — unused types are just noise in every
   future `_templates/` read.

3. **Status ladder.** Do they want the `seed → developing → mature →
   evergreen` maturity field at all? Some people find it useful for knowing
   what to trust; others find it busywork. If they want it, confirm the
   definitions in `CLAUDE.md` fit, or let them redefine the four words. If
   not, note that `status` gets dropped from `_templates/*.md` in step 6.

4. **Archive & deprecation.** `CLAUDE.md` describes a two-case lifecycle
   (superseded-in-place vs. moved-to-`archive/`) as a mechanic, not a taste
   call — confirm they want to keep it as-is, or ask if they'd rather just
   delete obsolete pages outright (simpler, but breaks wikilinks and loses
   history — make sure they understand the tradeoff before choosing that).

5. **Concurrent use.** Will this ever run from more than one place at once —
   a phone session and a laptop session, a scheduled cloud agent alongside
   interactive use, multiple branches? If yes, keep `.gitattributes`
   (`log.md merge=union`) and consider whether `hot.md`/`index.md` need a
   merge convention too (the original pattern this is drawn from: newest
   `updated:` wins wholesale on `hot.md`, union-per-line on `index.md`,
   real content conflicts get flagged rather than silently picked). If it's
   solo/single-session, say so explicitly and leave `.gitattributes` as
   a harmless default — no further setup needed.

6. **Automation appetite.** Do they want the assistant drafting things as
   them, running scheduled routines, or purely answering questions/updating
   pages on request? Don't default to a heavy automation layer unless they
   ask for it — most people don't want that on day one. If they're curious
   what a recurring pull-and-ingest routine would even look like, point them
   at `.claude/skills/daily-brief-example/` — it's an illustration to read
   or rewrite, not something onboarding turns on.

7. **What's "hot."** What should count as top-of-mind enough for `hot.md`?
   Ask for real examples from their own situation rather than imposing a
   word limit or staleness rule.

8. **Lint/reconcile cadence.** Do they want to run `lint` on some cadence
   (after every N ingests, weekly, only when something feels off)? Note
   their answer even if the answer is "never, I'll ask when I want it." Ask
   separately whether they want a deeper judgment-driven `reconcile` pass
   (this template doesn't ship one — offer to help them write one later if
   they want it, don't build it now).

9. **Sources.** What will they actually feed in regularly (email, meeting
   notes, docs, chat exports, nothing)? This shapes what `.raw/` and
   `ingest` need to handle, and whether `ingest` needs source-specific
   steps at all.

10. **First real pages.** Don't leave the wiki empty. From everything said
    in steps 1–9, identify 3–5 real entities worth a starter page right now
    (the person themself if `person` is a type they kept, the main
    project/system, a live decision, whatever came up) and create them from
    `_templates/<type>.md` with real (if thin) content — not placeholder
    text. Update `index.md` for each.

## Then, generate the vault

11. **Trim `CLAUDE.md`.** Rewrite the entity-type table to only the types
    they chose (step 2). Fold in their actual status-ladder decision (step
    3), archive/deprecation decision (step 4), and concurrent-use decision
    (step 5) — replace the generic "suggested starting point" framing with
    their actual rules now that they've decided. Delete unused
    `_templates/*.md` files and unused `wiki/` subfolders. If they don't
    want `.gitattributes`, remove it; otherwise leave it. If step 6 made
    clear they have no interest in a daily-brief-style automation, ask
    whether to delete `.claude/skills/daily-brief-example/` and
    `_templates/integrations.md` now or just leave them unused — either is
    fine, don't delete without asking.

12. **Write `me/about.md`** — who they are, what they want the assistant to
    know about how they think and work. Short.

13. **Seed `hot.md`** with a real (short) snapshot of their actual current
    context, using their own bar from step 7 — not a copy of any example.

14. **Adjust `.claude/skills/ingest`, `query`, `lint`.** Each has TODOs
    marking where prescriptive detail belongs. Fill those in from steps 8–9,
    or delete a skill entirely if they don't want it.

15. **Write `me/how-to-use.md`** — replace its placeholder with a real,
    short day-to-day cheat sheet grounded in everything decided above.
    Cover at minimum:
    - **Ingest something**: how to hand it a source — drop a file in
      `.raw/_inbox/` and say "ingest it," or paste/describe something
      directly and say "ingest this."
    - **Ask a question**: just ask — it follows the reading discipline
      (`hot.md` → `index.md` → the 3–5 most relevant pages) and cites
      wikilinks inside vault files, plain prose in conversation.
    - **When `hot.md` changes**: restate their own bar from step 7 in plain
      terms, so they know what to expect and what *not* to expect.
    - **Lint**: their cadence answer from step 8, and how to trigger it
      on-demand ("lint" / "health check").
    - **Commits as audit trail**: every operation ends in a commit; `git
      log` is how they review what the assistant did, `git diff` on any
      commit shows exactly what changed. No hidden state.
    - Anything else specific to what they chose (e.g. if concurrent use
      applies, a one-line reminder of the merge conventions from step 5).
    - **Automation, if they want it later**: one line noting that a
      recurring pull-and-ingest routine is optional, not something this
      vault assumes, and that `.claude/skills/daily-brief-example/` is
      where to look if/when they want a starting shape for one. Skip this
      bullet entirely if step 6 made clear they're not interested — don't
      plant the idea if they already said no.

    This file is the answer to "ok, onboarding's done, now what" — write it
    so a re-read six months from now still makes sense without this
    conversation's context.

16. **Log it.** Append `## [YYYY-MM-DD] init | onboarding complete` to
    `log.md`, commit.

17. **Close the loop out loud.** Tell them onboarding is done, point at
    `me/how-to-use.md` as where to look if they forget how any of this
    works, and suggest one concrete first action (e.g. "try: ingest
    something real right now" or "ask me something you'd want this vault to
    know").

Do not carry over anything from this template's own suggestions as if it
were a decision already made on the user's behalf — every default here is a
starting suggestion, confirm before it becomes their rule.
