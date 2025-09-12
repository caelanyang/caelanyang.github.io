#!/bin/bash

# 快速创建moments的脚本
# 使用方法: ./new_moment.sh "你的内容"

# 获取当前时间，格式为 YYYYMMDDHHMM
TIMESTAMP=$(date +"%Y%m%d%H%M")
DATETIME=$(date +"%Y-%m-%dT%H:%M:%S+08:00")

# 创建文件路径
MOMENTS_DIR="_moments"
FILENAME="${MOMENTS_DIR}/${TIMESTAMP}.md"

# 获取用户输入的内容
if [ -z "$1" ]; then
    echo "请输入moments内容:"
    read -r CONTENT
else
    CONTENT="$1"
fi

# 创建moments文件
cat > "$FILENAME" << EOF
---
name:
avatar:

date: $DATETIME

tags:
 - 
 -

pictures:
 - 
 - 
 - 
 - 

note: 广州
---
$CONTENT
EOF

echo "Moments已创建: $FILENAME"
echo "内容: $CONTENT"

# 询问是否要立即提交
echo ""
echo "是否要立即提交到git? (y/n)"
read -r COMMIT_CHOICE

if [ "$COMMIT_CHOICE" = "y" ] || [ "$COMMIT_CHOICE" = "Y" ]; then
    git add "$FILENAME"
    git commit -m "Add new moment: $(echo "$CONTENT" | cut -c1-50)..."
    echo "已提交到git"
    
    echo "是否要推送到远程仓库? (y/n)"
    read -r PUSH_CHOICE
    
    if [ "$PUSH_CHOICE" = "y" ] || [ "$PUSH_CHOICE" = "Y" ]; then
        git push
        echo "已推送到远程仓库"
    fi
fi

echo "完成!"