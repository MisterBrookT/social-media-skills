#!/usr/bin/env bash
set -euo pipefail

repo_dir=$(cd "$(dirname "$0")/.." && pwd)
version=$(sed -n 's/^[[:space:]]*"version": "\([^"]*\)",*$/\1/p' "$repo_dir/.codex-plugin/plugin.json" | head -n 1)
[[ -n "$version" ]] || { printf 'version missing in .codex-plugin/plugin.json\n' >&2; exit 1; }

name="social-media-skills-$version"
dist_dir="$repo_dir/dist"
archive="$dist_dir/$name.tar.gz"
checksum="$archive.sha256"
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
stage="$tmp/stage"

mkdir -p "$stage/.codex-plugin" "$stage/docs" "$stage/scripts" "$dist_dir"
cp -R "$repo_dir/skills" "$stage/skills"
cp "$repo_dir/README.md" "$repo_dir/README.zh.md" "$repo_dir/LICENSE" \
  "$repo_dir/CHANGELOG.md" "$repo_dir/install.sh" "$repo_dir/setup.sh" "$stage/"
cp "$repo_dir/.codex-plugin/plugin.json" "$stage/.codex-plugin/plugin.json"
cp "$repo_dir/docs/readme-icon.svg" "$stage/docs/readme-icon.svg"
cp "$repo_dir/scripts/package.sh" "$stage/scripts/package.sh"
find "$stage" -name '.DS_Store' -delete
chmod +x "$stage/install.sh" "$stage/setup.sh" "$stage/scripts/package.sh"

git -C "$stage" init -q
git -C "$stage" add .
GIT_AUTHOR_NAME=package GIT_AUTHOR_EMAIL=package@localhost \
GIT_COMMITTER_NAME=package GIT_COMMITTER_EMAIL=package@localhost \
GIT_AUTHOR_DATE='2026-07-14T00:00:00Z' GIT_COMMITTER_DATE='2026-07-14T00:00:00Z' \
  git -C "$stage" commit -qm package

git -C "$stage" archive --format=tar --prefix="$name/" HEAD >"$tmp/$name.tar"
gzip -n -9 -c "$tmp/$name.tar" >"$archive"

if command -v sha256sum >/dev/null 2>&1; then
  hash=$(sha256sum "$archive" | awk '{print $1}')
else
  hash=$(shasum -a 256 "$archive" | awk '{print $1}')
fi
printf '%s  %s\n' "$hash" "$(basename "$archive")" >"$checksum"
printf '%s\n%s\n' "$archive" "$checksum"
