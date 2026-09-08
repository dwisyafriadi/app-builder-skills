# MCP Stitch - setup per agent, never commit the key

Env var `STITCH_API_KEY` always. Never write the real key into any repo file.

## Key rules

1. Key lives in env `STITCH_API_KEY`, set outside the repo.
2. Each agent has its own config file. Entry points differ; the MCP server URL and header are the same.
3. Some agents expand `${VAR}` in config, some do not. See table below.

## Per-agent config

### Claude Code (`.mcp.json` at repo root)
```json
{
  "mcpServers": {
    "stitch": {
      "type": "http",
      "url": "https://stitch.googleapis.com/mcp",
      "headers": { "X-Goog-Api-Key": "${STITCH_API_KEY}" }
    }
  }
}
```
Expands env: yes.

### Codex (`~/.codex/config.toml` or project `.codex/config.toml`)
```toml
[mcp_servers.stitch]
url = "https://stitch.googleapis.com/mcp"
# Codex does NOT expand ${VAR} inside headers. Set the key via a headers env block.
# Use the "env" sub-block so the value is read from the environment:
[mcp_servers.stitch.env]
STITCH_API_KEY = "set-me-in-your-shell"  # placeholder; Codex injects from process env name above
```
Config key should reference the env var; the exact mechanism differs by Codex version. If header injection fails, export `STITCH_API_KEY` in your shell and check `codex mcp list`.

### OpenCode (`.opencode/opencode.json`)
```json
{
  "mcp": {
    "stitch": {
      "type": "remote",
      "url": "https://stitch.googleapis.com/mcp",
      "headers": { "X-Goog-Api-Key": "{env:STITCH_API_KEY}" }
    }
  }
}
```
Expands env: yes, via `{env:VAR}` syntax. Keep the JSON example file, not the real key.

### OpenClaw / Hermes
Register the same remote MCP in each agent's config. Set the key via the agent's env / secret store (`STITCH_API_KEY`). Do not paste the key into the config file.

## Revoke

Revoke any key that was ever pasted into a public repo via Google Cloud Console.

## Phase 3 note

`phase-3-frontend` auto-detects a Stitch capability; if none exists it routes to the Tailwind fallback skill. Detection is by capability, never by a hardcoded tool name.
