# Social Media Skills

中文社交媒体内容技能集。面向公众号、小红书、抖音，覆盖选题、文案、封面图、图文卡片、跨平台改写。

## 当前技能

- `social-media`：中文社媒总入口，多平台内容包与路由。
- `social-media-xiaohongshu`：小红书笔记、标题、标签、图文卡片。
- `social-media-xiaohongshu-cover`：小红书 3:4 封面，首个落地 case。
- `social-media-douyin`：抖音口播、前 3 秒钩子、封面标题。
- `social-media-wechat`：公众号长文、摘要、封面文案。

## 安装

```bash
./setup.sh
```

脚本会把 `skills/` 下所有技能链接到本机 Codex / Claude Code skill 目录。

## 仓库结构

结构参考 `superpowers`：

```text
.codex-plugin/plugin.json
skills/
  social-media/
    SKILL.md
    references/
  social-media-xiaohongshu/
    SKILL.md
  social-media-xiaohongshu-cover/
    SKILL.md
  social-media-douyin/
    SKILL.md
  social-media-wechat/
    SKILL.md
```

`skills/` 平铺多个可组合技能；`social-media` 只做总入口和跨平台编排。

## 设计原则

- 平台原生：不同平台不是字数差异，是叙事单位差异。
- 素材优先：不编造个人经历、数据、案例；缺素材先标假设。
- 图文一体：封面、标题、正文、标签、评论钩子一起设计。
- 发布分离：本仓库首版不做自动发布，后续可接发布技能。

## Prior Art

详见 `skills/social-media/references/prior-art.md`。核心参考：

- `nashsu/Viral_Writer_Skill`
- `op7418/guizang-social-card-skill`
- `OrangeViolin/content-pipeline`
- `OrangeViolin/wechat-to-xiaohongshu`
- `zhylq/yuan-skills`
- `MapleShaw/auto-claude-writing-agent-pub`
- `Vivixiao980/xhs-cover-skill`

## 首个 Case

先做小红书封面。原因：

- 小红书第一屏最依赖封面，验证最快。
- 开源工具适合用“痛点 + 结果 + 工具名”的封面结构。
- 封面会倒逼一句话定位，比先写长文更清楚。

Case 见 `skills/social-media-xiaohongshu-cover/SKILL.md`。

## 案例

- `cases/xiaohongshu-launch/`：`social-media-skills` 小红书发布案例，只放文案和封面资产。

## 文档

- `docs/repo-structure.md`：仓库边界，说明 `skills/`、`cases/`、`docs/` 怎么分工。
- `docs/xiaohongshu-launch-plan.md`：小红书发布路线，说明文案和封面为什么分开。
