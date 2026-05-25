---
name: prompt-snapshot
description: Saves a summarized version of the agent/prompt conversation to a history folder after significant interactions or file changes
argument-hint: Optional: description, title, applyTo, workspaceRoot
---

# Prompt Snapshot Skill

Save a summarized version of the prompt conversation (both input and output) in a markdown file with YAML frontmatter and store it within the same workspace for later reference. This allows owners and agents to keep a persistent, organized record of their interactions and decisions over time.

## When to use

Use this skill after significant interactions, decisions, or file changes.  If it's a continuation or refinement of an ongoing conversation, then update the previous snapshot with a new entry rather than creating a new file, to keep related information together, unless the new snapshot is about a distinct topic or decision or deviation that warrants its own file for clarity.


## Filename and location

- Location: `.prompt-snapshots/` at the root of the workspace/folder of the affected files.
- Filename: `<timestamp> <short title>.md` where
  - `timestamp` is the current timestamp formatted for chronological file sorting and scanability.
  - `short title` is a concise summary of the conversation for scanability in chronological lists


## Required frontmatter

- `description`: purpose and effect of the conversation
- `timestamp`: local timestamp for logging (matches filename timestamp)
- `model`: the agent and model used to answer the user prompt
- `applyTo`: glob pattern for relevant input/output files


## Content requirements

- Include the exact user prompt(s).
- Include a concise summary of key points, decisions, and changes made.
- Keep the title short and specific for scanability in chronological lists.


## Timestamp skill integration (required)

Use the `timestamp` skill as the source of truth for all snapshot times.