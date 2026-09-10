# me-template

Starter kit for a personal/team knowledge base that an LLM (Claude Code)
writes and maintains for you — you curate sources and review diffs, the
assistant does the reading/writing. Based on
[karpathy's LLM wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
pattern.

## What this is

A thin scaffold, not a finished system:

- Folder structure + typed YAML frontmatter schema for a wiki of entities
  (people, systems, decisions, ...)
- Five minimal skills (`ingest`, `query`, `lint`, `context-audit`,
  `correction-capture`) — mechanics only, no opinionated rules baked in
- An optional `## Timeline` convention (see `CLAUDE.md`) for pages that
  accumulate dated status over time, plus a `SessionEnd` auto-commit hook
  (`.claude/scripts/vault-autocommit.sh`) — both opt-out, not mandates
- An `onboard` skill that interviews you and turns the scaffold into
  something that fits *your* workflow, followed by a `usecases` skill that
  turns "it's set up" into 1-2 real things tried, tailored to what onboarding
  learned about you — say "usecase brainstorm" any time you want that again

It deliberately does **not** ship a specific person's rules, thresholds, or
automation habits (daily briefs, personas, staleness cutoffs, etc.) — those
are workflow taste. You build those yourself, if and when you want them,
using this as the base layer. One optional, disabled-by-default example is
included for illustration: `.claude/skills/daily-brief-example/` sketches
the shape of a recurring pull-from-an-external-source-then-ingest routine
(with `_templates/integrations.md` explaining the general wiring pattern,
using the open-source `gws` Google Workspace CLI as a worked example). It's
not wired into onboarding and safe to delete. A second, equally optional
example covers drafting-as-you: `me/voice.md` +
`.claude/skills/voice-persona-example/` sketch a voice profile, an
outward-facing/private-sparring persona split with an explicit exposure
boundary, and a final pass for stripping generic AI-writing tells before a
draft goes out — again just a shape to build from, not shipped content.

## Use it

```bash
git clone https://github.com/toppynl/me-template.git my-vault
cd my-vault
claude
```

Then run `/onboard` (or just say "onboard me" / "set up my vault") — it
walks you through what to track and how you want to work, and rewrites
`CLAUDE.md` and `hot.md` to match.

Full pattern explanation, folder layout, and the suggested (editable) entity
taxonomy live in [`CLAUDE.md`](CLAUDE.md).

## Layout

```
hot.md         current-context snapshot (you define what "hot" means)
index.md       catalog of every wiki page, one line each
log.md         append-only operation log
me/            who you are, how you want the assistant to work with you
now/           fast-changing current state
wiki/          the knowledge base — people/organisations/systems/... (edit to taste)
.raw/          immutable source material
_templates/    frontmatter skeletons per entity type
.claude/       skills — onboard, usecases, ingest, query, lint, context-audit,
               correction-capture; scripts/ for the optional auto-commit hook
archive/       superseded/obsolete pages
```
