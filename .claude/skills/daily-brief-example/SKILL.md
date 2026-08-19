---
name: daily-brief-example
description: "OPTIONAL EXAMPLE — not run automatically, not part of onboarding. A bare-bones illustration of a recurring pull-from-external-source-then-ingest routine. Delete this skill or rewrite it heavily before relying on it."
---

# Daily Brief (example — delete or rewrite before use)

> **This is a shape-of-the-thing example, not a working routine.** It ships
> disabled: nothing calls it automatically, and `/onboard` never turns it on
> for you. It exists so you can see what a "pull from the outside world,
> land it in `.raw/`, then `ingest` it" automation looks like end to end,
> without this template guessing at your actual sources, cadence, or rules.
> Rewrite steps 1–3 for whatever you actually want pulled in, or delete this
> file entirely if you don't want this kind of automation at all — that is
> a completely normal choice (see `CLAUDE.md`: "most people don't need it on
> day one").

## What it illustrates

A recurring routine that:

1. Pulls from one or more external sources.
2. Skims the pull down to what's actually worth keeping (not everything —
   most of a calendar/inbox is noise for a knowledge base).
3. Lands the kept material as a new file under `.raw/` (immutable, sources
   are appended not edited).
4. Runs it through `ingest` (see `.claude/skills/ingest/SKILL.md`) to fold
   anything worth keeping into `wiki/`, `index.md`, and — if it clears your
   own bar for "hot" — `hot.md`.
5. Appends a `log.md` entry and commits.

## Example steps (generic — replace with your real sources)

1. **Pull.** Example using `gws` (an open-source Google Workspace CLI,
   https://github.com/googleworkspace/cli — not part of this template,
   install and auth it yourself if you want this exact source; see
   `_templates/integrations.md` for the general wiring pattern):

   ```bash
   gws calendar agenda --days 1        # today's events
   gws gmail triage                    # unread inbox summary
   ```

   Any other CLI/API works the same way — a task tracker, a notes app, a
   chat export. The point is "some command produces text," not `gws`
   specifically.

2. **Skim.** Decide what's worth keeping. <!-- TODO: your own filter —
   e.g. "only meetings with external people," "only emails I replied to."
   This template doesn't guess; a bad filter here just re-creates inbox
   noise inside your vault. -->

3. **Land it.** Write the kept material to a new file under
   `.raw/_inbox/YYYY-MM-DD-daily-pull.md` (or split by source). Don't edit
   or delete anything already in `.raw/` — append only.

4. **Ingest.** Run the `ingest` skill against what you just landed.

5. **Log.** Append `## [YYYY-MM-DD] brief | daily pull` to `log.md`, commit.

## If you want this for real

- Rewrite step 1 for your actual sources and step 2 for your actual filter.
- Decide a cadence (a scheduled agent, a manual trigger you run each
  morning, or something else) — this template doesn't wire up scheduling.
- Consider whether it needs its own approval gate before anything outbound
  (sending a reply, creating a task) happens — see the Invariants section in
  `CLAUDE.md`.
