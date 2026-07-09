#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.codex/skills" "$HOME/.claude/skills"

for target in "$HOME/.codex/skills" "$HOME/.claude/skills"; do
  for link in "$target"/*; do
    [ -L "$link" ] || continue
    dest="$(readlink "$link")"
    case "$dest" in
      "$ROOT"/skills/*) rm -f "$link" ;;
    esac
  done
done

for skill_dir in "$ROOT"/skills/*; do
  [ -d "$skill_dir" ] || continue
  [ -f "$skill_dir/SKILL.md" ] || continue
  name="$(basename "$skill_dir")"
  ln -sfn "$skill_dir" "$HOME/.codex/skills/$name"
  ln -sfn "$skill_dir" "$HOME/.claude/skills/$name"
  echo "installed: $name"
done
