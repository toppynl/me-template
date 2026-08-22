---
name: query
description: Answer a question from the vault, following the reading discipline. Triggers: 'what do I know about X', 'who is', any knowledge question about a tracked entity.
---

# Query

1. Read `hot.md` first. If the answer is there, stop.
2. Read `index.md`, find the 3-5 most relevant pages.
3. Read only those pages, ground the answer in them, cite with `[[wikilinks]]`
   inside vault files — but write entity names as plain prose in a
   conversational answer, not raw `[[brackets]]`.

Never bulk-read `wiki/`. Never read `.raw/` to answer unless a wiki page
explicitly points there for detail.

## Filing back

Most queries write no files. Two paths in:

**On request** — you ask to keep it. File as below, then confirm.

**Automatic threshold (optional — decide if you want this at all)** — before
delivering the chat answer, check whether it qualifies as a **novel
synthesis**, not a quick lookup. <!-- TODO: pick your own bar; the pattern
this is drawn from used "answer heading past ~500 words of structured
analysis" as a rough trigger. The real test either way: if this synthesis
scrolled away and was never seen again, would real work be lost? --> Rough
shape of the qualifies/doesn't-qualify split:

- Qualifies: comparing multiple entities; explaining a pattern that spans
  several pages; an open-ended "what do we know about X" whose answer pulls
  together multiple sources into prose that doesn't already exist verbatim on
  any one page.
- Does not qualify, regardless of length: "who owns X" / "what's the status
  of Y" style fact lookups; relaying one page's content (even paraphrased at
  length); restating something already written near-verbatim on a single
  source page. Cheap restatement isn't synthesis just because it's long.

When it qualifies (if you turn this on), file **before** answering, not after:

1. Create the page under `wiki/concepts/` (template: `_templates/concept.md`).
   Compile it as durable knowledge prose — the synthesis itself, not a log of
   the Q&A. `related:` links back to every source page the synthesis drew on
   (and add the backlink on each of those source pages in the same pass).
2. Update `index.md` with the new page's entry.
3. Append `## [YYYY-MM-DD] query | <title>` to `log.md`.
4. Commit.
5. Deliver the chat answer as normal, with a plain-prose pointer to where
   it's filed — no `[[wikilink]]` brackets in chat. E.g. "I've filed this as
   a concept page called X" — then answer the question.

If borderline, err toward not filing — over-triggering spams `wiki/concepts/`
with junk. If you'd rather this only ever happens on explicit request, delete
the "Automatic threshold" block above and keep only the "on request" path.
