# Gitee数据同步指南

本文档提供了将百度贴吧项目数据同步到Gitee仓库的详细步骤和注意事项。

## 前提条件

1. 已安装Git客户端
2. 有Gitee账号
3. 已创建Gitee仓库 `your-cold-king/baidu-bk`
4. 有仓库的推送权限

## 使用方法

### 方法一：使用批处理脚本（推荐）

1. 在项目根目录 `c:\Users\刘锐\20231201007\` 中找到 `sync_to_gitee.bat` 文件
2. 双击运行该批处理文件
3. 按照提示输入提交信息（可使用默认值）
4. 等待脚本自动执行同步操作

### 方法二：手动执行Git命令

如果批处理脚本执行失败，可以尝试手动执行以下Git命令：

```bash
# 打开命令提示符(cmd)
# 进入项目目录
cd c:\Users\刘锐\20231201007\

# 初始化Git仓库（如果尚未初始化）
git init

# 配置用户名和邮箱
git config user.name "您的Gitee用户名"
git config user.email "您的邮箱"

# 添加远程仓库
git remote add origin https://gitee.com/your-cold-king/baidu-bk.git

# 暂存所有更改
git add .

# 提交更改
git commit -m "更新项目内容"

# 推送到Gitee
git push -u origin main
```

## 常见问题与解决方案

### 1. Git未安装或未在PATH中

**错误提示**：`未找到Git`

**解决方案**：
- 从[Git官网](https://git-scm.com/downloads)下载并安装Git
- 确保在安装过程中选择将Git添加到系统PATH

### 2. Gitee仓库不存在

**错误提示**：`仓库不存在` 或 `404 Not Found`

**解决方案**：
- 首先在Gitee上创建名为 `baidu-bk` 的仓库
- 确保创建者用户名是 `your-cold-king`

### 3. 权限不足

**错误提示**：`Permission denied` 或 `403 Forbidden`

**解决方案**：
- 确保您对该仓库有推送权限
- 可能需要配置Gitee SSH密钥或使用HTTPS凭证
- 尝试使用用户名密码方式：`https://用户名:密码@gitee.com/your-cold-king/baidu-bk.git`

### 4. 分支不存在

**错误提示**：`找不到远程分支main`

**解决方案**：
- 尝试使用 `master` 分支：`git push -u origin master`
- 或者在Gitee仓库中先创建 `main` 分支

## 注意事项

1. 请确保 `.gitignore` 文件已正确配置，避免上传不必要的文件（如虚拟环境、数据库文件等）
2. 敏感信息（如数据库密码、密钥等）不应提交到代码仓库
3. 如果是首次推送，可能需要先创建仓库并初始化README文件
4. 如需进一步帮助，请参考Gitee官方文档或联系仓库管理员

---

祝您使用愉快！