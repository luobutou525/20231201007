from django.shortcuts import render

def home(request):
    """
    网站首页视图函数
    
    提供网站的主入口页面，展示可用的应用入口
    
    Args:
        request: HTTP请求对象
        
    Returns:
        HttpResponse: 渲染后的首页模板
    """
    return render(request, 'index.html')