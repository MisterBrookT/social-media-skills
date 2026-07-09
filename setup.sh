#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.codex/skills" "$HOME/.claude/skills"

for skill_dir in "$ROOT"/skills/*; do
  [ -d "$skill_dir" ] || continue
  [ -f "$skill_dir/SKILL.md" ] || continue
  name="$(basename "$skill_dir")"
  ln -sfn "$skill_dir" "$HOME/.codex/skills/$name"
  ln -sfn "$skill_dir" "$HOME/.claude/skills/$name"
  echo "installed: $name"
done
