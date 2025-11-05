@echo off
cls
echo PUSHING TO GITHUB/GITEE

REM Basic push script with minimal commands
set URL=https://gitee.com/your-cold-king/baidu-bk.git
git add .
git commit -m "update" 2>nul
git remote add origin %URL% 2>nul
git push -u origin master

if %ERRORLEVEL% equ 0 (
  echo SUCCESS
) else (
  echo FAILED
  echo Try manual commands:
  echo 1. git add .
  echo 2. git commit -m "update"
  echo 3. git push origin master
)
pause