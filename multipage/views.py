from django.http import Http404, HttpResponse
from django.shortcuts import render

# Create your views here.
def index(request):
    return render(request, "multipage/index.html")

# 丰富的内容数据
section_contents = [
    # 内容区域 1
    """
    <div class="section-content">
        <h2 style="color: #2c3e50; margin-bottom: 20px;">内容区域 1：系统介绍</h2>
        <p>欢迎使用我们的多功能页面导航系统！</p>
        <p>本系统旨在提供一个高效、美观的内容浏览体验。通过现代化的界面设计和流畅的交互效果，让用户能够轻松访问和查看各类信息。</p>
        <div style="background: #f8f9fa; padding: 20px; border-radius: 10px; margin-top: 20px;">
            <h3 style="color: #3498db;">系统特点：</h3>
            <ul style="list-style: none; padding-left: 0; text-align: left; max-width: 600px; margin: 0 auto;">
                <li style="padding: 10px 0; border-bottom: 1px solid #eee;">• 响应式设计，适配各种设备屏幕</li>
                <li style="padding: 10px 0; border-bottom: 1px solid #eee;">• 现代化UI，渐变色彩和卡片式布局</li>
                <li style="padding: 10px 0; border-bottom: 1px solid #eee;">• 流畅的动画和过渡效果</li>
                <li style="padding: 10px 0;">• 友好的用户交互体验</li>
            </ul>
        </div>
    </div>
    """,
    # 内容区域 2
    """
    <div class="section-content">
        <h2 style="color: #2c3e50; margin-bottom: 20px;">内容区域 2：功能展示</h2>
        <p>本页面展示了系统的核心功能模块。</p>
        <div style="display: flex; justify-content: center; flex-wrap: wrap; gap: 20px; margin-top: 30px;">
            <div style="background: linear-gradient(135deg, #74b9ff, #0984e3); color: white; padding: 30px; border-radius: 15px; width: 300px; text-align: center;">
                <h3 style="margin-bottom: 15px;">导航功能</h3>
                <p>便捷的内容切换，支持历史记录管理</p>
            </div>
            <div style="background: linear-gradient(135deg, #fd79a8, #e84393); color: white; padding: 30px; border-radius: 15px; width: 300px; text-align: center;">
                <h3 style="margin-bottom: 15px;">动态加载</h3>
                <p>异步获取内容，提升页面加载速度</p>
            </div>
            <div style="background: linear-gradient(135deg, #00b894, #00cec9); color: white; padding: 30px; border-radius: 15px; width: 300px; text-align: center;">
                <h3 style="margin-bottom: 15px;">视觉效果</h3>
                <p>精美的动画和过渡效果，提升用户体验</p>
            </div>
        </div>
    </div>
    """,
    # 内容区域 3
    """
    <div class="section-content">
        <h2 style="color: #2c3e50; margin-bottom: 20px;">内容区域 3：使用指南</h2>
        <p>以下是使用本系统的简单指南：</p>
        <div style="background: #fff; border: 2px solid #e0e0e0; border-radius: 10px; padding: 25px; max-width: 600px; margin: 30px auto; text-align: left;">
            <h3 style="color: #2d3436; margin-bottom: 20px;">使用步骤：</h3>
            <ol style="padding-left: 20px;">
                <li style="margin-bottom: 15px; font-size: 16px;">点击上方的导航按钮选择您想要查看的内容区域</li>
                <li style="margin-bottom: 15px; font-size: 16px;">系统会自动加载并展示相应的内容</li>
                <li style="margin-bottom: 15px; font-size: 16px;">您可以使用浏览器的前进/后退按钮切换历史内容</li>
                <li style="font-size: 16px;">在移动设备上，导航按钮会自动调整为垂直排列</li>
            </ol>
        </div>
        <p style="color: #6c5ce7; font-weight: bold;">祝您使用愉快！如有任何问题，请联系技术支持。</p>
    </div>
    """
]

def section(request, num):
    """获取指定内容区域的内容"""
    try:
        # 验证请求的区域编号是否有效
        if 1 <= num <= 3:
            content = section_contents[num - 1]
            return HttpResponse(content)
        else:
            # 返回404错误页面
            return HttpResponse('<div style="text-align: center; padding: 50px; color: #e74c3c;"><h2>错误：404</h2><p>请求的内容区域不存在</p><p>请返回主页并选择正确的内容区域</p></div>', status=404)
    except Exception as e:
        # 捕获其他可能的异常
        return HttpResponse(f'<div style="text-align: center; padding: 50px; color: #e74c3c;"><h2>服务器错误</h2><p>处理请求时发生错误</p></div>', status=500)