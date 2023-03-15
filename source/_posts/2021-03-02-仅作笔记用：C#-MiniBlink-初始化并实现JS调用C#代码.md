---
layout: post
title: "仅作笔记用：C# MiniBlink 初始化并实现JS调用C#代码"
date: 2021-03-02 16:00:00
categories: C#
excerpt: "创建WinForm项目，打开“工具-NuGet包管理器-管理解决方案的NuGet包”。搜索“Miniblink”，选择MiniBlinkNet进行安装。
在项目的Resources目录添加设计的HTML文件作为显示界面。例如mainPage.html。在解决方案浏览器选中这个文件，在属性窗口的生成操作选择“嵌入的资源”。"
mathjax: true
permalink: /archivers/76
---

创建WinForm项目，打开“工具-NuGet包管理器-管理解决方案的NuGet包”。搜索“Miniblink”，选择MiniBlinkNet进行安装。
在项目的```Resources```目录添加设计的HTML文件作为显示界面。例如```mainPage.html```。在解决方案浏览器选中这个文件，在属性窗口的生成操作选择“嵌入的资源”。
初始化的代码要点：
* 在C#中读取资源内容。
* 定义全局变量```WebView```和```Panel```。
* 在C#代码中绑定JS函数名。
* C#在同一个类下实现该方法。
* 在网页内使用JS调用之前绑定的函数名。

代码如下。
```csharp
// 省去开头的其他using
using Kyozy.MiniblinkNet;

namespace dotnet5demo
{
    public partial class Form1 : Form
    {
        WebView browser;
        Panel p;

        public Form1()
        {
            browser = new WebView();
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

            Assembly assembly = Assembly.GetExecutingAssembly();
            // 指定资源名称
            System.IO.Stream stream = assembly.GetManifestResourceStream("dotnet5demo.Resources.mainPage.html");
            // 储存网页HTML的字符串对象
            string mainPage = new StreamReader(stream).ReadToEnd();
            
            p = new Panel();
            p.AutoSize = false;
            p.Dock = DockStyle.Fill;
            this.Controls.Add(p);

            if (!browser.Bind(p)) return;

            browser.SetDeviceParameter("screen.width", string.Empty, 1440);
            browser.NavigationToNewWindowEnable = false;

            browser.LoadHTML(mainPage);
            JsValue.BindFunction("click", new wkeJsNativeFunction(csClick), 0); 
            // 最后一个参数是原生函数形参数量。若需要在C#代码获取JS传过来的参数，则调用表达式JsValue.Arg(es, 0).ToString(es)即可，第二个参数0是参数序号。
        }

        private long csClick(IntPtr es, IntPtr param)
        {
            MessageBox.Show("Hello, World!", "MiniBlinkDemo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            Application.Exit();
            return 0L;
        }
    }
}
```

`mainPage.html`代码如下：

```html
<html>
<head>
    <link rel="stylesheet" href="https://cdn.staticfile.org/layui/2.4.3/css/layui.css"/>
</head>
<body>
    <h1>Hello, World!</h1>
    <button class="layui-btn layui-btn" id="btn">Button</button>
    <script>
        document.getElementById("btn").onclick = click;
    </script>
</body>
</html>
```
这样，点击按钮就可以执行对应的C#代码了。![在这里插入图片描述](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/20210302163028593.png)
