# Event Poster Skill Packaging Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add generic Xiaohongshu event-poster guidance, then produce documented, versioned, reproducible install candidate.

**Architecture:** Keep `xiaohongshu` as platform owner. Route activity requests to focused `event.md`; keep packaging separate through explicit installer, manifests, bilingual README, and deterministic archive script.

**Tech Stack:** Markdown skills, Bash, JSON manifest, `skill2` validators, `npx skills` CLI.

## Global Constraints

- Version: `0.2.0`.
- No 立自π, MBTI, fixed brand colors, fixed Logo, or fixed copy in runtime rules.
- No new top-level `event-poster` skill.
- Preserve existing working-tree changes; never revert or stage unrelated hunks.
- No push, tag, release, registry, marketplace, or upload.
- Candidate must not contain `.git`, cases, secrets, machine-local paths, or unrelated large files.
- README install commands must be byte-identical across languages.

---

### Task 1: Generic event-poster reference and routing

**Files:**
- Create: `skills/xiaohongshu/references/covers/event.md`
- Modify: `skills/xiaohongshu/references/cover.md`
- Modify: `skills/xiaohongshu/SKILL.md`
- Modify: `skills/douyin/SKILL.md`
- Modify: `skills/wechat/SKILL.md`

**Interfaces:**
- Consumes: existing cover type router and Xiaohongshu trigger.
- Produces: `covers/event.md` route for recruitment, series preview, detail long image, and recap cover.

- [ ] **Step 1: Run failing route check**

```bash
test -f skills/xiaohongshu/references/covers/event.md
rg -n 'covers/event\.md' skills/xiaohongshu/SKILL.md skills/xiaohongshu/references/cover.md
```

Expected: first command exits 1; route absent.

- [ ] **Step 2: Create `event.md`**

Required sections and rules:

```markdown
# 活动海报

## 适用
单场招募、系列预告、活动详情长图、活动回顾首图。

## 输入
海报类型、第一眼信息、关心理由、下一步动作、标题、价值主张、时间、地点、对象、流程、CTA、品牌素材与禁用项。

## 流程
传播目标 → 四层信息 → 视觉重心与对齐轴 → 色彩职责 → 首版 → 问题诊断 → 手机端自检。

## 类型结构
招募、预告、详情长图、回顾分别定义模块顺序。

## 视觉约束
3 秒标题、手机可读、规律间距、主色不超过 2 个、辅助色不超过 2 个、装饰不压字、避免 PPT/议程/表格/硬广感。

## 输出
类型与目标、四层文案、版式、颜色与素材职责、CTA、自检结果。
```

- [ ] **Step 3: Add router entries**

Add `活动海报` row to `references/cover.md`; add activity request read condition to `SKILL.md`. Shorten three frontmatter descriptions to ≤140 characters; preserve trigger-only semantics.

- [ ] **Step 4: Run focused checks**

```bash
test -f skills/xiaohongshu/references/covers/event.md
rg -n 'covers/event\.md' skills/xiaohongshu/SKILL.md skills/xiaohongshu/references/cover.md
! rg -n '立自π|MBTI|紫人|绿人|喜茶|Claude 式|Obsidian 式' skills/xiaohongshu/references/covers/event.md
/Users/tangyinghao/.agents/skills/skill2-package/scripts/run -- lint skills --json
```

Expected: route found twice; brand scan empty; lint has zero issues.

- [ ] **Step 5: Commit owned new file only**

```bash
git add skills/xiaohongshu/references/covers/event.md
git commit -m "feat: add event poster guidance"
```

Do not stage pre-existing hunks in `SKILL.md` or `cover.md`.

### Task 2: Versioned conflict-aware installer

**Files:**
- Create: `install.sh`
- Create: `CHANGELOG.md`
- Modify: `.codex-plugin/plugin.json`

**Interfaces:**
- Consumes: repository `skills/*/SKILL.md` directories.
- Produces: `./install.sh [--dry-run] [all|codex|claude]`; exit 3 on conflicting existing skill.

- [ ] **Step 1: Run failing package preflight**

```bash
/Users/tangyinghao/.agents/skills/skill2-package/scripts/run -- package-check . --json
```

Expected: errors for missing `CHANGELOG.md` and `install.sh`.

- [ ] **Step 2: Add installer**

Installer rules:

```text
codex  -> $HOME/.codex/skills
claude -> $HOME/.claude/skills
all    -> both
--dry-run prints mkdir/copy/skip/conflict without writes
missing destination -> copy skill directory
identical destination -> skip
different destination -> print conflict and exit 3
```

Use `cmp`/`diff -qr`; never delete or overwrite destination.

- [ ] **Step 3: Add version records**

Set `.codex-plugin/plugin.json` version to `0.2.0`. Add:

```markdown
# Changelog

## 0.2.0 - 2026-07-14

- Add generic Xiaohongshu event-poster guidance.
- Add public installer, bilingual install docs, and reproducible package candidate.

## 0.1.0

- Initial public skill set: Xiaohongshu, Douyin, WeChat.
```

- [ ] **Step 4: Test installer**

```bash
bash -n install.sh
tmp="$(mktemp -d)"
HOME="$tmp/home" ./install.sh --dry-run all
test ! -e "$tmp/home/.codex/skills/xiaohongshu"
HOME="$tmp/home" ./install.sh all
test -f "$tmp/home/.codex/skills/xiaohongshu/SKILL.md"
test -f "$tmp/home/.claude/skills/xiaohongshu/SKILL.md"
HOME="$tmp/home" ./install.sh all
```

Expected: syntax passes; dry run writes nothing; install succeeds; rerun prints skips.

- [ ] **Step 5: Commit**

```bash
git add install.sh CHANGELOG.md .codex-plugin/plugin.json
git commit -m "build: add versioned skill installer"
```

### Task 3: Public bilingual README

**Files:**
- Modify: `README.md`
- Create: `README.zh.md`

**Interfaces:**
- Consumes: public repository slug, skill names, install targets.
- Produces: English default README plus Chinese README; identical shell install blocks.

- [ ] **Step 1: Save current Chinese public content**

Copy current `README.md` content into `README.zh.md`, then update shipped capabilities with activity posters.

- [ ] **Step 2: Write concise English README**

Required sections: identity, examples, skills, install, event posters, privacy/limits, repository structure, license.

- [ ] **Step 3: Add byte-identical primary install block to both files**

```bash
npx skills add MisterBrookT/social-media-skills \
  --skill xiaohongshu \
  --agent codex \
  --global \
  --yes
```

Also document `--agent claude-code`, repeated `--skill`, and fallback:

```bash
git clone https://github.com/MisterBrookT/social-media-skills.git
cd social-media-skills
./install.sh all
```

- [ ] **Step 4: Verify public claims**

```bash
rg -n 'event poster|活动海报|npx skills add|./install.sh all|无自动发布|no automatic publishing' README.md README.zh.md
```

Expected: all shipped claims and both install paths present.

- [ ] **Step 5: Commit only after confirming existing README changes remain represented**

```bash
git add README.md README.zh.md
git diff --cached --check
git commit -m "docs: document public skill installation"
```

### Task 4: Reproducible package candidate

**Files:**
- Create: `scripts/package.sh`
- Create: `.gitignore`
- Generate: `dist/social-media-skills-0.2.0.tar.gz`
- Generate: `dist/social-media-skills-0.2.0.tar.gz.sha256`

**Interfaces:**
- Consumes: version from `.codex-plugin/plugin.json`; allowlisted repository files.
- Produces: deterministic tarball plus SHA-256 file under `dist/`.

- [ ] **Step 1: Run failing artifact check**

```bash
test -f dist/social-media-skills-0.2.0.tar.gz
test -f dist/social-media-skills-0.2.0.tar.gz.sha256
```

Expected: both exit 1.

- [ ] **Step 2: Add package script**

Script requirements:

```text
allowlist: skills, README.md, README.zh.md, LICENSE, CHANGELOG.md, install.sh, setup.sh, .codex-plugin/plugin.json, scripts/package.sh
exclude: .git, cases, docs, dist, .DS_Store
stage in mktemp
normalize commit identity and timestamp
use temporary Git commit + git archive
gzip with -n
write SHA-256 using shasum or sha256sum
```

- [ ] **Step 3: Build twice and compare**

```bash
./scripts/package.sh
cp dist/social-media-skills-0.2.0.tar.gz /tmp/social-media-skills-first.tar.gz
./scripts/package.sh
cmp /tmp/social-media-skills-first.tar.gz dist/social-media-skills-0.2.0.tar.gz
shasum -a 256 -c dist/social-media-skills-0.2.0.tar.gz.sha256
```

Expected: `cmp` exits 0; checksum reports `OK`.

- [ ] **Step 4: Commit reproducibility sources, not artifacts**

```bash
git add scripts/package.sh .gitignore
git commit -m "build: add reproducible package artifact"
```

### Task 5: Package and public-install verification

**Files:**
- Verify repository and generated artifact only.

**Interfaces:**
- Consumes: repository, artifact, installer, README commands.
- Produces: lint/package/publish reports and clean install evidence.

- [ ] **Step 1: Run validators**

```bash
/Users/tangyinghao/.agents/skills/skill2-package/scripts/run -- lint skills --json
/Users/tangyinghao/.agents/skills/skill2-package/scripts/run -- package-check . --json
/Users/tangyinghao/.agents/skills/skill2-publish/scripts/run -- publish-check . --json
```

Expected: lint and package check have zero issues. Publish check may report only dirty working tree if preserved user changes remain.

- [ ] **Step 2: Smoke artifact installer**

```bash
tmp="$(mktemp -d)"
tar -xzf dist/social-media-skills-0.2.0.tar.gz -C "$tmp"
HOME="$tmp/home" "$tmp/social-media-skills-0.2.0/install.sh" all
test -f "$tmp/home/.codex/skills/xiaohongshu/references/covers/event.md"
test -f "$tmp/home/.claude/skills/xiaohongshu/references/covers/event.md"
```

Expected: both reference checks pass.

- [ ] **Step 3: Smoke documented `npx skills` path from local source**

```bash
cache="$(npm config get cache)"
tmp="$(mktemp -d)"
mkdir -p "$tmp/project"
cd "$tmp/project"
DISABLE_TELEMETRY=1 CI=1 npm_config_cache="$cache" npm exec --offline --yes --package=skills@1.5.17 -- \
  skills add /Users/tangyinghao/workspace/media/social-media-skills \
  --skill xiaohongshu --agent codex --copy --yes
test -f "$tmp/project/.agents/skills/xiaohongshu/SKILL.md"
test -f "$tmp/project/.agents/skills/xiaohongshu/references/covers/event.md"
```

Expected: install succeeds without repository symlink; both files exist.

- [ ] **Step 4: Final integrity checks**

```bash
git diff --check
tar -tzf dist/social-media-skills-0.2.0.tar.gz | rg '/(\.git|cases|docs|dist)/' && exit 1 || true
tar -xOf dist/social-media-skills-0.2.0.tar.gz social-media-skills-0.2.0/.codex-plugin/plugin.json | rg '"version": "0.2.0"'
```

Expected: no whitespace errors, excluded paths absent, version found.

- [ ] **Step 5: Report remote gate**

Report candidate path, checksum, smoke results, validator results, dirty-tree blocker, and exact remote actions still awaiting separate confirmation. Do not perform remote writes.
