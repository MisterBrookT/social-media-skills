---
name: social-media
description: "Use when planning Chinese social media content packages across platforms, choosing platform routes, or converting one source into WeChat, Xiaohongshu, and Douyin assets."
---

# Social Media

中文社媒总入口。负责平台选择、多平台内容包、跨平台转译。单平台细节交给平台 skill。

## 核心原则

- 平台原生：公众号是论证长文，小红书是图文种草/经验压缩，抖音是口播节奏和前 3 秒钩子。
- 素材优先：不编造个人经历、数据、用户反馈、案例。缺来源时标注假设或先检索。
- 图文一体：标题、正文、封面大字、卡片结构、标签、评论钩子一起设计。
- 发布分离：默认只生成内容资产，不登录、不发布、不自动互动。

## 任务路由

| 用户意图 | 产物 | 参考 |
| --- | --- | --- |
| 选题/内容策略 | 角度、受众、核心观点、证据需求、平台建议 | `references/content-patterns.md` |
| 公众号 | 标题组、长文、摘要、封面文案、头图方向 | `../social-media-wechat/SKILL.md` |
| 小红书 | 标题、正文、标签、封面大字、图文卡片页纲 | `../social-media-xiaohongshu/SKILL.md` |
| 抖音 | 前 3 秒钩子、口播稿、分镜点、封面标题、话题 | `../social-media-douyin/SKILL.md` |
| 封面/图文 | 小红书 3:4、公众号 21:9+1:1、抖音 9:16 封面提示词/页面规划 | `references/visual-patterns.md` + `references/platform-specs.md` |
| 跨平台改写 | 同一素材重写为多平台包 | `references/platform-specs.md` |
| 小红书开源工具封面 | 封面大字、卖点、副标题、图像提示词 | `../social-media-xiaohongshu/SKILL.md` + `../social-media-xiaohongshu/references/cover.md` |
| 先例调研/设计依据 | 已调研仓库、可复用模式、边界 | `references/prior-art.md` |

## 工作流

1. 锁输入：主题/素材、目标平台、目标受众、人设口吻、硬约束、是否有图片/截图/视频。
2. 判断是否需要检索：涉及事实、趋势、产品能力、价格、法律、医学、金融、竞品时先查证。
3. 定内容包：单平台还是多平台；纯文字还是封面/图文一起出。
4. 读对应平台 skill，生成平台原生产物：不要把公众号直接缩短成小红书，也不要把小红书正文直接当抖音口播。
5. 做发布前检查：事实、标题承诺、平台长度、封面可读性、口吻一致、无伪造经历。

## 输出默认形态

多平台内容包优先用：

```markdown
## 内容定位

## 公众号

## 小红书

## 抖音

## 封面与图文

## 发布前检查
```

单平台任务只输出对应平台，避免塞满。

## 常见错误

- 把所有平台写成同一篇短文。
- 只写正文，不管封面大字和评论钩子。
- 假装有真实体验、真实数据、真实用户反馈。
- 小红书标签堆砌，和内容没有语义关系。
- 抖音口播像书面稿，没有停顿、转折、前 3 秒钩子。
