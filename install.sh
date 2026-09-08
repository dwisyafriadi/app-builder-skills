#!/bin/bash
# Universal installer macOS/Linux - run: bash install.sh
SRC="$(cd "$(dirname "$0")/skills" && pwd)"
mkdir -p ~/.agents/skills ~/.claude/skills ~/.openclaw/skills ~/.codex/skills
for S in app-builder-id phase-1-discovery phase-2-features phase-3-frontend phase-4-database phase-5-scaffolding; do
  ln -sfn "$SRC/$S" ~/.agents/skills/$S
done
echo "Done. Linked to ~/.agents/skills"
echo "Claude: also symlink to ~/.claude/skills if needed"
echo "OpenClaw global: ln -sfn $SRC/app-builder-id ~/.openclaw/skills/app-builder-id"
