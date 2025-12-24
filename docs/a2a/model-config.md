# Model Configuration

This document allows you to configure which AI models are used by the specialized agents in this framework.

## Default Model Selection

The framework is designed to be model-agnostic. You can switch between Claude, Gemini, or other supported models by updating the configuration below.

| Agent | Default Model (Claude Code) | Gemini Alternative | Other |
|-------|----------------------------|-------------------|-------|
| prd-architect | `sonnet` | `gemini-1.5-pro` | - |
| architecture-designer | `sonnet` | `gemini-1.5-pro` | - |
| sprint-planner | `sonnet` | `gemini-1.5-flash` | - |
| sprint-task-implementer | `sonnet` | `gemini-1.5-pro` | - |
| senior-tech-lead-reviewer | `sonnet` | `gemini-1.5-pro` | - |
| devops-crypto-architect | `sonnet` | `gemini-1.5-pro` | - |
| paranoid-auditor | `sonnet` | `gemini-1.5-pro` | - |
| devrel-translator | `sonnet` | `gemini-1.5-flash` | - |

## How to Change Models

1. **For Claude Code**: Update the `model` field in the frontmatter of agent files in `.claude/agents/*.md`.
2. **For Gemini/Goose**: Update the corresponding configuration in `.gemini/agents/*.md`.
3. **Bulk Update**: You can use the provided `scripts/update-models.sh` to switch all agents to a specific provider.

## Current Provider Preference

- **Primary Provider**: Claude (via `.claude`)
- **Secondary Provider**: Gemini (via `.gemini`)

---
**Note**: This file is used for documentation and by orchestration scripts. Changing values here alone might not update the agent behavior unless the specific tool (like Claude Code) is configured to read from here.
