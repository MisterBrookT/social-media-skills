# 测试记录

## 使用了哪些 skill 文件

- `skills/xiaohongshu/SKILL.md`
- `skills/xiaohongshu/references/cover.md`
- `skills/xiaohongshu/references/covers/product.md`

## 生成判断

Kaji 是产品封面。它有真实菜单栏 popover 截图，主视觉应展示真实产品形态，而不是纯大字海报或临时画的功能卡。

本次输出使用真实截图 `assets/kaji-gauge-current.png`，以 `preserveAspectRatio="xMidYMid meet"` 保留核心界面，不用 `slice` 裁切。

PNG 使用 `rsvg-convert -w 1080 -h 1440` 从 SVG 导出，校验尺寸为 1080x1440。

## 哪些规则有效

- “产品封面必须先要截图”有效，避免了伪 UI。
- “品牌名和一句话定位优先”有效，Kaji 和 AI Coding 一站式状态栏成为第一视觉。
- “截图占 35%-55%”有效，产品证据足够大。
- “色彩服务品牌和产品气质”有效，画面保持克制、层级清楚、截图证据突出。
- “底部 1-3 个短卖点”有效，额度可见、状态收束、少打断没有堆功能。

## 哪些规则不足/建议回写 skill

- 建议把“产品截图默认 contain，只有确认不会伤害核心时才允许 crop/slice”写得更硬。
- 建议要求 notes 记录截图来源和裁切策略，方便隔离测试复查。
- 建议补一个产品封面 SVG 模板：顶部品牌定位、中部真实截图、底部三卖点。
