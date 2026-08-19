---
name: ingest
description: Process a source into the wiki — extract entities, create/update pages, update index/hot/log. Triggers: 'ingest <file>', a new file in .raw/_inbox/.
---

# Ingest

Mechanics only — TODO markers below are yours to fill in during `/onboard`
or by hand.

1. Read the source (from `.raw/`, or a live source you paste/fetch). If it's
   new raw material, save it under `.raw/` first — sources are immutable,
   append-only.
2. Extract entities and facts worth keeping. <!-- TODO: how compressed should
   this be — paraphrase vs. quote? Your call. -->
3. For each entity: does a wiki page already exist (check `index.md`)?
   - Yes → update it. If the new info contradicts what's there, flag the
     conflict on the page rather than silently overwriting.
   - No → create it from `_templates/<type>.md`.
4. Update `index.md` (one line per touched/new page) in the same pass.
5. <!-- TODO: what counts as significant enough to update hot.md? Define
   your own bar, then note it here. --> Update `hot.md` if this ingest
   changes something that meets that bar.
6. Append one `log.md` entry: `## [YYYY-MM-DD] ingest | <title>`.
7. Commit.
