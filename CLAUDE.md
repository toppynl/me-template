# me — Personal Brain & Assistant (template)

Starter kit for a personal knowledge base an LLM writes and maintains for you.
You curate sources and review diffs; the LLM does the reading/writing.
Pattern: [karpathy's LLM wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f).

This is a **template**, not a finished system. Run `/onboard` first (see
`.claude/skills/onboard/`) — it interviews you and generates the parts that
should reflect *your* workflow, not the defaults shipped here.

## What's fixed vs. what you decide

**Fixed (the pattern itself):**
- Three-layer read: a short "hot" snapshot → an index catalog → the full pages.
- `wiki/` = durable knowledge, one entity per file, typed frontmatter, bidirectional `[[wikilinks]]`.
- `.raw/` = immutable source material — appended, never edited.
- `now/` = current, fast-changing state (as opposed to durable knowledge).
- `log.md` = append-only operation log, one line per operation.

**Yours to decide (onboarding will help you set these, or set them yourself):**
- How much of `hot.md` you want, what counts as "hot," how often you refresh it.
- Which entity types you actually need — the ones below are a **starting
  suggestion**, not a requirement. Drop what you don't use, add what you do.
- Staleness thresholds, word limits, review cadence — all workflow taste.
- Whether you want a daily-brief/inbox-triage style automation at all — that's
  a heavy, opinionated layer; most people don't need it on day one.
- Your own personas/voice for anything drafted *as* you, if you want that.

## Layout

```
hot.md         short current-context snapshot (define your own bar for "significant")
index.md       catalog: every page, one line, grouped by type
log.md         append-only operation log: `## [YYYY-MM-DD] <op> | <title>`
me/            who you are and how you want the assistant to work with you
now/           fast-changing current state (tasks, briefs, whatever you track)
wiki/          the knowledge base itself — see suggested types below
.raw/          immutable sources — read, never modify
_templates/    page skeletons per entity type
.claude/       skills — starting mechanics only, adjust freely
archive/       superseded/obsolete pages (still linkable)
```

## Suggested entity types (starting point — edit this list)

These came from a working instance of this pattern and are a reasonable
starting taxonomy, not a rule. Rename, merge, or drop any of them.

| type | why it existed | extra fields it used |
|---|---|---|
| `person` | people you deal with | `role`, `org`, `affiliation` |
| `organisation` | companies/teams | `segment`, `parent` |
| `system` | software/products you own or depend on | `owner`, `repos` |
| `vendor` | external suppliers/services | `category`, `owner`, `used_by` |
| `decision` | a choice that was made, point-in-time | `date`, `decided_by`, `affects`, `decision_type` |
| `concept` | ideas, personas, patterns worth naming | — |
| `policy` | a standing rule a decision established | `scope`, `owner`, `established_by` |
| `event` | point-in-time snapshot (incident, launch, milestone) | `date`, `kind`, `affects` |
| `topic` | navigation hub grouping many related pages | — |
| `initiative` | ongoing work with a lifecycle | `phase`, `stake`, `owner`, `target` |
| `risk` | something that could go wrong, tracked independently | `likelihood`, `impact`, `state`, `owner` |
| `metric` | a number worth tracking, definition not live value | `definition`, `target`, `source`, `owner` |
| `stance` | your own opinionated, conditional advice on a topic | `topic`, `scope`, `owner` |

If you're not sure which of these you need, start with `person`, `organisation`,
`system`, `decision` — the rest earn their place once you notice you keep
wanting them.

## Base frontmatter (every page)

```yaml
---
type: <one of your entity types, or "meta">
title: "Display Name"
status: seed | developing | mature | evergreen   # optional maturity ladder, or drop it
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: []
related: []          # wikilinks
---
```

Extend per type as needed — see `_templates/` for skeletons matching the
suggested types above.

## Conventions (adjust to taste)

- Filenames: kebab-case, unique across the vault (wikilinks don't carry paths).
- Links: `[[wikilink]]`, bidirectional — add the back-reference when you add a link.
- One entity per file.
- Log entries: `## [YYYY-MM-DD] <op> | <title>` so `grep "^## \[" log.md` works.

## Operations

`.claude/skills/` ships three minimal skills as a starting point — `ingest`,
`query`, `lint` — each with the mechanics only, no prescriptive rules baked
in. Read each `SKILL.md` and edit the TODOs to match how you actually want to
work. Add your own skills for anything else you want automated (briefs,
triage, meeting prep, ...) — those are entirely workflow-specific and this
template intentionally does not ship them.

## Getting started

1. Run `/onboard` (or read `.claude/skills/onboard/SKILL.md` and follow it manually).
2. It will ask what you track and how you work, then generate your own
   `hot.md`, trim the entity-type list above to what you need, and seed a
   handful of starter pages.
3. Commit as you go — this is meant to be read through `git log`.
