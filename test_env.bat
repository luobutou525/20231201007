@echo off
cls
echo 测试Python环境...
python --version
echo.
echo 测试Django命令...
python manage.py check
pause