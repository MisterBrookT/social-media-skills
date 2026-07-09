# 仓库结构

这个仓库放两类东西：

1. 可安装技能：`skills/`
2. 证明技能有用的案例资产：`cases/`

过程、路线、取舍、研究沉淀放 `docs/`。

## 目录边界

```text
skills/
  social-media/
  social-media-xiaohongshu/
  social-media-xiaohongshu-cover/
  social-media-douyin/
  social-media-wechat/

cases/
  xiaohongshu-launch/
    copy/
    cover/

docs/
  repo-structure.md
  xiaohongshu-launch-plan.md
```

## 规则

- `skills/`：只放 agent 运行时要读的技能和必要 reference。
- `cases/`：只放成品或半成品资产，方便作为证明材料。
- `docs/`：放路线、策略、设计决策、复盘。
- 不把“为什么这么做”的长说明塞进 case 资产目录。

## 当前案例

`cases/xiaohongshu-launch/` 是第一个证明案例：

- `copy/xiaohongshu-copy.md`：两版小红书文案。
- `cover/*.svg`：两张封面源文件。
- `cover/*.png`：两张封面导出图。
