# 小红书发布路线

日期：2026-07-09  
项目：`social-media-skills`

## 判断

文案和封面应该分开做。

原因：

- 小红书第一眼是封面，不是正文。
- 封面负责 1 秒定位，文案负责解释和转化。
- 分开做更容易沉淀：`social-media-xiaohongshu` 负责平台，封面规则放在它的 `references/cover.md`。

## 两个版本

### 版本 A：开源方法库

主标题：`不只写文案`

目的：

- 介绍 `social-media-skills` 的能力面。
- 说明它不是普通文案 prompt，而是内容资产工作流。
- 适合作为仓库第一条发布。

资产：

- 文案：`cases/xiaohongshu-launch/copy/xiaohongshu-copy.md`
- 封面：`cases/xiaohongshu-launch/cover/cover-a-open-method.svg`

### 版本 D：痛点型

主标题：`别只写正文`

目的：

- 打小红书内容创作者的真实痛点。
- 强调正文不是第一屏，封面才是第一关。
- 适合作为传播/引流版本。

资产：

- 文案：`cases/xiaohongshu-launch/copy/xiaohongshu-copy.md`
- 封面：`cases/xiaohongshu-launch/cover/cover-d-pain-point.svg`

## 共同视觉系统

- 规格：1080 × 1440，3:4。
- 背景：象牙白 / 浅灰。
- 主字：炭黑粗黑体。
- 强调色：深玫红 `#e83f4f`。
- 结构：最多三层信息，主标题、副标题、角标。
- 禁忌：不用 AI 紫蓝渐变，不用纯代码截图，不堆 emoji，不放未证实数字。

## 导出命令

```bash
rsvg-convert -w 1080 -h 1440 cases/xiaohongshu-launch/cover/cover-a-open-method.svg -o cases/xiaohongshu-launch/cover/cover-a-open-method.png
rsvg-convert -w 1080 -h 1440 cases/xiaohongshu-launch/cover/cover-d-pain-point.svg -o cases/xiaohongshu-launch/cover/cover-d-pain-point.png
```
