---
layout: post
title: "仅做笔记用：Stable Diffusion 通过 ControlNet 扩展图片 / 扩图"
date: 2023-09-12 01:30:00
categories: 
  - [Python]
excerpt: 发觉之前的 Outpainting 脚本效果仍旧不是很理想。这里又找了一下有没有效果更好的途径来扩图。于是就找到了通过 ControlNet 的方式来实现效果更好的扩图。这里临时记录一下在 Stable Diffusion 怎么使用 ControlNet 来扩展图片。"
mathjax: true
permalink: /archivers/152
isrepublish: false
---

发觉之前的 Outpainting 脚本效果仍旧不是很理想。这里又找了一下有没有效果更好的途径来扩图。于是就找到了通过 ControlNet 的方式来实现效果更好的扩图。这里临时记录一下在 Stable Diffusion 怎么使用 ControlNet 来扩展图片。

下载 ```control_v11p_sd15_inpaint_fp16.safetentors```，放到 SD 目录的 ```\models\ControlNet``` 目录。

![](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/c3176a7e74734f46b777ca9883f3d8d1.png)

在 SD WebUI 里面在 ControlNet **勾选启用**。选择**局部重绘**，然后看一看预处理器是不是 ```inpaint_only```，模型是不是刚才下载的文件，如果不是就改一下。

下边三个滑块不用管。控制模式选择**优先 ControlNet**，画面缩放模式这里一般选择**缩放并填充**。

![](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/ca979174d2794e1ab1ff870139bf7ece.png)

然后在上面的作图尺寸里面根据想要的长宽比输入需要的尺寸（点击图片右下方最右边的按钮，可以直接将导入的图片的尺寸发送到上面的尺寸处）。当然，如果可能的话，请尽量在提示词里面写好背景方面的提示词。然后开始生成。

![](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/83e29154fc114c9bb3cf55e920da4a25.png)
![](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/b5701d8683ea44dcbe1f1357aa08b3ed.png)
![](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/d82917bd5ed7418e8cec72e972ce06c3.png)

可以将生成的图继续放到 ControlNet 的图像里面，然后重复步骤 4，继续扩展图片！

不同的采样方法效果差别有些大，可以尝试更换不同的采样方法来达到更好的效果。