#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_SRC="$ROOT/skills/social-media"

mkdir -p "$HOME/.codex/skills" "$HOME/.claude/skills"
ln -sfn "$SKILL_SRC" "$HOME/.codex/skills/social-media"
ln -sfn "$SKILL_SRC" "$HOME/.claude/skills/social-media"

echo "installed: social-media"

