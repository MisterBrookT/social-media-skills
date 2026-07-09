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
  for link in "$HOME/.codex/skills/$name" "$HOME/.claude/skills/$name"; do
    if [ -e "$link" ] || [ -L "$link" ]; then
      if [ ! -L "$link" ]; then
        echo "conflict: $link exists and is not a symlink" >&2
        exit 1
      fi
      dest="$(readlink "$link")"
      case "$dest" in
        "$ROOT"/skills/*) ;;
        *)
          echo "conflict: $link points to $dest" >&2
          exit 1
          ;;
      esac
    fi
  done
  ln -sfn "$skill_dir" "$HOME/.codex/skills/$name"
  ln -sfn "$skill_dir" "$HOME/.claude/skills/$name"
  echo "installed: $name"
done
