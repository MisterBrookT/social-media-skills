#!/usr/bin/env bash
set -euo pipefail

usage() {
  printf 'Usage: %s [--dry-run] [all|codex|claude]\n' "${0##*/}" >&2
  exit 2
}

dry_run=false
if [[ ${1:-} == "--dry-run" ]]; then
  dry_run=true
  shift
fi

target=${1:-all}
[[ $# -le 1 ]] || usage
case "$target" in
  all|codex|claude) ;;
  *) usage ;;
esac

repo_dir=$(cd "$(dirname "$0")" && pwd)
skill_sources=()
for source in "$repo_dir"/skills/*; do
  [[ -d "$source" && -f "$source/SKILL.md" ]] || continue
  skill_sources+=("$source")
done

if [[ ${#skill_sources[@]} -eq 0 ]]; then
  printf 'No skills found in %s/skills.\n' "$repo_dir" >&2
  exit 1
fi

destinations=()
case "$target" in
  all) destinations=("$HOME/.codex/skills" "$HOME/.claude/skills") ;;
  codex) destinations=("$HOME/.codex/skills") ;;
  claude) destinations=("$HOME/.claude/skills") ;;
esac

# Preflight every target so a conflict never leaves a partial installation.
has_conflict=false
for destination in "${destinations[@]}"; do
  for source in "${skill_sources[@]}"; do
    installed="$destination/${source##*/}"
    [[ ! -L "$installed" && ! -e "$installed" ]] && continue
    if [[ ! -d "$installed" ]] || ! diff -qr "$source" "$installed" >/dev/null; then
      printf 'conflict: %s differs from %s\n' "$installed" "$source" >&2
      has_conflict=true
    fi
  done
done
if "$has_conflict"; then
  exit 3
fi

for destination in "${destinations[@]}"; do
  if [[ ! -d "$destination" ]]; then
    printf 'mkdir %s\n' "$destination"
    "$dry_run" || mkdir -p "$destination"
  fi
  for source in "${skill_sources[@]}"; do
    installed="$destination/${source##*/}"
    if [[ -L "$installed" || -e "$installed" ]]; then
      printf 'skip %s\n' "$installed"
    else
      printf 'copy %s -> %s\n' "$source" "$installed"
      "$dry_run" || cp -R "$source" "$installed"
    fi
  done
done
