@echo off
cls
echo 百度贴吧项目 - 推送至Gitee
=====================

REM 设置Gitee仓库信息
set GITEE_USER=your-cold-king
set GITEE_REPO=baidu-bk
set GITEE_URL=https://%GITEE_USER%@gitee.com/%GITEE_USER%/%GITEE_REPO%.git
set BRANCH=master

echo.
echo 正在准备推送...

REM 检查Git是否安装
where git >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo 错误：未找到Git！请确保已安装并添加到PATH中。
    pause
    exit /b 1
)

REM 确保仓库已初始化
git status >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo 初始化Git仓库...
    git init
    git config user.name "Local User"
    git config user.email "user@example.com"
)

REM 配置远程仓库
git remote remove origin 2>nul
git remote add origin %GITEE_URL%
echo 配置远程仓库完成

REM 暂存并提交
git add .
git commit -m "更新项目内容" 2>nul || echo 没有新内容需要提交

echo.
echo 开始推送...
echo 注意：系统可能会弹出窗口要求输入密码或访问令牌

REM 尝试推送
git push -u origin %BRANCH%

if %ERRORLEVEL% equ 0 (
    echo.
    echo ✅ 推送成功！
) else (
    echo.
    echo ❌ 推送失败！
    echo 建议尝试以下操作：
    echo 1. 检查Gitee上是否已创建仓库
    echo 2. 确保您有仓库的推送权限
    echo 3. 使用个人访问令牌代替密码
)

pause