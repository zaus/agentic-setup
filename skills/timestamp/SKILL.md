---
name: timestamp
description: Generate a timestamp in a consistent, context-appropriate format for use in filenames, logs, displays, databases, and other purposes.
argument-hint: "Optional: value, context/style, format, zone/timezone, dateonly, timeonly, withseconds"
---

When asked to generate a timestamp, obtain a base date/time (see `value` parameter), then format and return it according to the parameters below.

## Parameters (all optional)

### `value`
The date/time to format. If not provided, fetch the real current time via a terminal command (`Get-Date` in PowerShell on Windows, `date` on Linux/macOS) — do **not** use a static date from context.

Accepted inputs: any human-readable date/time string (e.g. `2026-01-15 09:30`, `next Friday`, `2025-12-31T23:59:59`). Parse it before applying all other formatting parameters.

### `context` / `style`
The intended use of the timestamp. Drives default format selection when `format` is not explicitly set.

| Value | Resulting default format |
|---|---|
| `filename` | `YYYY-MM-DD_HHMMSS` (no colons, safe for paths) |
| `log` | `YYYY-MM-DD HH:MM:SS` |
| `display` | Short human-readable per OS locale |
| *(unset)* | Infer from surrounding prompt context; fall back to `db` default |

### `format`
Explicit output format. Overrides context-driven defaults.

| Value | Example output |
|---|---|
| `long` / `long-date` | `Saturday, May 23, 2026 2:45:00 PM` or `Saturday, 23 May 2026 14:45:00` following OS preference |
| `short` / `short-date` | `05/23/2026 2:45 PM` or `23/05/2026 14:45` following OS preference |
| `iso` | `2026-05-23T14:45:00+02:00` (ISO 8601 with offset) |
| `rfc` | `2026-05-23T14:45:00+02:00` (RFC 3339) |
| `db` / `sql` / `data` | `2026-05-23 14:45:00` |
| explicit pattern (e.g. `DD-MM-YYYY HH:MM`) | Formatted accordingly |
| *(unset)* | Defaults to `db` |

### `zone` / `timezone`
Timezone for the output. Defaults to the local system timezone.

- `local` — system local time (default)
- `utc` — UTC/Zulu time
- Named zone, e.g. `America/New_York`

### `dateonly`
Return only the date portion (e.g. `2026-05-23`). Mutually exclusive with `timeonly`. Defaults to `false`.

A **flag parameter**: considered `true` if set to `true`, `yes`, `on`, `1`, or if simply mentioned without a value (e.g. "dateonly" or "date only" in the prompt).

### `timeonly`
Return only the time portion (e.g. `14:45`). Mutually exclusive with `dateonly`. Defaults to `false`.

A **flag parameter**: considered `true` if set to `true`, `yes`, `on`, `1`, or if simply mentioned without a value.

### `withseconds`
Include seconds in the time portion. Defaults to `false` (minutes precision only, e.g. `14:45`).

A **flag parameter**: considered `true` if set to `true`, `yes`, `on`, `1`, or if simply mentioned without a value (e.g. "with seconds", "include seconds", "withseconds").

## Behavior summary

1. If `value` is provided, parse it as the base date/time. Otherwise, fetch the real current time via terminal — do **not** rely on a static date from context.
2. Apply timezone conversion if `zone` differs from local.
3. Apply `dateonly` / `timeonly` filtering after formatting.
4. Strip seconds from the time portion unless `withseconds` is true or the chosen format explicitly includes them (e.g. `iso`, `rfc`, `db`).
5. Return the formatted timestamp as plain text, ready to paste.