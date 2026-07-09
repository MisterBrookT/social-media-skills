# 自举开发流程

目标：先安装自己的 skill，再用它做真实 case；发现弱点后改 skill，再做下一版。

## 本机安装

```bash
cd ~/workspace/social-media-skills
./setup.sh
```

`setup.sh` 会把 `skills/*` 链接到：

- `~/.codex/skills/`
- `~/.claude/skills/`

因为是 symlink，更新 repo 文件后不需要重新复制。新会话会读到最新版 skill。

## 日常循环

1. 用当前 skill 做一个真实 case。
2. 把产物放进 `cases/<project>-launch/`。
3. 把路线、判断、复盘放进 Obsidian `02 Projects/social-media-skills/`。
4. 抽取可复用规则，写回对应 `skills/*/SKILL.md` 或 `references/`。
5. 开新会话，用新版 skill 重做同一个 case 或做下一个 case。

## 成功标准

- case 不靠人工口头解释也能看懂。
- skill 能从输入直接产出平台原生资产。
- 每个 case 至少反哺一个 skill 规则。
- `cases/` 不堆路线；repo `docs/` 不放单独 case 复盘。
- 项目复盘沉到 Obsidian Projects，repo docs 只保留结构、流程、参考。

## 当前自举队列

1. `social-media-skills` 小红书发布：验证 skill 仓库自身定位。
2. `kaji` 小红书发布：验证真实 macOS 开源产品传播。
