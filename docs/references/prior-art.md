# 先例调研

调研日期：2026-07-09。

## 强相关

### nashsu/Viral_Writer_Skill

- URL: https://github.com/nashsu/Viral_Writer_Skill
- Stars: 655
- 定位：自媒体创作 skill。
- 覆盖：公众号、小红书、抖音文案。
- 可借：11 个内容洞见维度、标题策略、平台规范、配图 prompt。
- 不足：偏文字生成；封面/图文/跨平台资产链路较弱。

### op7418/guizang-social-card-skill

- URL: https://github.com/op7418/guizang-social-card-skill
- Stars: 4807
- 定位：小红书图文、公众号封面对、社交卡片视觉系统。
- 可借：平台比例、图文页纲、瑞士/杂志视觉系统、QA 清单。
- 不足：重视觉；不是文字策略基座。

### OrangeViolin/content-pipeline

- URL: https://github.com/OrangeViolin/content-pipeline
- Stars: 200
- 定位：素材收集、文章、排版、封面、多平台转换、发布一体化。
- 可借：素材池、manifest、多平台管线、诚实标注原则。
- 不足：范围过重；首版平台 skill 不宜直接包含发布自动化。

### OrangeViolin/wechat-to-xiaohongshu

- URL: https://github.com/OrangeViolin/wechat-to-xiaohongshu
- Stars: 12
- 定位：微信文章转小红书轮播图 + 发布文案。
- 可借：文章转卡片页纲、真人分享风格、发布文案结构。
- 不足：单向转换，品牌色和场景较固定。

### Vivixiao980/xhs-cover-skill

- URL: https://github.com/Vivixiao980/xhs-cover-skill
- Stars: 86
- 定位：小红书封面生成器，Claude Code / Codex skill。
- 可借：18 种封面风格、3:4 封面提示词、编辑已有封面的工作流。
- 不足：集中在封面，不处理多平台内容策略。

## 公众号专项

### zhylq/yuan-skills

- URL: https://github.com/zhylq/yuan-skills
- Stars: 38
- 相关 skill：`zhy-wechat-writing`。
- 可借：证据池、检索、配图、HTML 排版、草稿箱分离。

### DavidLam-oss/wechat-writing-team

- URL: https://github.com/DavidLam-oss/wechat-writing-team
- Stars: 33
- 定位：公众号写作 + 视觉导演。
- 可借：写作角色拆分、配图协同。

## 系统方法

### MapleShaw/auto-claude-writing-agent-pub

- URL: https://github.com/MapleShaw/auto-claude-writing-agent-pub
- Stars: 426
- 定位：多平台 AI 写作工作流。
- 可借：个人素材库、版本管理、三遍审校、标题多轮。
- 不足：不是标准 skill；偏个人工作流。

### solar-luna/Fully-automatic-article-generation-skill

- URL: https://github.com/solar-luna/Fully-automatic-article-generation-skill
- Stars: 63
- 定位：小红书和公众号全自动发文章。
- 可借：发布链路拆分。
- 不足：首版不做自动发布，避免登录态和平台风险。

## 结论

本仓库应做技能库，不叫 `writing`：

- 内容策略：借 `Viral_Writer_Skill`。
- 视觉/封面：借 `guizang-social-card-skill` 与 `xhs-cover-skill`。
- 管线：借 `content-pipeline`。
- 公众号证据池：借 `yuan-skills`。
- 个人风格与审校：借 `auto-claude-writing-agent-pub`。
- 仓库结构：借 `superpowers`，`skills/` 下平铺多个可组合平台 skill；跨平台说明放 README/docs。

首版边界：生成内容资产，不自动发布。
