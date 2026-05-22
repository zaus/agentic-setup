
# Agentic Setup

A comprehensive guide and starter pack for configuring AI agents (e.g. Copilot and Claude) with shared skills and instructions.


## Overview

This project helps developers establish consistent agentic environments by providing:
- 🚀 **Standardized instruction frameworks** - Pre-built configurations for immediate use
- 🔧 **Configuration Tools** - Quick setup utilities for common environments (to make ^^^)
- 📋 **Shared Skills Library** - Reusable capabilities sharing definitions between multiple AI assistants
- 📖 **Best practices for agent orchestration** - tips and tricks to help them work better

BUT, the landscape seems like it's in constant flux, so _caveat emptor_...


## Getting Started

Create aliases (junctions? symlink?) to your actual agent environment files (e.g. `~/.claude` and `~/.copilot`) to make managing them from one place (i.e. a Visual Studio Code workspace) easier.

```powershell
New-Item -ItemType Junction -Path .\Personal-MySpecificAgent -Target "$env:USERPROFILE\.my_specific_agent"
```

Or use the helper script [`scripts/alias-setup.ps1`](scripts/alias-setup.ps1).

Then register them in the VSCode workspace:

```jsonc
{
	"folders": [
		/* normal files */
		{
			"path": "."
		},
		/* already declared aliases */
		{
			// the filesystem path alias
			"path": "Personal-Copilot",
			// naming it to be **really** obvious
			"name": "Copilot (symlink)"
		},
		...
		/* declare aliases you just made the same way */
```

Workspace settings should already exclude the _actual_ folders in favor of the aliases, just so they're named more obviously:

```jsonc
		// ...folders^
	],
	"settings": {
		/* don't show the actual symlinked folders in the explorer, in favor of the registered aliases above */
		"files.exclude": {
			"**/Personal-*": true
		}
	}
```

### Quick Setup

#### **Using this repo in Visual Studio Code**

```powershell
.\scripts\alias-setup.ps1

# TIL view documentation for ^
Get-Help .\scripts\alias-setup.ps1 -Full
```

#### **Scaffold Your Agents**

```powershell
.\scripts\init-personal-agents.ps1
```

This scaffolds your local environment with default skills and recommended configurations.  i.e. "global" or "personal" skills.

#### **Scaffold Your Project**

```powershell
.\scripts\init-project.ps1
```

This scaffolds skills and folders for a typical development project (frontend+backend monorepo).

## Project Structure

```
├── Personal-XXXX1/  # Actual agent files symlink
├── Personal-XX.../  # ...
|
├── docs/            # Things to read to be smart
├── skills/          # Shared skill definitions
|   ├── app-icon/    # Because apps need icons
|   ├── coding-sop/  # those Karpathy guidelines 🙄
|   ├── prompt-snapshot/  # keeps convo history in repo
├── scripts/         # Helpers for setting things up
|
└── README.md        # this, duh
```

## Documentation

See [docs/](docs/) for detailed guides on:
- Configuring your agent environments
- Creating custom skills
- Best practices

...when we figure them out

## Contributing

Haven't thought that far ahead; would love your input at least.

## License

I should research how these work, but...whatever lets you use this effectively.
