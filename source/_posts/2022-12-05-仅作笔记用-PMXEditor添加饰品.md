---
layout: post
title: "仅作笔记用：PMXEditor 添加饰品"
date: 2022-12-05 20:00:00
categories: 
  - [Webapp]
excerpt: "看到现有的绑骨教程往往是晦涩难懂的，的确 PMXEditor 里面添加饰品没有 MMD 那么简单。这里从 LearnMMD 站点上找了一个相对比较简单的教程，这里稍微复述一遍。"
mathjax: true
permalink: /archivers/141
isrepublish: false
---

看到现有的绑骨教程往往是晦涩难懂的，的确 PMXEditor 里面添加饰品没有 MMD 那么简单。[这里从 LearnMMD 站点上找了一个相对比较简单的教程](https://learnmmd.com/http:/learnmmd.com/attach-an-item-or-accessory-to-a-bone-in-pmdeditor-weighting-in-mmd/)，这里稍微复述一遍。

首先在 PMXEditor 打开角色模型。然后点击 File - Import，找到并选中 ```.x``` 格式的饰品文件。然后选择“Add”在现有已加载模型的基础上追加导入。右边的选项暂时不管。

![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/968991f0c2ef4ac68d97992fc8cb070b.png)

这样导入以后，首先调整一下饰品的位置。在模型预览窗口点击右上方的“M”，把饰品以外的所有材质先取消勾选，让其他材质不显示。只剩下饰品之后，框选住所有的顶点。然后再全部勾选。这样就只选中了饰品，然后通过拖动句柄来调整饰品的位置，对齐要对准的部位。

![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/0d7ee194c9a043679192d1cebff8c483.png)

![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/b0fb959e95d34576b0b4f04d03121a0b.png)

然后还是取消勾选饰品以外的所有材质。还是框选住饰品的所有顶点。

然后在主窗口选择“Bone”选项卡。然后在左侧选择要对齐的部位（如果看不懂的话可以在“M”窗口把其他的材质显示，然后在主窗口依次选择部位，选中的部位将在模型预览窗口将对应顶点变成蓝色）。右边的选项不需要动。

然后在模型预览窗口点击右上方的“W”，点击 Start，这时会看到饰品出现了黑色的顶点。通过鼠标拖曳的方式将所有这些黑色的点涂成红色。注意不要拖的太快，太快的话有些少数的点可能没有标红。

![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/17e054daa4924a52bd17928df6b59d7d.png)

![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/0f6ea49059d541bc96f62fab576ea3bb.png)

全部标红之后再点击 Start，这时候红色的点应该消失了。好了，现在点击右上方的 T 按钮，试着旋转相关的关节看看饰品会不会跟着动！

![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/303addee59b84787a1d68687cf5b6848.png)

![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/5ffe2a33a5c245938de2e4d19ef2f95e.png)

本篇使用素材“Angel Wings”来自 [VRoid Hub](https://hub.vroid.com/en/characters/555104576816800556/models/6086027198880580229)，素材作者：[Lucy Aldra](https://hub.vroid.com/en/users/62909993)
