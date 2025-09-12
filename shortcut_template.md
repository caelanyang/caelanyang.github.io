# 快捷指令可分享链接配置

## 如果你想要一个可以直接导入的快捷指令：

### 快捷指令结构（JSON格式供参考）：

```json
{
  "WFWorkflowActions": [
    {
      "WFWorkflowActionIdentifier": "is.workflow.actions.ask",
      "WFWorkflowActionParameters": {
        "WFAskActionPrompt": "输入你的Moment内容",
        "WFInputType": "Text",
        "WFAskActionDefaultAnswer": "",
        "WFAllowsMultilineText": true
      }
    },
    {
      "WFWorkflowActionIdentifier": "is.workflow.actions.date",
      "WFWorkflowActionParameters": {}
    },
    {
      "WFWorkflowActionIdentifier": "is.workflow.actions.format.date",
      "WFWorkflowActionParameters": {
        "WFDateFormat": "Custom",
        "WFDateFormatString": "yyyyMMddHHmm"
      }
    },
    {
      "WFWorkflowActionIdentifier": "is.workflow.actions.format.date", 
      "WFWorkflowActionParameters": {
        "WFDateFormat": "Custom",
        "WFDateFormatString": "yyyy-MM-dd'T'HH:mm:ssXXX"
      }
    },
    {
      "WFWorkflowActionIdentifier": "is.workflow.actions.gettext",
      "WFWorkflowActionParameters": {
        "WFTextActionText": "---\ndate: [ISO_DATE]\nnote: 广州\n---\n[USER_INPUT]"
      }
    },
    {
      "WFWorkflowActionIdentifier": "is.workflow.actions.setclipboard",
      "WFWorkflowActionParameters": {}
    },
    {
      "WFWorkflowActionIdentifier": "is.workflow.actions.openurl",
      "WFWorkflowActionParameters": {
        "WFInput": "https://github.com/caelanyang/caelanyang.github.io/new/main/_moments"
      }
    }
  ]
}
```

## 更简单的方法：

### 1. 手动创建（推荐）
按照上面的指南手动创建，这样你可以理解每个步骤。

### 2. 使用Safari创建快速书签
- 将GitHub创建文件页面添加到书签
- URL: `https://github.com/caelanyang/caelanyang.github.io/new/main/_moments`
- 然后用快捷指令生成内容并复制

### 3. 模板文本（复制到备忘录）
```
---
date: 2025-09-12T20:00:00+08:00
note: 广州
---
[在这里写你的内容]
```

每次使用时：
1. 复制模板
2. 修改时间和内容
3. 到GitHub创建文件
4. 粘贴内容

### 使用建议：
- 第一次先手动创建快捷指令
- 测试无误后可以添加到主屏幕
- 设置Siri语音命令："发布新moment"