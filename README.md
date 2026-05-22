# BPB Panel 部署项目

基于 [BPB Worker Panel](https://github.com/bia-pain-bache/BPB-Worker-Panel) 的个人 VPN 部署方案。

## 快速开始

### 方法一: 自动部署(推荐)

```bash
chmod +x deploy.sh
./deploy.sh
```

### 方法二: 手动部署

1. 创建 GitHub 仓库(主分支必须为 `main`)
2. 上传 `.github/workflows/Obfuscate.yml`
3. 推送到 GitHub
4. 等待 Action 构建完成
5. 参考 [DEPLOY.md](./DEPLOY.md) 完成 Cloudflare 部署

## 项目结构

```
.
├── .github/
│   └── workflows/
│       └── Obfuscate.yml    # GitHub Action 配置
├── DEPLOY.md                # 详细部署指南
├── deploy.sh                # 自动部署脚本
└── README.md                # 本文件
```

## 特性

- ✅ 自动混淆 BPB 源代码
- ✅ 每日自动更新最新版本
- ✅ 避免 Cloudflare 1101 错误
- ✅ 完整部署文档

## 文档

详细部署步骤请查看 [DEPLOY.md](./DEPLOY.md)

## 注意

⚠️ 本项目仅供学习研究使用,请遵守当地法律法规

## 相关链接

- [原项目](https://github.com/bia-pain-bache/BPB-Worker-Panel)
- [教程来源](https://www.haoyep.com/posts/cf-bpb-vpn/)
