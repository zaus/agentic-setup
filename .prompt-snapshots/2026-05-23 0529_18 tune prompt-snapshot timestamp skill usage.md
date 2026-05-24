---
description: Update prompt-snapshot skill to explicitly and efficiently use timestamp skill for consistent snapshot times
timestamp: 2026-05-23T05:29:18
model: GPT-5.3-Codex
applyTo: skills/prompt-snapshot/**
---

## Prompt

> now please adjust the `prompt-snapshot` skill to properly  and efficiently take advantage of the new `timestamp` skill

> why the "for this agent" parenthetical in the `model` frontmatter?  Is that the guidance you mentioned?  

> yes, this is supposed to be agent-agnostic, but regardless the `model` frontmatter is supposed to reflect the actual model that was used to answer the user prompt, so there should be no guidance

## Summary

Updated `skills/prompt-snapshot/SKILL.md` to integrate the `timestamp` skill as a required dependency.

- Added `argument-hint` frontmatter for optional inputs.
- Replaced the single-paragraph instruction with structured sections: required front matter, timestamp integration workflow, and content requirements.
- Added an explicit two-call timestamp workflow to keep data consistent and efficient:
  - Call 1 gets canonical local ISO timestamp (`baseTs`).
  - Call 2 formats `baseTs` into filename prefix format `YYYY-MM-DD HHMM_SS`.
- Specified that frontmatter `model` should be `GPT-5.3-Codex`; later corrected the `model` requirement to be agent-agnostic and factual: `model` must reflect the actual model used to answer the user prompt, with no prescribed value guidance.
- Preserved required output location and naming convention under `.prompt-snapshots/`.