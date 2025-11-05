@echo off
cls
echo ==========================
echo Baidu Tieba Project - Sync to Gitee
===========================

REM Check if Git is installed
where git >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Error: Git not found. Please install Git and add to PATH.
    pause
    exit /b 1
)
echo Git environment is OK!

REM Set Gitee repository address
set GITEE_REPO=https://gitee.com/your-cold-king/baidu-bk.git
set GITEE_BRANCH=main

echo.
echo Checking Git repository status...
git status
if %ERRORLEVEL% neq 0 (
    echo Error: Not a valid Git repository.
    echo Initializing Git repository...
    git init
    git config user.name "Local User"
    git config user.email "user@example.com"
)

echo.
echo Checking remote repository configuration...
git remote remove gitee 2>nul
git remote add gitee %GITEE_REPO%

echo.
echo Adding all changes...
git add .

echo Committing changes...
git commit -m "Update project content" 2>nul || echo No changes to commit.

echo.
echo Pushing to Gitee repository...
git push -u gitee %GITEE_BRANCH% --force

if %ERRORLEVEL% equ 0 (
    echo.
    echo ========================================
    echo Success: Project synced to Gitee!
    echo Repository: %GITEE_REPO%
    echo Branch: %GITEE_BRANCH%
    echo ========================================
) else (
    echo.
    echo ========================================
    echo Error: Push failed!
    echo Make sure Gitee repository "your-cold-king/baidu-bk" exists.
    ========================================
)

pause