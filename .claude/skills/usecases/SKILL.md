---
name: usecases
description: Helps someone with a freshly onboarded vault figure out what to actually do with it next — a short, tailored shortlist of concrete ideas, grounded in their own connected sources where one exists, instead of an empty page. Triggers: 'usecases', 'usecase brainstorm', 'wat kan ik hiermee', 'what should I do with this', end of the onboard skill.
---

# Usecases

Onboarding tells someone what this vault *is*. This skill is about what to
*do* with it — the gap most people hit right after: a working vault, a blank
page, no idea where to start.

## Before suggesting anything

Read `me/about.md`, `log.md`'s onboarding entry, and whatever `me/how-to-use.md`
says about sources (step 9) and automation appetite (step 6) — don't ask
again what onboarding already answered. If those files don't exist yet
(this skill run standalone, before onboarding), ask the two questions
directly: what do you feed this thing, and do you want it doing things on a
schedule or only when asked.

## Look before you suggest, where there's something real to look at

For the two patterns below that have a live, inspectable external source
(inbox, calendar), don't describe the pattern in the abstract and ask the
person to imagine how it'd apply to them — go look at their actual, real
data first, then make the suggestion concrete with what you found. A
suggestion built on three real senders from someone's actual inbox lands
completely differently than "you could teach it rules about your mail."

This only works if a connector is actually available and authenticated —
your connected mail tool (a Gmail MCP connector, a Google Workspace CLI like
`gws`, or similar) or your connected calendar tool. If nothing is connected,
say so plainly and skip straight to describing the pattern abstractly for
that item, or drop it from the shortlist entirely — never fabricate example
emails or events to fake the effect.

**Inbox help.** If a mail connector is available, pull a read-only look at
the last 20–30 inbox messages (headers/metadata only — sender, subject,
date; no need to read full bodies for this). Look for real, observable
patterns: a sender or two that shows up repeatedly (a newsletter, a
notification bot), a cluster of same-shaped mail (receipts, invoices), a
thread or two from the same one or two people. Then propose exactly *one*
small rule grounded in what you actually saw — "you've got 6 messages from
`notifications@X` in the last 20 — want me to treat those as low-priority
from now on?" — not a generic "I could learn your mail rules" pitch. If the
inbox is basically all one-off human mail with no repeating pattern, say
that honestly rather than inventing a pattern to justify the pitch.

**Meeting prep.** If a calendar connector is available, pull 1–2 real
upcoming events. For each, check what the vault already knows about the
people or topic involved (it may be nothing — the vault is new) and say
so concretely: "you've got 'sync with X' on Thursday — the vault doesn't
have anything on X yet, this would be a good first real page" or "there's
a meeting with Y Tuesday — here's the one thing already in the vault about
them." Either outcome is a useful, concrete answer; don't skip the pattern
just because the vault currently comes up empty — an honest "nothing yet"
is still more useful than the abstract pitch.

Never go further than looking and reporting what you found — this is
reconnaissance to make a suggestion concrete, not the start of building
anything. No rule gets written down, no filter created, until the person
says yes to trying it.

## The shortlist

These are generic patterns, not prescriptions — each is a shape, not a
finished skill to copy-paste. Present 2–3 that fit what you learned above,
not all of them; a long menu of unrequested ideas is noise, not help.

1. **Morning overview** — before you start work, ask it to pull together
   what's on today: calendar, mail that needs a reply, open loops. Useful
   almost immediately, but start by asking for this once by hand ("what's on
   today") before considering anything scheduled — a scheduled routine is a
   later step, not day one.
2. **Inbox help** — if a mail connector is available, look at recent real
   mail first (see above) and lead with what you found; otherwise describe
   the pattern — teach it a few of your own rules for handling mail
   ("newsletters can be archived", "anything from my manager stays
   visible") and let it apply them. Either way: start with one rule, watch
   it get applied correctly a few times, then add the next — not a full
   ruleset up front. (The pattern of a small ruleset file that grows one
   proven rule at a time, and stays cautious/asks when a match isn't
   confident, is the same shape worth keeping in mind if this grows — but
   don't build that file from a single example; let it earn its structure.)
3. **Client/vendor relationship memory** — for anyone who deals with the
   same external contact again and again (a customer, a supplier, a partner),
   keep a page on them: what's been promised, what's gone wrong before, how
   they like things handled. Unlike meeting prep below, there doesn't need
   to be a meeting on the calendar to trigger it — the moment to use it is
   just "I'm about to call or email this person again" instead of digging
   back through old threads. Start with the one contact you deal with most
   and add to their page after the next real interaction, rather than
   trying to backfill everyone you've ever dealt with.
4. **Meeting prep** — if a calendar connector is available, look at 1-2 real
   upcoming events first (see above) and show concretely what the vault can
   or can't yet say about them; otherwise describe the pattern — before
   talking to someone or walking into a meeting, ask what the vault already
   knows about them or the topic. Worth suggesting even on day one if a
   calendar is connected, since "nothing yet, let's fix that" is itself a
   useful first real page; without a connector, this only pays off once
   there's something in the vault to find, so suggest it after a few real
   entries exist instead.
5. **Shift/handover notes** — for anyone working shifts or handing work off
   to a colleague, keep a running note of what's in progress and what the
   next person needs to know. This earns its place the first time something
   gets dropped between shifts because it only lived in someone's head; try
   it for a single handover and see whether the next person actually finds
   it useful before treating it as the default.
6. **Catching decisions** — the moment something real gets decided (in a
   thread, a call, a meeting), say so and have it written down immediately.
   The value is catching it *before* it dissolves into a mail thread nobody
   re-reads.
7. **Recurring problem log** — when the same issue keeps coming back (a
   customer complaint that repeats, an operational hiccup, the same piece of
   equipment or step failing again), log each occurrence as it happens
   instead of treating it as a fresh fire every time. The payoff only shows
   up after a few entries, once the pattern is visible instead of guessed
   at — so start logging as soon as something repeats for the second time,
   not after the tenth.
8. **Personal runbook** — the first time you work out how to do something
   fiddly in a system you use for work (an ERP, an internal tool, any
   process with steps you always forget), write it down right after, while
   it's fresh. Cheaper than re-solving it next month or asking a colleague
   the same question again; start with the one thing you've already had to
   figure out twice, not a full manual of everything you know.
9. **Processing something real** — hand it a document, a transcript, a messy
   set of notes, and ask for a page out of it. This is the fastest way to see
   whether the vault's structure actually fits your material.
10. **Notes per person you manage** — only relevant if you have direct
    reports: a private note per person, with recurring themes, commitments
    made, and things they're working on. This is data about someone else,
    not you, so be deliberate about it — it's for your own recall, not a
    substitute for whatever official HR process exists, and it should stay
    about their work (what they did, said, or committed to), never personal,
    health, or family information. Start with the one person you talk to
    most, and keep to what you'd be comfortable being asked about directly.
11. **Fixing mistakes on the spot** — if it gets something wrong, just say so
    ("that's not right, it's actually X") and have it correct the page
    immediately, right then — not filed away for later.

## How to run this

1. Pick 2–3 that match what's known about them (heavy mail volume → lead
   with inbox help; frequent contact with the same external people
   (customers, suppliers, partners) → lead with client/vendor relationship
   memory; shift work or regular handoffs to colleagues → lead with
   shift/handover notes; has direct reports → surface notes per person you
   manage; low automation appetite → lead with processing/decisions, skip
   morning overview and inbox help entirely rather than mention and dismiss
   them).
2. For inbox help and meeting prep, do the live look-first step above before
   presenting them, so the pitch is already concrete. For the rest, describe
   in one or two sentences and ask if they want to try it right now, on
   something real of theirs — not a hypothetical.
3. Ask if they want to try it right now, on something real of theirs.
4. If they pick one: do it live, once, on real content (reuse what you
   already pulled for inbox help / meeting prep rather than pulling again).
   Don't build a recurring routine or a rule file from a single example —
   that's a decision for after it's proven useful a few times, not a
   day-one default.
5. If they pick none right now: say that's fine, and that asking for
   "usecase brainstorm" again later works the same way — nothing is lost by
   not deciding today.
6. If something they tried live actually lands — they come back to it, or
   ask for it again a few times — say so out loud and name what graduating
   it would look like: a scheduled routine (it runs the pattern on its own,
   e.g. every morning) or a small ruleset file that grows one rule at a time
   (like the inbox pattern above). That's the moment a usecase becomes a
   skill — a repeatable thing this vault does, not a one-off you asked for.
   Don't build it unprompted; name the option and let them decide when
   they're ready.

Don't turn this into a sales pitch for automation. Someone who says "I just
want to ask it things sometimes" has a completely valid usecase already —
confirm that's fine and stop there, rather than pushing the other five.
