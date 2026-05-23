Create a skill for generating timestamps in a consistent format.  This skill can be used by an agent to generate timestamps for various purposes, such as logging, file naming, or scheduling.

It should take the following optional inputs that if not provided will use their default values.

- `context` or `style`: the context in which the timestamp will be used, which will help determine the appropriate format for the timestamp.  Expect options like 'filename', 'log', 'display', etc.  For example, if the context is a file path, it should return the timestamp in a format that is suitable for use in a filename (e.g., `YYYY-MM-DD_HHMMSS`), while if the context is for logging, it should return the timestamp in a format that is suitable for logging (e.g., `YYYY-MM-DD HH:MM:SS`).  If not provided, it should consider the context of the request/prompt.

The following are formatting options, with some convenience flags for common modifiers to an explicit format that may also be provided:
- `format`: the primary indication of how to format the timestamp.  Expect arguments like:
  - 'long' or 'long-date' for the current OS' human-readable format (e.g., `Monday, January 1, 2020 12:00:00 PM`)
  - 'short' or 'short-date' for a more concise human-readable format (e.g., `01/01/2020 12:00 PM`)
  - 'iso' or ISO 8601
  - 'rfc' or RFC 3339
  - 'db' or 'sql' or 'data' for a format suitable for databases (e.g., `YYYY-MM-DD HH:MM:SS`)
  - explicit format like 'DD-MM-YYYY HH:MM'
  - If no format is specified, it should default to 'db'.
- `zone` or `timezone`: the timezone to use for the timestamp, e.g. 'local' or 'utc' or a specific timezone like 'America/New_York'.  If not provided, it should default to the local timezone of the system where the skill is being executed.
- `dateonly`: a boolean/yes-no flag or positive mention that indicates whether to return only the date portion of the timestamp (e.g., `YYYY-MM-DD`) without the time.  If not provided, it should default to `false`, meaning that the full timestamp with both date and time will be returned.  Opposite of and mutually-exclusive with `timeonly`.
- `timeonly`: a boolean/yes-no flag or positive mention that indicates whether to return only the time portion of the timestamp (e.g., `HH:MM:SS`) without the date.  If not provided, it should default to `false`, meaning that the full timestamp with both date and time will be returned.  Opposite of and mutually-exclusive with `dateonly`.
- `withseconds`: a boolean/yes-no flag or positive mention that indicates whether to include seconds in the timestamp.  If not provided, it should default to `false`, meaning that seconds will not be included in the timestamp (e.g., `YYYY-MM-DD HH:MM`).