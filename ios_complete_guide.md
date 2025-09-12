# iOS快捷指令 - 完整版（包含推送）

## 增强版iOS快捷指令配置

### 方案A：直接在GitHub网页创建（推荐）

在之前的快捷指令基础上，修改最后一步：

```
7. 打开URL → https://github.com/caelanyang/caelanyang.github.io/new/main/_moments
```

这样打开的页面可以直接创建并提交文件，相当于自动推送。

### 方案B：GitHub API版本（高级）

如果你想要完全自动化，可以使用GitHub的API：

#### 额外步骤：
1. **获取GitHub Token**：
   - 到GitHub Settings → Developer settings → Personal access tokens
   - 生成一个token，权限选择"repo"

2. **在快捷指令中添加API调用**：
```
8. 获取URL内容 (POST请求)
   - URL: https://api.github.com/repos/caelanyang/caelanyang.github.io/contents/_moments/[文件名].md
   - Headers: 
     - Authorization: token [你的token]
     - Content-Type: application/json
   - Body: {
       "message": "Add new moment",
       "content": "[base64编码的文件内容]"
     }
```

### 方案C：简化的工作流程（最实用）

#### iOS快捷指令完整步骤：
1. **询问输入** → moment内容
2. **获取当前日期**
3. **格式化时间戳** → yyyyMMddHHmm
4. **格式化ISO时间** → yyyy-MM-dd'T'HH:mm:ssXXX
5. **文本组合** → 完整的markdown内容
6. **拷贝到剪贴板**
7. **显示通知** → "内容已复制，文件名：[时间戳].md"
8. **打开URL** → GitHub创建文件页面

#### 使用时：
1. 运行快捷指令
2. 输入内容
3. 自动复制格式化内容
4. 自动打开GitHub
5. **文件名粘贴时间戳.md**
6. **内容区粘贴剪贴板**
7. **点击"Commit new file"** ← 这就是推送！

### 完整操作示例：

```
📱 快捷指令输出示例：

剪贴板内容：
---
date: 2025-09-12T20:15:00+08:00
note: 广州
---
今天学了新的编程技巧

通知显示：
📝 Moment已准备
文件名：202509122015.md
点击通知打开GitHub
```

## 🎯 推荐工作流程

### 电脑端：
```bash
moment "内容"  # 一键创建+推送
```

### 手机端：
1. 运行快捷指令
2. 输入内容  
3. 自动打开GitHub
4. 粘贴文件名和内容
5. 点击提交（自动推送）

这样您就可以在任何设备上快速发布moments了！