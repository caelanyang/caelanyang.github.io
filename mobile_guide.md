# 手机端快速发布Moments指南

## 方法一：GitHub Mobile App (最推荐)

1. **下载GitHub官方App**
   - iOS: App Store搜索"GitHub"
   - Android: Google Play搜索"GitHub"

2. **快速创建文件流程**：
   - 打开GitHub App → 进入你的仓库
   - 点击"+"按钮 → "Create file"
   - 文件路径输入：`_moments/[时间戳].md`
   - 例如：`_moments/202509121955.md`

3. **快速模板**（复制粘贴使用）：
```
---
date: 2025-09-12T19:55:00+08:00
note: 广州
---
你的内容写在这里
```

4. **提交**：
   - 输入commit信息：`Add new moment`
   - 点击"Commit changes"

## 方法二：快捷指令 (iOS用户)

### 创建iOS快捷指令自动化

1. 打开"快捷指令"App
2. 点击"+" → "添加操作"
3. 搜索并添加以下操作：

### 快捷指令流程：
1. "询问输入" → 提示"输入moment内容"
2. "获取当前日期" → 格式化为ISO 8601
3. "文本" → 组合成markdown格式
4. "获取剪贴板内容" → 将结果复制到剪贴板
5. "打开URL" → GitHub仓库创建文件页面

### 快捷指令代码模板：
```
---
date: [当前时间]
note: 广州
---
[用户输入的内容]
```

## 方法三：Telegram Bot (高级用户)

如果你使用Telegram，可以创建一个bot来自动提交到GitHub。

## 方法四：简化的Web界面

创建一个简单的HTML页面，可以快速输入并生成正确格式。