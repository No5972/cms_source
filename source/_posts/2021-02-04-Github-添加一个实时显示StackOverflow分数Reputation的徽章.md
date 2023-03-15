---
layout: post
title: "Github 添加一个实时显示StackOverflow分数Reputation的徽章"
date: 2021-02-04 16:30:00
categories: Github
excerpt: "我們采用XPath强行解析StackOverflow用户主页的HTML节点来获取用户的Reputation数字。"
mathjax: true
permalink: /archivers/69
---

21.07.12更新：有一个class改了，原来的XPath已经不能直接用了。把```grid--cell```改成```flex--item```就可以了。

---

我們采用XPath强行解析StackOverflow用户主页的HTML节点来获取用户的Reputation数字。
Shields.io提供了后端XPath解析网络上XML内容并输出到徽章的接口：
```
https://img.shields.io/badge/dynamic/xml?url=<URL>&label=<LABEL>&query=<//data/subdata>&color=<COLOR>&prefix=<PREFIX>&suffix=<SUFFIX>
```
经过反复调试，最终找出了获取StackOverflow用户的分数Reputation的XPath：```/html/body//div[@class='grid--cell fs-title fc-dark']```。将这个XPath拼接到Shields.io的URL里面，就可以获取指定用户的分数了。

这段URL可以根据需要使用指定的样式来显示需要的内容。
```
https://img.shields.io/badge/dynamic/xml?label=StackOverflow%20%28Inactive%29&query=%2Fhtml%2Fbody%2F%2Fdiv%5B%40class%3D%27grid--cell%20fs-title%20fc-dark%27%5D&url=改成StackOverflow用户主页的网址注意转义一次&longCache=true&style=选择显示的样式&suffix=改成数字后面需要显示的后缀&logo=stackoverflow&labelColor=改成左侧背景的颜色&logoColor=改成LOGO图案的颜色&color=改成右侧背景的颜色
```
可以选择的样式有：```plastic```, ```flat```, ```flat-square```, ```for-the-badge```, ```social```。

用MarkDown表示出来就是
```markdown
[![](https://img.shields.io/badge/dynamic/xml?label=StackOverflow%20%28Inactive%29&query=%2Fhtml%2Fbody%2F%2Fdiv%5B%40class%3D%27grid--cell%20fs-title%20fc-dark%27%5D&url=改成StackOverflow用户主页的网址注意转义一次&longCache=true&style=选择显示的样式&suffix=改成数字后面需要显示的后缀&logo=stackoverflow&labelColor=改成左侧背景的颜色&logoColor=改成LOGO图案的颜色&color=改成右侧背景的颜色)](要链接的StackOverflow用户主页的地址)
```

例如，本示例的写法是
```markdown
[![](https://img.shields.io/badge/dynamic/xml?label=StackOverflow%20%28Inactive%29&query=%2Fhtml%2Fbody%2F%2Fdiv%5B%40class%3D%27grid--cell%20fs-title%20fc-dark%27%5D&url=https%3A%2F%2Fstackoverflow.com%2Fusers%2F14547429%2Fno-5972&longCache=true&style=flat-square&suffix=%20Reputations&logo=stackoverflow&labelColor=f48024&logoColor=white&color=F7A05B)](https://stackoverflow.com/users/14547429/no-5972)
```

写到Github Profile的效果如图所示。
![在这里插入图片描述](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/20210204162052911.jpeg)


类似的，其他不能使用JSON方式获取数字的平台也可以通过这种XPath的方式来读取用户或项目主页的DOM节点来获取需要显示的动态内容。这里就不再赘述了。