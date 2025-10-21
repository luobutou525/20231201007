try:
    import django
    print(f"Django version: {django.__version__}")
except ImportError:
    print("Django is not installed")