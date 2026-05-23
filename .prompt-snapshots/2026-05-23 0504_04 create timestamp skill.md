---
description: Create the timestamp skill SKILL.md from the draft description
timestamp: 2026-05-23T05:04:04
model: Claude Sonnet 4.6
applyTo: skills/timestamp/**
---

## Prompt

> create a timestamp skill as described in the file (and overwrite this file with the definition)

> I like it; let's also have it accept an explicit `value` argument if the user wants a specific timestamp rather than the real current time. I also want the flag options to not only accept true/false or yes/no, but even just mentioning them without a value should be considered "positive" (i.e. true). Update prior prompty-snapshot accordingly.

> please add an argument hint to the frontmatter

> that's close but not the valid frontmatter key for VS Code Agent; it should be `argument-hint`

## Summary

Rewrote `skills/timestamp/SKILL.md` from an informal requirements draft into a proper skill definition with YAML front matter. The skill instructs the agent to:

- Obtain the real current time via a terminal command (`Get-Date` / `date`) rather than using context-injected dates, unless an explicit `value` is provided.
- Accept optional parameters: `value`, `context`/`style`, `format`, `zone`/`timezone`, `dateonly`, `timeonly`, `withseconds`.
- `value` accepts any human-readable date/time string; if omitted, real current time is fetched via terminal.
- Default format is `db` (`YYYY-MM-DD HH:MM:SS`) when no format or context is provided.
- `filename` context uses path-safe format (`YYYY-MM-DD_HHMMSS`).
- Seconds are omitted by default unless `withseconds` is true or the format inherently includes them.
- `dateonly`, `timeonly`, and `withseconds` are **flag parameters**: truthy if set to `true`/`yes`/`on`/`1` or simply mentioned without a value in the prompt.
- `dateonly` and `timeonly` are mutually exclusive.
- Added `argument-hint` to skill frontmatter so callers can quickly see supported optional arguments.
