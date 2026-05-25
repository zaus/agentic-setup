# Idealized Agentic Filesystem Setup

Vendors (Copilot, Claude, Gemini, Cursor, etc) support their own custom configurations, but may also support the [open format Agent Skills](https://agentskills.io/home) from a common/agnostic folder.  Similarly, the open-standard [agents specification](https://agents.md/) (see also [OpenHands spec](https://docs.openhands.dev/sdk/guides/agent-file-based)) supports subagents by recursive proximity.


(aside) need to copy the great writeup Claude did

- `<User Profile>` (`~/` or `%USERPROFILE%`)
	- `.agents/` -- canonical, agnostic
		- `AGENTS.md` -- core instruction file describing desired behaviors, standard "do's" and "don'ts" (such as: always use tabs, never use Python b/c it's not installed, etc).  Will encourage following at least `coding-sop` and `prompt-snapshot` skills.
		- `agents/` -- file-based [subagents](https://docs.openhands.dev/sdk/guides/agent-custom) for particular personas and workflows, such as 'code reviewer' or 'pre-vis cleaner'.  Ideal for context isolation and delegated execution (see vendor-specific references for more background).  Consider that your vendor of choice may already have built some better ones.
		- `skills/` -- all shared agent skills; again before creating one consider your vendor-of-choice may already have some, like a skill to create skills ([Claude](https://github.com/anthropics/skills/blob/main/skills/skill-creator/SKILL.md) or [Copilot](https://code.visualstudio.com/docs/copilot/customization/agent-skills#_create-a-skill))
		- `instructions/` -- automatically mapped specific behavioral rules to targeted files or folders.  Files within may declare frontmatter with `applyTo` and `paths` globs for scoping to targets.
	- `.copilot/` -- vendor-specific files for GitHub Copilot; note that different modalities (CLI, IDE chat, desktop app) treat contents differently
		- `copilot-instructions.md` -- core instruction file idomatic to Copilot, accounting for vendor-specific quirks.  Treated as a "strongly-worded prompt".  MUST **strongly** reference `AGENTS.md` file, and ensure that any instructions provided in this file are consistent with the core behaviors outlined in `AGENTS.md`.
		- `skills/` -- symlink to canonical skill folder
		- `prompts/` -- (optional) custom prompts for Copilot; this folder seems to be slowly deprecated in favor of agent skills
		- `agents/` -- symlink to canonical sub-agents folder; [see more Copilot-specific (technically Visual Studio Code specific) guidance](https://code.visualstudio.com/docs/copilot/agents/subagents)
			- `config.json` -- contains possibly sharable details like alway-approved folders, but needs more research into possibility of sharing
		- `instructions/` -- symlink to canonical instructions folder; expects frontmatter with `applyTo` globs for scoping to targets
	- `.claude/` -- vendor-specific files for Claude
		- `CLAUDE.MD` -- core instruction file idiomatic to Claude, accounting for vendor-specific quirks.  Applied as absolute instructions.  MUST `@import '../.agents/AGENTS.md'`.
		- `agents/` -- symlink to canonical sub-agents folder; [see more Claude-specific guidance](https://code.claude.com/docs/en/sub-agents)
		- `skills/` -- symlink to canonical skill folder
		- `rules/` -- symlink to canonical instructions folder; expects frontmatter with `paths` globs for scoping to targets