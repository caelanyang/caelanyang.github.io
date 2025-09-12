# Git推送到GitHub指南

## 方法一：电脑端推送（推荐）

### 当你使用脚本创建moments时：
```bash
# 我们的脚本已经包含了git操作
./quick_moment.sh "内容"  # 会自动commit
./new_moment.sh "内容"    # 可选择是否commit和push
```

### 手动推送流程：
```bash
# 1. 查看状态
git status

# 2. 添加新文件
git add _moments/新文件.md
# 或添加所有变更
git add .

# 3. 提交
git commit -m "Add new moment: 内容描述"

# 4. 推送到GitHub
git push origin main

# 5. 查看推送结果
git log --oneline -5
```

## 方法二：GitHub网页直接创建（手机友好）

### 在手机/电脑浏览器中：
1. **访问**: `https://github.com/caelanyang/caelanyang.github.io`
2. **点击**: "Add file" → "Create new file"
3. **文件路径**: `_moments/202509121955.md`
4. **文件内容**:
```
---
date: 2025-09-12T19:55:00+08:00
note: 广州
---
你的moment内容
```
5. **页面底部**: 
   - Commit message: `Add new moment`
   - 选择 "Commit directly to the main branch"
   - 点击 "Commit new file"

## 方法三：GitHub Mobile App

### 使用GitHub官方App：
1. **下载GitHub App** (iOS/Android)
2. **登录账号**
3. **进入仓库**: `caelanyang/caelanyang.github.io`
4. **创建文件**: 点击 "+" → "Create file"
5. **按方法二的步骤操作**

## 方法四：自动化推送脚本

### 更新我们的快速脚本，包含推送：
```bash
#!/bin/bash
# 超级快速版本 - 包含自动推送

TIMESTAMP=$(date +"%Y%m%d%H%M")
DATETIME=$(date +"%Y-%m-%dT%H:%M:%S+08:00")
FILENAME="_moments/${TIMESTAMP}.md"

cat > "$FILENAME" << EOF
---
date: $DATETIME
note: 广州
---
${1:-"新的moment"}
EOF

echo "✅ 创建: $FILENAME"

# 自动推送到GitHub
git add "$FILENAME"
git commit -m "Add moment: $(echo "${1:-新的moment}" | cut -c1-30)..."
git push origin main

echo "🚀 已推送到GitHub"
echo "📱 网站将在1-2分钟内更新"
```

## 方法五：批量推送

### 如果你创建了多个moments：
```bash
# 查看所有未推送的更改
git status

# 添加所有新moments
git add _moments/

# 提交所有
git commit -m "Add multiple moments"

# 推送
git push origin main
```

## 实用技巧

### 1. 查看推送状态
```bash
# 查看最近的提交
git log --oneline -10

# 查看远程状态
git remote -v

# 查看分支状态
git branch -a
```

### 2. 撤销操作（如果需要）
```bash
# 撤销最后一次commit（保留文件更改）
git reset --soft HEAD~1

# 撤销文件添加
git reset HEAD 文件名
```

### 3. 查看网站更新
- GitHub Pages通常需要1-2分钟更新
- 推送成功后访问: `https://caelanyang.github.io/moments/`
- 检查新的moment是否出现

### 4. 验证部署
```bash
# 在浏览器中访问
open https://caelanyang.github.io/moments/

# 或检查GitHub Actions（如果有设置）
# 在GitHub仓库页面查看Actions标签
```