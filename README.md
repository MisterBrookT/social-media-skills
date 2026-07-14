<div align="center">

<img src="docs/readme-icon.svg" height="72" alt="Social Media Skills icon" />

# Social Media Skills

**Reusable skills for Chinese social-media content.**

Turn one topic into platform-native Xiaohongshu, Douyin, and WeChat assets: copy, covers, event posters, carousels, and spoken scripts.

Current version: `0.2.0`

<a href="https://github.com/MisterBrookT/social-media-skills/stargazers"><img src="https://img.shields.io/github/stars/MisterBrookT/social-media-skills?style=flat&label=stars&labelColor=1A1A1A&color=5C86A3" alt="GitHub stars"></a>
<img src="https://img.shields.io/badge/skills-xiaohongshu%20%C2%B7%20douyin%20%C2%B7%20wechat-5C86A3?labelColor=1A1A1A" alt="skills: xiaohongshu, douyin, wechat">
<a href="LICENSE"><img src="https://img.shields.io/github/license/MisterBrookT/social-media-skills?color=5C86A3&labelColor=1A1A1A" alt="MIT license"></a>

</div>

[中文](README.zh.md)

## Why

Generic agents often flatten every platform into the same short post. This library keeps platform behavior separate, then produces assets native to each channel.

## Shipped skills

| Skill | Use it for | Outputs |
| --- | --- | --- |
| `xiaohongshu` | Notes, event posters, product launches, covers, carousels | Titles, poster hierarchy, cover copy, body copy, tags, carousel outline, comment hook |
| `douyin` | Short videos, spoken scripts, cover titles | Three-second hook, spoken script, visual beats, topics |
| `wechat` | Long-form articles, opinion posts, product explanations | Title set, summary, article, cover copy, interaction prompt |

No global `social-media` router is installed. Each platform remains a self-contained skill.

## Install

Recommended: install all three skills for Codex and Claude Code with Skills CLI.

```bash
npx skills add MisterBrookT/social-media-skills \
  --skill xiaohongshu \
  --skill douyin \
  --skill wechat \
  --agent codex \
  --agent claude-code \
  --global \
  --yes
```

Keep only the required `--skill` or `--agent` flags when installing a subset.

Manual fallback:

```bash
git clone https://github.com/MisterBrookT/social-media-skills.git && cd social-media-skills && ./install.sh all
```

Use `./install.sh codex` or `./install.sh claude` for one agent. Existing skills with different content are never overwritten. Preview with `./install.sh --dry-run all`.

## Xiaohongshu event posters

`xiaohongshu` routes these requests to focused event-poster guidance:

- Single-event recruitment
- Series announcements
- Event-detail long images
- Event recap covers

Workflow: communication goal → four information levels → visual focus and alignment → color roles → CTA → mobile readability check.

Rules stay brand-neutral. Brand colors, logos, claims, dates, venues, prices, and registration details come from user-provided inputs; missing facts are never invented.

## Compatibility

- Agents: Codex, Claude Code
- Preferred installer: current `npx skills add`
- Manual installer: Bash on macOS or Linux
- Validated locally on macOS; use Skills CLI on other environments

## Privacy and limits

- No platform login or automatic publishing
- No telemetry in skill files
- No fabricated data, testimonials, or first-hand experience
- No claimed marketplace or curated-registry listing
- Skills run with the permissions granted to the host agent; review before use

## Repository structure

```text
skills/
  xiaohongshu/
    SKILL.md
    references/
  douyin/
    SKILL.md
  wechat/
    SKILL.md

cases/
docs/
```

## License

MIT
