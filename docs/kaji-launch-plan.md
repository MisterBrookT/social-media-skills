# Kaji 小红书发布路线

日期：2026-07-09  
项目：`Kaji`

## 判断

Kaji 适合作为第二个 case。

原因：

- 产品痛点清晰：AI coding 长任务会被额度、上下文、系统压力、休息节奏打断。
- 受众明确：macOS + Codex / Claude Code 重度用户。
- 资产完整：中文 README、英文 README、菜单栏截图、产品定位都有。
- 能验证迁移：不再只宣传 `social-media-skills` 自己，而是服务真实开源产品。

## 两个版本

### 版本 A：痛点型

主标题：`AI Coding 别失控`

目的：

- 放大长任务失控问题。
- 强调 Kaji 是状态收束工具。
- 适合第一眼抓 AI coding 用户。

资产：

- 文案：`cases/kaji-launch/copy/xiaohongshu-copy.md`
- 封面：`cases/kaji-launch/cover/cover-a-control.svg`

### 版本 B：结果型

主标题：`状态放进菜单栏`

目的：

- 讲产品结果，不先讲焦虑。
- 强调 macOS 原生菜单栏形态。
- 适合开源项目正式发布。

资产：

- 文案：`cases/kaji-launch/copy/xiaohongshu-copy.md`
- 封面：`cases/kaji-launch/cover/cover-b-menubar.svg`

## Skill 反哺

本 case 暴露三条规则：

- 小红书开源工具内容不应只讲功能，要先讲使用中断点。
- macOS 工具封面可以用伪菜单栏和状态面板表达产品形态。
- 同一产品至少保留痛点型和结果型两版，方便测试不同入口。

## 导出命令

```bash
rsvg-convert -w 1080 -h 1440 cases/kaji-launch/cover/cover-a-control.svg -o cases/kaji-launch/cover/cover-a-control.png
rsvg-convert -w 1080 -h 1440 cases/kaji-launch/cover/cover-b-menubar.svg -o cases/kaji-launch/cover/cover-b-menubar.png
```
