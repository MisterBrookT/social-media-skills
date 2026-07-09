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
  xiaohongshu-launch/
    copy/
    cover/

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
- `cases/`：只放成品或半成品资产，方便作为证明材料。
- `docs/`：放仓库结构、开发流程、参考资料；不放单独 case 复盘。
- 案例路线、判断、复盘沉到 Obsidian `02 Projects/social-media-skills/`。
- 不把“为什么这么做”的长说明塞进 case 资产目录。

## 当前案例

`cases/xiaohongshu-launch/` 是第一个证明案例：

- `copy/xiaohongshu-copy.md`：两版小红书文案。
- `cover/*.svg`：封面源文件。
- `cover/*.png`：封面导出图。

`cases/kaji-launch/` 是第二个证明案例：

- `copy/xiaohongshu-copy.md`：两版小红书文案。
- `cover/*.svg`：封面源文件。
- `cover/*.png`：封面导出图。
