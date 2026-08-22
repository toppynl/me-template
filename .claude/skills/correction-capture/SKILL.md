---
name: correction-capture
description: "Fix the vault the moment you correct a claim it (or a session) just made. Triggers: 'that's wrong', 'that's not right', 'I never said that', 'where did you get that', or any explicit factual correction you state inline about something asserted."
---

# Correction Capture

You just told the assistant a claim is wrong. Fix the record at the moment of
correction, not in a later cleanup pass. This is a lightweight inline skill —
mirrors any decision/stance-capture-style skill you build (fire-on-trigger),
not a batch pass. It is **not** a fan-out reconciliation: touch only the
implicated page(s) plus `log.md`.

## Steps

1. **Acknowledge, don't relitigate.** Quote back what was claimed, state what
   is actually correct. No defending, no re-arguing the source.

2. **Trace the claim to its source.** Grep `index.md` and check the 1-3 wiki
   pages the claim plausibly came from. Also check whether it came from a
   memory/context file outside the vault rather than the vault itself, or
   whether nothing supports it at all.

3. **Classify:**
   - **SOURCE_ERROR** — the wrong/stale fact literally exists on a wiki page.
     Fix the page. Note the correction inline: a short parenthetical, or a
     Timeline entry if the page carries one (see the Timeline convention in
     `CLAUDE.md`, if you've adopted it). Bump `updated:`.
   - **HALLUCINATION** — no page supports the claim; it was confabulated.
     Nothing to edit on a page. Log the pattern — the `log.md` entry must note
     what got confabulated and from what partial signal (a similar name, an
     adjacent fact, a plausible-sounding inference), so recurring
     confabulation vectors become visible over time.
   - **STALE** — was true once, superseded by newer reality you just stated.
     Update per your lifecycle rules (see Archive & deprecation in
     `CLAUDE.md`): a still-live page → update in place; a reversed
     decision/choice → deprecate/archive per the standard lifecycle
     (superseded banner, `superseded_by`, archive it if fully obsolete).

4. **One `log.md` entry:** `## [YYYY-MM-DD] correction | <one-line title>` —
   what was wrong, why (source-error/hallucination/stale), what got fixed.

5. **Scope discipline.** Touch only the page(s) implicated by the correction
   and `log.md`. If the correction surfaces a *pattern* worth a wider check
   (e.g. several pages likely share the same stale fact), note that as a
   follow-up for a lint/reconcile pass — don't fan out yourself.

## Bookkeeping

If a wiki page changed: bump its `updated:`, update its `index.md` line if
the one-line summary changed. `log.md` entry per step 4 either way (even for
a pure hallucination, where no page changes). Commit `correction: <slug>`.
