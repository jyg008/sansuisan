#!/bin/bash

echo "=== BPB Panel 自动部署脚本 ==="
echo ""

# 检查是否在 git 仓库中
if [ ! -d ".git" ]; then
    echo "初始化 Git 仓库..."
    git init
    git branch -M main
fi

# 检查 GitHub CLI
if ! command -v gh &> /dev/null; then
    echo "错误: 未安装 GitHub CLI (gh)"
    echo "请先安装: https://cli.github.com/"
    exit 1
fi

# 检查是否已登录 GitHub
if ! gh auth status &> /dev/null; then
    echo "请先登录 GitHub:"
    gh auth login
fi

# 创建远程仓库
echo ""
echo "创建 GitHub 仓库..."
read -p "仓库名称 (默认: bpb-panel): " repo_name
repo_name=${repo_name:-bpb-panel}

gh repo create "$repo_name" --public --source=. --remote=origin --push

echo ""
echo "✓ 仓库创建完成: https://github.com/$(gh repo view --json nameWithOwner -q .nameWithOwner)"
echo ""
echo "接下来请:"
echo "1. 等待 GitHub Action 完成(约2-3分钟)"
echo "2. 在 Actions 页面查看构建状态"
echo "3. 构建成功后下载 _worker.js 文件"
echo "4. 压缩为 worker.zip"
echo "5. 参考 DEPLOY.md 完成 Cloudflare 部署"
echo ""
echo "GitHub Actions 页面: https://github.com/$(gh repo view --json nameWithOwner -q .nameWithOwner)/actions"
