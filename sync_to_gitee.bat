@echo off
cls
echo ========================
echo 百度贴吧项目 - 同步到Gitee
========================

REM 检查Git是否安装
where git >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo 错误：未找到Git。请确保Git已正确安装并添加到系统PATH中。
    pause
    exit /b 1
)
echo Git环境正常！

REM 设置Gitee仓库地址
set GITEE_REPO=https://gitee.com/your-cold-king/baidu-bk.git
set GITEE_BRANCH=main

echo.
echo 检查Git仓库状态...
git status
if %ERRORLEVEL% neq 0 (
    echo 错误：当前目录不是有效的Git仓库。
    echo 正在初始化Git仓库...
    git init
    git config user.name "Local User"
    git config user.email "user@example.com"
    echo 创建.gitignore文件...
    if not exist ".gitignore" (
        echo # Python > .gitignore
        echo __pycache__/ >> .gitignore
        echo *.py[cod] >> .gitignore
        echo *$py.class >> .gitignore
        echo *.so >> .gitignore
        echo .Python >> .gitignore
        echo. >> .gitignore
        echo # Django >> .gitignore
        echo *.log >> .gitignore
        echo local_settings.py >> .gitignore
        echo *.sqlite3 >> .gitignore
        echo. >> .gitignore
        echo # Virtual Environment >> .gitignore
        echo .venv/ >> .gitignore
        echo env/ >> .gitignore
        echo venv/ >> .gitignore
        echo ENV/ >> .gitignore
        echo. >> .gitignore
        echo # IDE >> .gitignore
        echo .vscode/ >> .gitignore
        echo .idea/ >> .gitignore
        echo *.swp >> .gitignore
        echo *.swo >> .gitignore
        echo. >> .gitignore
        echo # OS >> .gitignore
        echo .DS_Store >> .gitignore
        echo Thumbs.db >> .gitignore
    )
)

echo.
echo 检查远程仓库配置...
git remote -v > remote.txt
findstr "gitee" remote.txt >nul 2>nul
set REMOTE_EXISTS=%ERRORLEVEL%
del remote.txt

if %REMOTE_EXISTS% neq 0 (
    echo 添加Gitee远程仓库...
    git remote add gitee %GITEE_REPO%
    if %ERRORLEVEL% neq 0 (
        echo 警告：添加远程仓库失败，可能已存在其他名称的远程仓库。
        echo 尝试使用现有的origin远程仓库...
        git remote remove origin 2>nul
        git remote add origin %GITEE_REPO%
    )
) else (
    echo Gitee远程仓库已配置，更新URL...
    git remote set-url gitee %GITEE_REPO%
)

echo.
echo 暂存所有更改...
git add .

set commit_msg=
set /p commit_msg="请输入提交信息 (默认: 更新项目内容): "
if "%commit_msg%"=="" set commit_msg="更新项目内容"

echo 提交更改...
git commit -m %commit_msg%

REM 尝试拉取最新代码（避免冲突）
echo.
echo 尝试拉取远程代码...
git pull --rebase gitee %GITEE_BRANCH% 2>nul
if %ERRORLEVEL% neq 0 (
    echo 拉取失败，可能是首次推送或分支不存在。继续执行推送操作...
)

echo.
echo 推送到Gitee仓库...
git push -u gitee %GITEE_BRANCH%

if %ERRORLEVEL% equ 0 (
    echo.
    echo =======================================
    echo 成功：项目已同步到Gitee仓库！
    echo 仓库地址：%GITEE_REPO%
    echo 分支：%GITEE_BRANCH%
    echo =======================================
) else (
    echo.
    echo =======================================
    echo 错误：推送失败！
    echo 可能的原因：
    echo 1. 网络连接问题
    echo 2. Gitee仓库权限不足
    echo 3. 需要先在Gitee创建仓库
    echo 请确保Gitee仓库 "your-cold-king/baidu-bk" 已存在且您有访问权限。
    echo =======================================
)

pause