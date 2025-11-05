# Gitee同步指南

本指南提供了将百度贴吧项目同步到Gitee仓库的详细步骤。

## 前提条件

1. 确保已安装Git
2. 确保您的Gitee账户中有名为 `baidu-bk` 的仓库
3. 确保您已配置Git凭据（用户名和密码或访问令牌）

## Git凭据配置（重要！）

在推送前，您需要配置Git凭据。在Windows上，您可以按照以下步骤操作：

### 方法一：使用Git Credential Manager

1. 打开命令提示符（CMD）
2. 输入命令：`git config --global credential.helper manager`
3. 第一次推送时，Git会弹出窗口让您输入Gitee的用户名和密码
4. 输入后，凭据会被保存，后续推送不再需要输入

### 方法二：使用个人访问令牌（推荐）

1. 在Gitee上创建个人访问令牌：
   - 登录Gitee → 设置 → 安全设置 → 私人令牌 → 生成新令牌
   - 给令牌添加适当的权限（至少需要推送权限）
   - 保存生成的令牌（只显示一次）

2. 使用令牌替代密码进行认证

## 方法一：使用简化版批处理脚本

1. 双击运行 `sync_to_gitee_simple.bat` 文件
2. 脚本会自动完成Git操作

## 方法二：手动执行Git命令（推荐）

由于自动脚本可能会遇到认证问题，建议您手动执行以下命令：

1. 打开命令提示符（CMD）
2. 进入项目目录：`cd C:\Users\刘锐\20231201007`
3. 执行以下命令序列：

```bash
# 初始化Git仓库（如果还未初始化）
git init

# 配置用户信息
git config user.name "您的Gitee用户名"
git config user.email "您的Gitee邮箱"

# 设置凭据管理器
git config --global credential.helper manager

# 添加Gitee远程仓库
git remote add origin https://gitee.com/your-cold-king/baidu-bk.git

# 暂存所有文件
git add .

# 提交更改
git commit -m "更新项目内容"

# 推送到Gitee仓库（首次推送）
git push -u origin master
```

执行推送命令时，系统会弹出凭据窗口，输入您的Gitee用户名和密码，或使用个人访问令牌作为密码。

## 常见问题解决方案

### 1. 认证失败错误

如果出现 `Authentication failed` 错误：
- 确保输入的Gitee用户名和密码正确
- 尝试使用个人访问令牌替代密码
- 检查仓库地址是否正确

### 2. 远程仓库不存在

如果提示远程仓库不存在：
- 确认Gitee上已创建 `baidu-bk` 仓库
- 检查仓库地址中的用户名是否正确

### 3. 分支不存在

如果提示分支不存在：
- 尝试使用 `master` 分支而不是 `main` 分支
- 或在Gitee上创建对应的分支

## 注意事项

1. 确保不提交敏感信息（如数据库密码、API密钥等）
2. 本项目已包含 `.gitignore` 文件，会自动忽略Python缓存、虚拟环境和IDE配置文件
3. 如果多次认证失败，请检查您的网络连接是否正常
4. 如果仍然遇到问题，可以尝试在浏览器中访问仓库地址，确认您有正确的访问权限