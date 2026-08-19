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

Report findings, don't auto-fix silently — let the user decide
update/merge/archive per finding.
