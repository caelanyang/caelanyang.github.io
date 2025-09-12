#!/bin/bash

# 超级快速版本 - 一行创建moments并推送
# 使用方法: ./quick_moment.sh "内容"

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

echo "✅ 创建成功: $FILENAME"
echo "📝 内容: ${1:-"新的moment"}"

# 自动提交并推送
git add "$FILENAME"
git commit -m "Add moment: $(echo "${1:-新的moment}" | cut -c1-30)..."

echo "� 正在推送到GitHub..."
if git push origin main; then
    echo "�🚀 推送成功！"
    echo "🌐 网站将在1-2分钟内更新: https://caelanyang.github.io/moments/"
else
    echo "❌ 推送失败，请检查网络连接或手动推送"
fi