---
layout: post
title: "C# CEF 使用内置devtools对整个网页截图"
date: 2020-12-17 18:00:00
categories: 
 - [C#]
 - [Automation]
excerpt: "这样做的一个好处是不需要再调用Win32底层API。直接走CEF组件的方法就可以截图，也不需要专门整个OffScreen的组件，毕竟还要复制和继承，并且也占内存。而且即使是CEF视窗超出屏幕，或者被其他窗口挡住，甚至使用特殊手段把窗口调大到大于屏幕的分辨率，此方法也可以截取得到。"
permalink: /archivers/51
---

22.01.19 更新：刚刚发现这个并不是整页截图。这个 ```CaptureScreenshotAsync``` 如果不事先设置的话确实默认只能截取当前视口范围内显示的图像，如果要整页截图的话得先调用  ```CefSharp.DevTools.Emulation.EmulationClient.SetDeviceMetricsOverrideAsync``` 开启设备模拟，把模拟设备分辨率的高度改成和页面高度一致，然后再执行前者方法来截图。截图完了再调用  ```CefSharp.DevTools.Emulation.EmulationClient.ClearDeviceMetricsOverrideAsync``` 关闭设备模拟。手头没有 C# 的开发环境，代码暂时先不贴了。

---

21.01.18更新：[CSDN论坛的大佬给出了一个解决方案](https://bbs.csdn.net/topics/398544662)，可以多次调用截图了。这里也贴出来供参考。
这里改成了用全局变量的```PageClient```来暂存页面对象。因为如果把这个定义语句放在方法里面的话还是会报错“Generated MessageID 100002 doesn't match returned Message Id 100001”，所以要放在全局变量里面才行。
```csharp
        CefSharp.DevTools.Page.PageClient pageClien= null;
        private async void invokeCapture()
        {
            if(pageClien==null)
            {
                pageClien =  webBrowser.GetBrowser().GetDevToolsClient().Page;
            }

            var result = await pageClien.CaptureScreenshotAsync();
            
            if (result.Data != null)
            {

                MemoryStream ms = new MemoryStream(result.Data);
                ms.Write(result.Data, 0, result.Data.Length);

                SaveFileDialog dialog = new SaveFileDialog();
                dialog.Filter = "PNG图片 (*.PNG)|*.PNG";
                DialogResult dresult = dialog.ShowDialog();
                if (dresult == DialogResult.OK)
                {
                    string path = dialog.FileName;
                    try
                    {
                        File.WriteAllBytes(path, result.Data);
                        MessageBox.Show(path + "保存成功。");
                    }
                    catch (Exception e)
                    {
                        MessageBox.Show(path + "保存失败！错误信息：" + e.Message);
                    }
                }
            }
        }
```

---


这样做的一个好处是不需要再调用Win32底层API。直接走CEF组件的方法就可以截图，也不需要专门整个```OffScreen```的组件，毕竟还要复制和继承，并且也占内存。而且即使是CEF视窗超出屏幕，或者被其他窗口挡住，甚至使用特殊手段把窗口调大到大于屏幕的分辨率，此方法也可以截取得到。
但是这个办法还只能截一次图，不能截多次，必须退出重开才能继续截图。第二次截图会报错“Generated MessageID 100002 doesn't match returned Message Id 100001”。网上尚无解决方案，包括外国社区。[鄙人就此问题已在StackOverflow提问。](https://stackoverflow.com/questions/65334430/message-id-went-wrong-when-using-cef-devtools-executedevtoolsmethodasync-and-page-capturescreenshot)
把Github上面那个代码[https://github.com/cefsharp/CefSharp/blob/master/CefSharp.Example/DevTools/DevToolsExtensions.cs](https://github.com/cefsharp/CefSharp/blob/master/CefSharp.Example/DevTools/DevToolsExtensions.cs)拷过来，放到项目里面，改一下命名空间。然后就可以对CEF控件直接调用了。这里用的是WinForm显示的GUI。然后在代码里面这样写方法就可以调用了。
```csharp
        private async void invokeCapture()
        {
            try
            {
                byte[] result = await CefSharp.Example.DevTools.DevToolsExtensions.CaptureScreenShotAsPng(browser); // browser是CEF控件实例
                SaveFileDialog dialog = new SaveFileDialog();
                dialog.Filter = "PNG图片 (*.PNG)|*.PNG";
                DialogResult dresult = dialog.ShowDialog();
                if (dresult == DialogResult.OK)
                {
                    string path = dialog.FileName;
                    try
                    {
                        File.WriteAllBytes(path, result);
                        MessageBox.Show(path + "保存成功。");
                        
                    } catch (Exception e)
                    {
                        MessageBox.Show(path + "保存失败！错误信息：" + e.Message);
                    }
                }

            }
            catch (Exception ee)
            {
                MessageBox.Show("目前暂时只支持截一次图，暂时不支持截更多次数的图片，如果要继续截图得退出程序重开。作者确实没法解决这个问题了，谁有好的想法也欢迎提出来，具体详情请关注https://stackoverflow.com/questions/65334430/message-id-went-wrong-when-using-cef-devtools-executedevtoolsmethodasync-and-pag 。相关技术细节：" + ee.Message, "暂不支持的操作", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
```