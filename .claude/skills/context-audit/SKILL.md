---
name: context-audit
description: "Report-only token-hygiene pass over the always-loaded context stack (project CLAUDE.md, plus whatever else your setup loads unconditionally): score every file for efficiency, redundancy, contradictions, skill-worthiness, staleness, clarity, and output a ranked cut-list. Triggers: 'context audit', 'token hygiene', 'context diet'. Never edits files itself."
---

# Context Audit

Every file in the always-loaded stack is paid for on **every** session, not
just when relevant. This skill audits that stack for waste — it never fixes
it. You apply the cuts by hand, or ask for a specific one as a separate action.

## Scope — the always-loaded stack

<!-- TODO: fill in the actual paths your setup loads unconditionally at
session start. Typical candidates, adjust to what actually applies: -->

1. This vault's `CLAUDE.md` — project instructions.
2. A global user-level `CLAUDE.md` (e.g. `~/.claude/CLAUDE.md`), **if
   present** — check first, skip silently if missing.
3. Any per-project auto-memory index your setup maintains (e.g. a
   `memory/MEMORY.md` under `~/.claude/projects/<this-project>/`), **if
   present** — check the exact path exists, skip silently if missing.
4. `hot.md` — current-context snapshot.

Nothing outside this stack. Don't wander into `wiki/`, `now/`, or
`.claude/skills/` bodies — this is about what loads unconditionally, not the
vault's content quality (that's `lint`'s job).

## 1. Deterministic pass

For each file in scope: measure its size (e.g. `wc -c <file>`), divide by ~4
for a rough token estimate. This gives the baseline size each finding's
"tokens saved" is scored against — do this before reading, so estimates
aren't anchored by impressions from the text.

## 2. Full read, scored on 6 dimensions

Read every file in full. For each file, evaluate:

- **Efficiency** — is every sentence earning its tokens, or restating the obvious?
- **Redundancy** — the same fact stated twice across files, or twice within one.
- **Contradictions** — two files disagreeing on the same fact or rule.
- **Skill-worthiness** — a chunk of prose that's really a reusable *procedure*
  and belongs in `.claude/skills/<name>/SKILL.md` (loaded on demand) rather
  than always-loaded `CLAUDE.md`.
- **Staleness** — references to things that sound superseded, dead, or
  historical (a tool no longer used, a decision reversed, an entity no longer
  relevant).
- **Clarity** — could this be said in meaningfully fewer words without losing
  information?

## 3. Risk classification

Tag every finding:

- 🟢 — safe to cut, zero information loss.
- 🟡 — cut loses minor nuance; low risk.
- 🔴 — touches something load-bearing: a rule that exists to prevent a repeat
  of a past incident, or a hard invariant. Don't touch without explicit
  sign-off, and say why it's load-bearing in the finding.

When in doubt between 🟡 and 🔴, classify up (🔴) — a wrongly-cautious flag
costs one glance; a wrongly-cut invariant costs a repeat incident.

## 4. Output

**Contradictions first**, in their own list above the table, regardless of
token size — these are correctness issues, not hygiene issues, and hiding one
in a low-token table row buries the thing that matters most.

Then a ranked markdown table, highest tokens-saved first:

| est. tokens saved | risk | file | finding | evidence | suggested fix |
|---|---|---|---|---|---|

- **finding** — one line, plain description.
- **evidence** — a short verbatim quote (not a paraphrase) so you can locate it.
- **suggested fix** — concrete and includes a destination: "cut", "move to
  `.claude/skills/<name>/SKILL.md`", "compress to one line: '<proposed
  line>'", "merge with <other file>'s statement of the same fact".

## 5. Report-only — hard rule

This skill **never edits any audited file**, including a 🟢 zero-risk cut. No
`Edit`/`Write` calls against files in scope, ever — not "just this one
obvious one." All fixes are yours to apply by hand, or a separate follow-up
action you explicitly ask for after reviewing the table. Do not offer to
auto-apply as part of running this skill.

No `log.md` entry, `index.md` update, or commit — this skill produces a
report in the conversation only and touches nothing in the vault.
