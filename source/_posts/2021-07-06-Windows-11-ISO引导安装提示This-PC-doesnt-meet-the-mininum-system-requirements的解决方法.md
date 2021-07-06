---
layout: post
title: "Windows 11 ISO引导安装提示此电脑不符合安装此版本Windows的最低要求的解决方法"
date: 2021-07-06 15:30:00
categories: 
  - [Webapp]
excerpt: "微软近期推出了Windows 11操作系统。但是很多同志在切换到Dev渠道的时候遇到了“你的电脑不满足Windows 11的最低硬件要求”的提示。于是尝试直接从ISO启动引导安装，结果又遇到“此电脑不符合安装此版本Windows的最低要求”。这种情况主要还是因为安全启动和TPM没有打开。但是TPM也不是说开就能开的。好在 Windows Latest 的 Mayank Parmar 提供了一个ISO引导安装无视这两项检测的方法。"
mathjax: true
permalink: /archivers/94
---

微软近期推出了Windows 11操作系统。但是很多同志在切换到Dev渠道的时候遇到了“你的电脑不满足Windows 11的最低硬件要求”的提示。于是尝试直接从ISO启动引导安装，结果又遇到“此电脑不符合安装此版本Windows的最低要求”。这种情况主要还是因为安全启动和TPM没有打开。但是TPM也不是说开就能开的。

![](https://www.windowslatest.com/wp-content/uploads/2021/06/Bypass-Windows-11-TPM-2.0.jpg)

好在 Windows Latest 的 Mayank Parmar 提供了一个ISO引导安装无视这两项检测的方法。

遇到此画面的时候，按快捷键Shift + F10打开命令提示符。输入```regedit```打开注册表编辑器。定位到```HKEY_LOCAL_MACHINE\SYSTEM\Setup```。在这个键下面创建一个键```LabConfig```，选中这个```LabConfig```，再创建两个“DWORD (32位)”键值```BypassTPMCheck```和```BypassSecureBootCheck```，值都是```1```

![](https://dingyue.ws.126.net/2021/0702/a682570cj00qvkufq009hc000jg00elc.jpg)

关掉注册表编辑器和命令提示符。如果还是这个提示的话，点击安装窗口左上角的左箭头按钮。回到条款界面，选择“自定义：仅安装 Windows (高级)”。如果看到选择安装分区的界面就可以按照原来的方式来安装Windows 11了。

{% note info %}
如果需要保留原来的个人文件的话，在选择分区界面不要把原来系统盘格式化，而是直接选择原系统盘来覆盖安装。这样原系统盘```Users```目录下的个人文件在覆盖安装后将被集中到系统盘根目录的```Windows.old```目录。但是无法保留其他的文件。
{% endnote %}