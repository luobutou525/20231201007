from django.shortcuts import render

def index(request):
    # 用户信息
    user_info = {
        'name': '刘锐',
        'student_id': '20231201007'
    }
    return render(request, 'helloAPP/index.html', user_info)