---
name: prompt-snapshot
description: Saves a summarized version of the agent/prompt conversation to a history folder
---

Save a summarized version of the prompt conversation (both input and output) in a markdown file with a YAML front matter header that includes a description of the purpose and effect of the conversation, timestamp (YYYY-MM-DDTHH:MM:SS in local time), model used, and an `applyTo` property that specifies a glob pattern for relevant files (input and output). The content of the markdown file should be the exact prompt used and a concise summary of the conversation, highlighting key points and decisions made during the discussion. This file should be saved in the root workspace/folder of the affected file(s) under `.prompt-snapshots` subdirectory beginning with the timestamp (`YYYY-MM-DD HHMM_SS`) in the filename for sorting by execution time followed by a very short title for the conversation.