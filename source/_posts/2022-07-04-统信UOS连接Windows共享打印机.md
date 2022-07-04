---
layout: post
title: "统信 UOS 连接 Windows 共享打印机"
date: 2022-07-04 17:30:00
categories: 
  - [Webapp]
excerpt: "系统是统信 UOS 家庭版。由于 VMWare 虚拟机直接连接打印机，主机会蓝屏，所以这里改为采用连接 Windows 共享的打印机来测试 UOS 的系统打印功能。"
mathjax: true
permalink: /archivers/127
isrepublish: false
---

系统是统信 UOS 家庭版。由于 VMWare 虚拟机直接连接打印机，主机会蓝屏，所以这里改为采用连接 Windows 共享的打印机来测试 UOS 的系统打印功能。

# 在 Windows 配置打印机共享

在 Windows 系统的“启用或关闭 Windows 功能”开启 LPD 功能。点击开始按钮，输入“启用或关闭Windows功能”回车即可打开。或者也可以在运行输入特别的命令快速打开：

```bat
rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,2
```

打开后展开“打印和文件服务”，勾选“LPD 打印服务”并确定。

![](https://img-blog.csdnimg.cn/fa50a9881365472e8cfc876c0c75bff4.png)

还是在控制面板，点选“查看设备和打印机”。或者也可以在运行输入特别的命令快速打开：

```bat
explorer shell:::{A8A91A66-3A7D-4424-8D24-04E180695C7A}
```

将已经连接的打印机右键，选择打印机属性，共享选项卡，勾选共享这台打印机，并输入一个不包含空格和特殊字符的名称，确定。

![](https://img-blog.csdnimg.cn/ce71937fdf594be58e46624984506dc1.png)

这样就完成了 Windows 端的打印机共享。

# 在 UOS 连接由 Windows 共享的打印机

到打印机厂商的网站下载该型号打印机的 Linux 驱动。这里的 UOS 家庭版默认是 64 位的，所以下载 64 bit 的驱动。

下载好之后开启开发者模式，执行 ```install.sh``` 在终端中运行，按提示进行驱动安装。

安装好之后，在启动器菜单会出现配置打印机的选项，点击添加，选择之前打印机的型号，下一步选择“LPD”，主机名或 IP 地址输入 IP 地址斜杠共享的打印机名称，此处测试的为

```
192.168.49.1/CanonLBP62306240
```

![](https://img-blog.csdnimg.cn/572e4e1178a448649ed1c8fc0082d435.png)

点击注册，这样就完成了打印机的连接和配置。

如果需要测试效果的话，可以在启动器打开打印管理器，此时会发现多出来了一个打印机，这就是刚才添加的打印机，选中它点击打印测试页，然后就开始打印了。

![](https://img-blog.csdnimg.cn/ab238525f8984600a00587c55b1d288f.png)