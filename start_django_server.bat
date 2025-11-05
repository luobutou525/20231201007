@echo off
cls
echo ========================
echo 百度贴吧导航 - 启动服务器
echo ========================
echo 正在检查Python环境...
python --version
if %ERRORLEVEL% neq 0 (
    echo 错误：未找到Python。请确保Python已正确安装并且添加到系统PATH中。
    pause
    exit /b 1
)
echo Python环境正常！

echo 正在检查Django项目...
if exist "manage.py" (
    echo 找到manage.py，开始启动服务器...
    echo. 
    echo 服务器将运行在 http://localhost:8000
    echo. 
    echo 按 Ctrl+C 停止服务器
    echo. 
    python manage.py runserver
) else (
    echo 错误：未找到manage.py文件。
    pause
    exit /b 1
)