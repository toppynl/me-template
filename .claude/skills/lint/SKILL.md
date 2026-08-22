---
name: lint
description: Health check the vault — dead links, orphans, index drift, staleness. Triggers: 'lint', 'health check'.
---

# Lint

Mechanical checks, no judgment calls (that's `reconcile`, which this template
doesn't ship — add it yourself if you want the deeper pass):

1. Dead `[[wikilinks]]` — link target doesn't exist as a file.
2. Orphan pages — no incoming links, not referenced from `index.md`.
3. `index.md` drift — a `wiki/` file not listed in the index, or vice versa.
4. Staleness — <!-- TODO: define your own "too old" bar per status/type,
   e.g. "mature pages untouched >N days." No default here on purpose. -->
5. **Routine liveness (silent-cron detection)** — only relevant once you have
   at least one scheduled/recurring routine (a daily-brief-style skill, a
   cron-triggered agent, ...); skip this check entirely if you don't.
   Page-level staleness checks ("did the content change") can't catch a
   routine whose trigger stopped firing — it looks identical to one that ran
   and found nothing to do. Check the other axis directly, generically, for
   *whatever* routines you actually have: for each recurring routine, `grep
   '^## \[' log.md` for its op-type token, take the newest matching entry's
   date, and compare wall-clock time since to today against that routine's
   own expected cadence (whatever you set it to) plus some headroom (e.g.
   1.5x the cadence, so a daily routine flags at ~36h, a weekly one at ~10
   days — pick your own multiplier). Report each flag as "routine <name>
   hasn't logged since <date> (<N> days) — trigger may have stopped firing,
   or the routine is erroring before it logs." A routine with **zero**
   matching log entries ever (not just stale) is the same flag, worded as
   "never logged." Keep the routine list and its cadences in this file (or a
   TODO note here pointing at wherever you define them) so this check stays
   accurate as you add/remove routines — don't hardcode routine names you
   don't actually run.

Report findings, don't auto-fix silently — let the user decide
update/merge/archive per finding.
