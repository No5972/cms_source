---
layout: post
title: "仅作笔记用：Windows 11 通过 PowerShell 打开 IE 浏览器"
date: 2023-03-15 17:00:00
categories: 
  - [Webapp]
  - [PowerShell]
excerpt: "收到一条传闻，说 Windows 11 在 Dev 的版本 25309 里面移除了 VBS 的支持，此改动预计在正式版 23H2 中实装。这导致原有 VBS 方式打开 IE 浏览器的方法失效。去 Microsoft Learn 上查了一下文档，得知这个 CreateObject方法在 PowerShell 中也可以使用。那么我们就可以从 PowerShell 中继续使用这个方法来打开 IE 浏览器。汇总了一下线索之后将语句浓缩成这一行，直接执行就可以了。
"
mathjax: true
permalink: /archivers/145
isrepublish: false
---


收到一条传闻，说 Windows 11 在 Dev 的版本 25309 里面移除了 VBS 的支持，此改动预计在正式版 23H2 中实装。这导致原有 VBS 方式打开 IE 浏览器的方法失效。

去 Microsoft Learn 上查了一下文档，[得知这个 ```CreateObject``` 方法在 PowerShell 中也可以使用。](https://learn.microsoft.com/zh-cn/powershell/scripting/samples/creating-.net-and-com-objects--new-object-?view=powershell-7.2#creating-com-objects-with-new-object)那么我们就可以从 PowerShell 中继续使用这个方法来打开 IE 浏览器。[汇总了一下线索](https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/about/about_booleans?view=powershell-7.2)之后将语句浓缩成这一行，直接执行就可以了。

右键开始按钮，运行，输入 ```powershell``` 确定。输入这一条语句回车，即可打开 IE 浏览器。

```powershell
$(New-Object -ComObject InternetExplorer.Application).Visible=$true
```

---

如果需要创建一键执行文件的话，就这样操作。打开开始菜单，输入 ```notepad```回车，打开记事本。然后输入这条语句：

```bat
powershell -command "$(New-Object -ComObject InternetExplorer.Application).Visible=$true"
```

然后保存文件，保存类型选择所有文件，保存文件名随便起一个，注意文件名后面加上 ```.cmd```后缀。 **特请注意编码选择 ANSI。** 找一个自己以后找得到的地方保存。然后以后直接双击打开该文件就可以打开 IE 浏览器了。

**参考资料：**
1. [使用 New-Object 创建 COM 对象 - 创建 .NET 和 COM 对象 - PowerShell | Microsoft Learn](https://learn.microsoft.com/zh-cn/powershell/scripting/samples/creating-.net-and-com-objects--new-object-?view=powershell-7.2#creating-com-objects-with-new-object)
2. [关于布尔值 - PowerShell | Microsoft Learn](https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/about/about_booleans?view=powershell-7.2)
3. [windows - run powershell command from cmd - Super User](https://superuser.com/questions/1080239/run-powershell-command-from-cmd)
