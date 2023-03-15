---
layout: post
title: "传新版支持光追的 MikuMikuDance 正由另一人研发——MikuMikuDance 2 Project"
date: 2022-02-15 17:00:00
categories: 
  - [Webapp]
excerpt: "欢迎来到下一代 MMD 项目：为每个人准备的新的 3D 操场。MMD2 是完全从头开始构建的，这充分表明我们拥有完整的软件底层控制。我们想要什么功能就可以创建什么功能。不需要计算机图形学的专业知识，到时候会有专门的教程。您可以创建自己的渲染资源或使用每个人共享的资源。渲染资源可以是任意内容，从图像、音乐文件，到模型、着色器或者舞台……"
mathjax: true
permalink: /archivers/123
isrepublish: true
---

来源：[![MikuMikuDance 2 Project](https://img.shields.io/badge/MikuMikuDance%202%20Project-brightgreen)](https://www.tamafutoshi.net/mmd2.html)

# 项目介绍
最近更新：2022/01/09

欢迎来到下一代 MMD 项目：为每个人准备的新的 3D 操场。MMD2 是完全从头开始构建的，这充分表明我们拥有完整的软件底层控制。我们想要什么功能就可以创建什么功能。
不需要计算机图形学的专业知识，到时候会有专门的教程。您可以创建自己的渲染资源或使用每个人共享的资源。渲染资源可以是任意内容，从图像、音乐文件，到模型、着色器或者舞台……

# 重要通知
我们这个 MMD2 并不是原来 MMD 的官方升级。这个软件后续可能会改名。

这是一个另外的项目，作者并没有原来 MMD 的源代码。模型和动作数据由社区分享。


# 最新进展（油管视频）
[https://www.youtube.com/embed/49Vz_WRWYow](https://www.youtube.com/embed/49Vz_WRWYow)

# 软件预览
![](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/img_convert/032b3788da5e4b377f07af5ab990cca1.png)
![](https://www.tamafutoshi.net/mmd2/img/mmd2-apho2-bronya-1920x1080.jpg)

![](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/img_convert/1f14c6893034108bfac9e9937be74c58.png)
![](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/img_convert/a56a9752721105650890afa6f581aecb.png)

![](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/img_convert/85877c256439876eb8f12e32e73dce25.png)

![](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/img_convert/d53d67a4bce70e7ca27c0001eee23f72.png)

<table><tbody><tr><td>
  <video controls src="https://www.tamafutoshi.net/mmd2/video/mmd2-tda-mikuv4-1080p.mp4"></video><br>
初音模型 快速浏览
</td><td>
  <video controls src="https://www.tamafutoshi.net/mmd2/video/mmd2-tda-kizuna-ai-1080p.mp4"></video><br>
爱酱模型 快速浏览
</td></tr></table></table>


# 构架
<table>
<thead>
<tr><td>名称</td><td>说明</td>
</thead>
<tbody>
<tr><td>编程语言</td><td>C++</td></tr>
<tr><td>3D API</td><td> <a href="https://docs.microsoft.com/en-us/windows/win32/direct3d12/directx-12-programming-guide">DirectX 12</a> <br>用于 3D 渲染操作</td></tr>
<tr><td>2D API</td><td><a href="https://docs.microsoft.com/en-us/windows/win32/direct2d/direct2d-portal">Direct2D</a><br>用于 2D 渲染操作，例如渲染软件界面</td></tr>
<tr><td>多线程</td><td>支持！<br>多线程允许我们分解复杂的场景，并利用高 CPU 内核数获得更高的 FPS。</td></tr>
<tr><td>物理 API</td><td><a href="https://developer.nvidia.com/gameworks-physx-overview">NVIDIA PhysX</a> <br>用于模型的物理计算，例如刚体和衣服</td></tr>
<tr><td>最低系统要求</td><td>Windows 10，以及兼容 DirectX 12 的 GPU</td></tr>
</tbody>
</table>

# 当前项目状态
- 加载模型：已做
- 镜头：已做
- 着色器材质：已做
- 骨骼控制器：已做
- 变形：只做了顶点变形
- PhysX 和刚体：已做
- IK 解算：已做
- 动画系统：已做
- 待完成：投影映射，更多种类的变形支持，界面，光线追踪，引擎核心升级……

# 功能
原来 MMD 核心功能（加载模型/动画/音频等）到时候在 MMD2 都有。也会根据社区反映情况再添加新的功能。
<span style="color:red;">着色器：</span>可以在“运行时”中编译着色器，或者也可以使用其他贡献者提供的编译好的着色器。
[光线追踪](https://baike.baidu.com/item/%E5%85%89%E7%BA%BF%E8%BF%BD%E8%B8%AA/3334993)会上。需要 Windows 10 2018 年 10 月更新（版本 1809），以及支持光追的 GPU。

# 和原来版本的变化
<span style="color:red;">Truevision TGA（.tga）贴图：</span>不支持这种贴图格式了。要适应 MMD2，需要将这种贴图转换为 .png 或者 .dds 格式。可以网上搜索在线转换 TGA 到 PNG 的工具，或者也可以等作者的教程。
<span style="color:red;">刚体和关联（joint）数据：</span>刚体和关联数据可以在 MMD 很好的使用，但是在 MMD2 不能用。需要通过 PhysX 规范为 MMD2 更正它们。

# 开发历史
<span style="color:red;">2022/01</span>：添加了边缘着色器和一些照明计算。

<span style="color:red;">2021/10</span>：IK 解算算法已修复。效果很好。

<span style="color:red;">2021/09</span>：添加动画控制器和反向运动学（IK）解算器。

作者自己实现了动画和关键帧。IK 解算器很难，因为不知道这是如何在 MMD 中设置的。目前看来不稳定。

关于刚体关节设置。必须将约束值乘以/除以某个数值才能使关节运动。例如，位置弹簧为 10000，而旋转弹簧仅为 10 。

作者认为 TDA 大佬正试图通过 Bullet Physics 来稳定。一些关节值也丢失了，所以必须为 PhysX 设置一个合适的数值。

<span style="color:red;">2021/07</span>：添加刚体关节和基本骨骼控制器。

检查了 TDA 大佬模型刚体/关节数据，发现所有值都是正确的。但在最初的 MMD 程序中，它看起来并不稳定。也许是 Bullet Physics 的原因？

<span style="color:red;">2021/04</span>：增加了用于物理计算的刚体。

<span style="color:red;">2021/02</span>：增加了 VMD 读取功能。

<span style="color:red;">2021/01</span>：新增 NVIDIA PhysX 4.0。所有物理计算/模拟都将使用 PhysX 。

<span style="color:red;">2020/12</span>：增加了镜头和抗锯齿功能。抗锯齿是使用多采样抗锯齿（MSAA）。

<span style="color:red;">2020/11/29</span>：项目信息首次发布。

<span style="color:red;">2020/11</span>：DirectX 11 的支持被取消，因为它使得开发时间翻了一番，而 DirectX 12 具备了此项目需要的所有功能。所以继续使用DirectX 12。

<span style="color:red;">2020/08</span>：开始用 DirectX 11 和 DirectX 12 为 MMD2 制作框架。

<span style="color:red;">2019/11</span>：作者有了制作 MMD2 的想法。作者开始学习 DirectX 11 的 C++ 和图形编程。当时作者认为这个 MMD2 应同时支持 DirectX 11 和 DirectX 12。

# 其他信息
关于原来的 MMD 应用，作者不知道原来的 Higuchi 大佬会不会继续开发。他可能还会再发布原来 MMD 程序的更新。原来的 MMD 软件相关的信息大家可以自行上网查找。
