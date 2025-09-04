---
layout: post
title: "仅做笔记用：Stable Diffusion 获取历史生成图片的 prompt"
date: 2023-06-20 16:30:00
categories: 
  - [AIGC]
excerpt: "不知怎么搞的，图库浏览器点开图片看不到生成图片的信息了。但是据信这些信息是写在 PNG 数据的某个附加区段的（参考博客文章《Python - PNG图掺入隐藏文本信息》）。Stable Diffusion 原生支持读取这些信息。并且除了图库浏览器，还有一个地方可以读取。"
mathjax: true
permalink: /archivers/148
isrepublish: false
---

不知怎么搞的，图库浏览器点开图片看不到生成图片的信息了。但是据信这些信息是写在 PNG 数据的某个附加区段的（参考博客文章[《Python - PNG图掺入隐藏文本信息》](https://www.aiuai.cn/aifarm1516.html)）。Stable Diffusion 原生支持读取这些信息。并且除了图库浏览器，还有一个地方可以读取。

从资源管理器里面 SD 目录的 ```outputs/txt2img-images``` 里面找到要读取信息的图片。在 SD WebUI 中切换到“图片信息”选项卡，然后将图片拖进来，即可在右侧看到图片生成时输入的 prompt，以及 negative prompt、CFG、步数、模型信息、种子值、分辨率等。（参考博客文章[《Stable-Diffusion：图片信息（PNG Info）功能介绍》](https://huke88.com/article/8116.html)）

![](https://images.weserv.nl/?url=https://pic.huke88.com/article/content/image/2023-06-01/6854BFD9-BC5E-1801-D85E-CD9A93C77982.png)