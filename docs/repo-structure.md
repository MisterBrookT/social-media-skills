# 仓库结构

这个仓库放两类东西：

1. 可安装技能：`skills/`
2. 证明技能有用的案例资产：`cases/`

仓库结构、开发流程、参考资料放 `docs/`。案例路线、取舍、复盘放 Obsidian 项目笔记。

## 目录边界

```text
skills/
  xiaohongshu/
  douyin/
  wechat/

cases/
  xiaohongshu-cover/
    product-kaji/
      prompt.md
      output.png
      output.svg
      notes.md
    product-social-media-skills/
      prompt.md
      output.png
      output.svg
      notes.md

docs/
  repo-structure.md
  dogfooding-workflow.md
  references/
```

## 规则

- 参考 `superpowers`：顶层 skill 平铺；同一个 skill 的 `agents/`、`scripts/`、`references/` 放进该 skill 目录。
- `skills/`：只放 agent 运行时要读的技能和必要 reference。
- 平台是顶层 skill，目录名直接用平台名，不统一加仓库前缀。
- 不设总入口 skill；跨平台路线放 README/docs，避免 `skills/` 出现抽象目录。
- 同平台子能力放该平台目录里的 `references/`。
- `cases/`：按能力分类放测试案例，保留 prompt、输出、源文件、测试记录。
- `docs/`：放仓库结构、开发流程、参考资料；不放单独 case 复盘。
- 案例路线、判断、复盘沉到 Obsidian `02 Projects/social-media-skills/`。
- 不把“为什么这么做”的长说明塞进 case 资产目录。

## 当前案例

`cases/xiaohongshu-cover/` 是小红书封面能力测试集：

- `product-kaji/`：产品封面，真实截图做主体证据。
- `product-social-media-skills/`：无传统 UI 的 skill library 产品封面，展示真实产出状态。

每个 case 统一保留：

- `prompt.md`：真实用户会说的轻 prompt。
- `output.svg`：可复现源文件。
- `output.png`：导出成品图。
- `notes.md`：隔离测试记录、读过的 skill、规则反馈。
