# BPB Panel 部署指南

## 前提条件
- GitHub 账号
- Cloudflare 账号
- 自定义域名(可选,推荐)

## 部署步骤

### 1. 创建 GitHub 仓库
1. 在 GitHub 创建新仓库(主分支必须为 `main`)
2. 上传本目录中的 `.github/workflows/Obfuscate.yml` 文件
3. 等待 GitHub Action 自动运行
4. 运行完成后会生成 `_worker.js` 文件
5. 下载 `_worker.js` 并压缩为 `worker.zip`

### 2. 创建 Cloudflare Pages
1. 登录 [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. 左侧栏: Compute (Workers) → Workers 和 Pages → 创建
3. 选择: Pages → 上传资产
4. 项目名称: 随意(不能包含 `bpb`)
5. 上传 `worker.zip` 文件

### 3. 设置环境变量
在 Pages 设置 → 变量和机密 中添加:

- **UUID**: 在线生成新的 UUID
  - [UUID生成器1](https://1024tools.com/uuid)
  - [UUID生成器2](https://www.lddgo.net/string/uuid)
  
- **PROXYIP**: 代理IP地址
  - 推荐: `cdn-b100.xn--b6gac.eu.org` 或 `bpb.yousef.isegaro.com`
  - 或从 [NSLookup](https://www.nslookup.io/domains/cdn.xn--b6gac.eu.org/dns-records/) 选择
  
- **TR_PASS**: 面板密码
  - [随机字符串生成器1](https://www.jyshare.com/front-end/9111/)
  - [随机字符串生成器2](http://tool.pfan.cn/random)

### 4. 创建并绑定 KV 命名空间
1. 存储和数据库 → KV → 创建
   - 名称: 随意(不能包含 `bpb`)
   
2. Pages 设置 → 绑定 → 添加 KV 命名空间
   - 变量名称: 必须为 `kv`
   - KV 命名空间: 选择刚创建的

### 5. 绑定自定义域名(可选但推荐)
1. Pages → 自定义域 → 添加
2. 输入你的域名(如: `vpn.example.com`)
3. 访问地址变为: `https://vpn.example.com/panel`

### 6. 重新部署
修改配置后必须重新部署:
1. Pages → 创建部署
2. 重新上传 `worker.zip`

### 7. 配置 BPB 面板
访问: `https://你的域名/panel` 或 `https://项目名.pages.dev/panel`

#### 修改密码
首次访问会提示修改密码,建议设置复杂密码

#### 面板配置
1. **FakeDNS**: 可启用(可能加快速度)
2. **Proxy IPs**: `cdn-b100.xn--b6gac.eu.org`
3. **Clean IPs**: 
   - 访问 [Scan Now](https://scanner.github1.cloud/)
   - 关闭代理后点击 Start Scan
   - 将扫描结果填入面板
4. **TLS 端口**: 勾选需要的端口(默认 443)
5. **ROUTING RULES**:
   - Bypass China: 绕过中国大陆
   - Block Ads: 屏蔽广告
   - Block Porn: 屏蔽成人网站

点击 **APPLY SETTINGS** 保存

### 8. 导入订阅
根据客户端复制对应订阅链接:
- V2rayN/V2rayNG: 复制 Singbox 订阅
- Clash: 复制 Clash 订阅

## 注意事项
- ⚠️ 不要在项目名/KV名中包含 `bpb` 关键词
- ⚠️ 每次修改配置后需要重新部署
- ⚠️ `.pages.dev` 域名在国内可能被墙,建议绑定自定义域名
- ⚠️ 不要轻易更新已稳定运行的 `_worker.js`

## 故障排查
- **1101 错误**: Cloudflare 检测到代理特征
  - 解决: 使用混淆后的代码
  - 确保项目名不含敏感词
- **无法访问面板**: 
  - 检查域名是否正确绑定
  - 尝试使用自定义域名
- **节点无法连接**:
  - 检查 Clean IP 是否正确
  - 尝试不同的 Proxy IP

## 相关链接
- [BPB Worker Panel 项目](https://github.com/bia-pain-bache/BPB-Worker-Panel)
- [Clean IP 扫描](https://scanner.github1.cloud/)
- [Cloudflare Dashboard](https://dash.cloudflare.com/)
