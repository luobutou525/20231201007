from django.shortcuts import render

def profile_view(request):
    """
    个人信息页面视图函数
    
    提供用户基本信息展示功能，包括姓名和学号等数据
    
    Args:
        request: HTTP请求对象
        
    Returns:
        HttpResponse: 渲染后的个人信息页面
    """
    # 准备用户信息数据
    profile_data = {
        'name': '刘锐',
        'student_id': '20231201007'
    }
    
    # 渲染模板并返回响应
    return render(request, 'profileAPP/index.html', profile_data)