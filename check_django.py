import sys
print(f"Python版本: {sys.version}")
try:
    import django
    print(f"Django版本: {django.__version__}")
except ImportError:
    print("Django未安装")