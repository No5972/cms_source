---
layout: post
title: "仅做笔记用：PowerShell 关闭显示器"
date: 2023-10-09 18:30:00
categories: 
  - [PowerShell]
excerpt: "使用这个命令可以手动关闭显示器，这样就不需要第三方工具甚至自己写C/C++/C#/Python代码了。"
mathjax: true
permalink: /archivers/153
isrepublish: false
---

使用这个命令可以手动关闭显示器，这样就不需要第三方工具甚至自己写C/C++/C#/Python代码了。

```powershell
(Add-Type '[DllImport("user32.dll")]public static extern int SendMessage(int hWnd, int hMsg, int wParam, int lParam);' -Name a -Pas)::SendMessage(-1,0x0112,0xF170,2)
```

也可以写成 CMD 的形式，这样就可以直接放到运行窗口运行或是创建快捷方式了。

```bat
powershell -command "(Add-Type '[DllImport(\"user32.dll\")]public static extern int SendMessage(int hWnd, int hMsg, int wParam, int lParam);' -Name a -Pas)::SendMessage(-1,0x0112,0xF170,2)"
```
