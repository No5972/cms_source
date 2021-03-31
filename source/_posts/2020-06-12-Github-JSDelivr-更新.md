---
layout: post
title:  "GitHub JSDelivr 更新"
date:   2020-06-12 17:15:00
excerpt: "在github编辑好文件以后在最后一个编辑的文件提交之前选择“Create a new branch for this commit and start a pull request.”创建一个分支，输入一个分支名称。然后访问URL即可更新为“https://cdn.jsdelivr.net/gh/[你的github用户名]/[你的github仓库]@[你创建的分支]/[你的文件路径]”。"
categories: 
 - [Web-Building]
 - [Github]
permalink: /archivers/8
---

在github编辑好文件以后在最后一个编辑的文件提交之前选择“Create a new branch for this commit and start a pull request.”创建一个分支，输入一个分支名称。然后访问URL即可更新为“https://cdn.jsdelivr.net/gh/[你的github用户名]/[你的github仓库]@[你创建的分支]/[你的文件路径]”。

{% note warning %}
注意仓库至少有一个Release才能被JSDelivr爬取到。
{% endnote %}

为节省服务器资源，建议在更新之后删除旧版不需要的分支。在git bash进入到本地仓库的目录执行

```bash
git push origin --delete [旧版分支名称]
```
