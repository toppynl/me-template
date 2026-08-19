# Wiring up an external source (pattern, not a requirement)

This is not a page template like the others in `_templates/` — it's notes on
the general pattern for pulling an external source (email, calendar, tasks,
chat, docs) into this vault, if and when you want that. Nothing in this
template does this for you automatically; see
`.claude/skills/daily-brief-example/` for one illustration of the shape.

## The pattern, in general

1. **Install a CLI or client for the source.** Worked example: `gws`
   (https://github.com/googleworkspace/cli), an open-source CLI for Google
   Workspace (Gmail, Calendar, Chat, Keep) — publicly installable, not
   specific to any one person or company. It's one example among many; any
   source with a CLI, API, or exportable data works the same way (a task
   tracker's CLI, a notes app's export, a chat platform's API).
2. **Authenticate it yourself, outside this vault.** For `gws` specifically:
   create a Google Cloud project, enable the APIs you need, download a
   `client_secret.json` for an OAuth client, and run the tool's own auth
   flow to get a token. Whatever the source, keep credentials out of the
   repo — this is local machine/environment setup, not something that
   belongs in `.raw/` or `wiki/`.
3. **Decide what's worth pulling in.** Most of a raw feed (inbox, calendar,
   chat) is noise for a knowledge base. Decide your own filter before
   automating anything — e.g. "only threads I replied to," "only meetings
   with people outside my team." This is workflow taste; this template
   doesn't guess it for you.
4. **Land the kept material under `.raw/`.** New file, immutable once
   written — sources are appended, never edited or deleted.
5. **Run it through `ingest`.** See `.claude/skills/ingest/SKILL.md` — that's
   what turns raw material into wiki pages, index entries, and (if it clears
   your bar) a `hot.md` refresh.

## Notes

- This pattern works for a one-off ("pull this one thread and ingest it")
  just as well as a recurring routine — you don't need automation to use it.
- If you do want it recurring, that's what
  `.claude/skills/daily-brief-example/` sketches — deliberately thin, meant
  to be rewritten for your actual sources rather than used as-is.
