# Social Media Skills

中文社交媒体内容技能集。面向公众号、小红书、抖音，覆盖选题、文案、封面图、图文卡片、跨平台改写。

## 当前技能

- `xiaohongshu`：小红书笔记、标题、封面、标签、图文卡片。
- `douyin`：抖音口播、前 3 秒钩子、封面标题。
- `wechat`：公众号长文、摘要、封面文案。

没有 `social-media` 总入口 skill。仓库名已经说明这是社媒技能库；`skills/` 里只放真正可触发的平台技能。跨平台路线写在 README 和 `docs/`。

## 安装

```bash
./setup.sh
```

脚本会把 `skills/` 下所有技能链接到本机 Codex / Claude Code skill 目录。

本机开发推荐直接 clone 后运行 `./setup.sh`。脚本使用 symlink，之后改 repo 里的 skill 文件，下次新会话会读到更新版。

## 仓库结构

结构参考 `superpowers`：

```text
.codex-plugin/plugin.json
skills/
  xiaohongshu/
    SKILL.md
    references/
      cover.md
      cover-seed-research.md
  douyin/
    SKILL.md
  wechat/
    SKILL.md
docs/
  references/
```

`skills/` 平铺多个平台技能；同平台子能力放平台目录里的 `references/`。通用调研、路线、prior art 放 `docs/`。

## 设计原则

- 平台原生：不同平台不是字数差异，是叙事单位差异。
- 素材优先：不编造个人经历、数据、案例；缺素材先标假设。
- 图文一体：封面、标题、正文、标签、评论钩子一起设计。
- 发布分离：本仓库首版不做自动发布，后续可接发布技能。

## 先例调研

详见 `docs/references/prior-art.md`。核心参考：

- `nashsu/Viral_Writer_Skill`
- `op7418/guizang-social-card-skill`
- `OrangeViolin/content-pipeline`
- `OrangeViolin/wechat-to-xiaohongshu`
- `zhylq/yuan-skills`
- `MapleShaw/auto-claude-writing-agent-pub`
- `Vivixiao980/xhs-cover-skill`

## 首个案例

先做小红书封面。原因：

- 小红书第一屏最依赖封面，验证最快。
- 开源工具适合用“痛点 + 结果 + 工具名”的封面结构。
- 封面会倒逼一句话定位，比先写长文更清楚。

案例见 `skills/xiaohongshu/SKILL.md` 和 `skills/xiaohongshu/references/cover.md`。

## 案例展示

这里放用本仓库技能产出的代表案例。后续不同平台、不同内容类型继续追加。

### Kaji 小红书产品封面

产品类封面。重点验证：品牌名可见、真实截图作证、主标题是产品定位、底部卖点短且平行。

<img src="cases/kaji-launch/cover/cover-d-clean-product.png" alt="Kaji 小红书产品封面" width="360">

- 文案：[cases/kaji-launch/copy/xiaohongshu-copy.md](cases/kaji-launch/copy/xiaohongshu-copy.md)
- 封面源文件：[cases/kaji-launch/cover/cover-d-clean-product.svg](cases/kaji-launch/cover/cover-d-clean-product.svg)
- 封面规则：[skills/xiaohongshu/references/cover.md](skills/xiaohongshu/references/cover.md)

- `cases/xiaohongshu-launch/`：`social-media-skills` 小红书发布案例，只放文案和封面资产。
- `cases/kaji-launch/`：Kaji 小红书发布案例，用来验证 skill 可迁移到真实产品。

## 文档

- `docs/repo-structure.md`：仓库边界，说明 `skills/`、`cases/`、`docs/` 怎么分工。
- `docs/dogfooding-workflow.md`：本机安装、使用、修 skill、再验证的自举流程。
- `docs/references/`：先例调研、平台规格、内容和视觉参考。

案例路线、判断、复盘不放 repo docs，沉淀到 Obsidian `02 Projects/social-media-skills/`。
