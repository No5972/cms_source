---
layout: post
title: "仅做笔记用：Stable Diffusion 扩展图片 / 扩图"
date: 2023-06-05 22:30:00
categories: 
  - [Python]
excerpt: "现有的解决方案，包括 Bing 搜出来的，基本上都是要收费的，这些解决方案大多基于 DALL-E。某度也很难搜出来一个图文的介绍。那么就应该研究一下开源的 Stable Diffusion 能不能也实现类似的扩图功能。这里临时记录一下在 Stable Diffusion 怎么操作可以扩展图片。"
mathjax: true
permalink: /archivers/147
isrepublish: false
---

现有的解决方案，包括 Bing 搜出来的，基本上都是要收费的，这些解决方案大多基于 DALL-E。某度也很难搜出来一个图文的介绍。那么就应该研究一下开源的 Stable Diffusion 能不能也实现类似的扩图功能。这里临时记录一下在 Stable Diffusion 怎么操作可以扩展图片。

这里用的还是秋叶的 v3 整合包。启动 Stable Diffusion 之后，打开图生图，下面就默认的图生图，将一张要扩展的图片拖进来。拉到最下面，脚本选择“ **向外绘制第 X 版** ”。这时候会出现选项，选择向哪个方向扩充。以及输入扩充多少像素。

和 DALL-E 方式一样，这个扩展同样需要输入提示才能保证正确扩展。在最上面的那两个大输入框输入正向提示和负面提示。然后点击生成。这样就完成了图片的扩展。可以根据需要修改附近的参数来获得更好的效果。

![](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/89f556ef29564c159b675ac5642328c3.png)