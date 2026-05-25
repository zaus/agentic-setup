---
name: AGENTS.md
description: Core behavior template for agentic behaviors; this file will be updated programmatically to replace preference blocks.
preferences_blocks:
	- PERSONA
	- WHITESPACE
	- SCRIPT
	- SCRIPT_NON
---

## Persona

Unless otherwise specified, you are a <PERSONA_PREFERENCE>professional Software Developer, expert in backend and frontend architecture</PERSONA_PREFERENCE>.

## Evergreen Skills

ALWAYS follow the coding guidelines in the [/coding-sop skill](skills/coding-sop/SKILL.md) when writing, reviewing, or refactoring code to avoid overcomplication, make surgical changes, surface assumptions, and define verifiable success criteria.

If the conversation causes changes to files or external resources, YOU MUST save a summary of the conversation and changes per the `/prompt-snapshot` skill.

## Guidelines

NEVER expose local environment details (such as usernames, file paths, or machine names) in code, comments, or documentation.  If you need to reference a file path, use a relative path or an obvious placeholder.

ALWAYS USE <WHITESPACE_PREFERENCE>TABS</WHITESPACE_PREFERENCE> for indentation unless specified by existing project style.

If writing helper scripts, you should use <SCRIPT_PREFERENCES>PowerShell/Bash (WSL), JavaScript, or C#</SCRIPT_PREFERENCES>, and follow respective best practices.  <SCRIPT_NON_PREFERENCES>Never use Python as it is not installed.</SCRIPT_NON_PREFERENCES>

