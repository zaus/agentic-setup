---
name: prompt-snapshot
description: Saves a summarized version of the agent/prompt conversation to a history folder after significant interactions or file changes
argument-hint: (optional) description, title, applyTo, workspaceRoot, append
---

# Prompt Snapshot Skill

Save a summarized version of the prompt conversation (both input and output) in a markdown file with YAML frontmatter and store it within the same workspace for later reference. This allows owners and agents to keep a persistent, organized record of their interactions and decisions over time.

If asked to append, you should append the latest conversation effects as new content to the end of the latest existing file rather than creating a new file.


## Filename and location

- Location: `.prompt-snapshots/` at the root of the workspace/folder of the affected files.
- Filename: `<timestamp> <short title>.md` where
  - `timestamp` is the current moment formatted `yyyy-MM-dd HHmm` for chronological file sorting and scanability.
  - `short title` is a concise summary of the conversation for scanability in chronological lists


## Required frontmatter

- `description`: purpose and effect of the conversation
- `timestamp`: current moment for logging
- `model`: agent (e.g. Github Copilot, Claude Code) and model (e.g. Claude Haiku 4.5, GPT-5.4 mini) used to answer the user prompt
- `applyTo`: glob pattern for relevant input/output files


## Content requirements

- Include the exact user prompt(s).
- Include a concise summary of key points, decisions, and changes made.
- Keep the title short and specific for scanability in chronological lists.


## Timestamp Behavior

Use a deterministic shell script like Powershell's `Get-Date -Format "<desired>"` as the source of truth for all snapshot times.  Provide in local time.