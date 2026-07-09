# 小红书封面分支

日期：2026-07-09  
项目：`social-media-skills`  
规格：1080 × 1440，3:4 竖版。

## 方向

两张封面分工：

- `cover-a-open-method.svg`：介绍能力面，强调“不只写文案”。
- `cover-d-pain-point.svg`：痛点传播型，强调“别只写正文”。

## 共同视觉系统

- 背景：象牙白 / 浅灰。
- 主字：炭黑粗黑体。
- 强调色：深玫红 `#e83f4f`。
- 结构：最多三层信息，主标题、副标题、角标。
- 禁忌：不用 AI 紫蓝渐变，不用纯代码截图，不堆 emoji，不放未证实数字。

## 导出

```bash
rsvg-convert -w 1080 -h 1440 cover-a-open-method.svg -o cover-a-open-method.png
rsvg-convert -w 1080 -h 1440 cover-d-pain-point.svg -o cover-d-pain-point.png
```

