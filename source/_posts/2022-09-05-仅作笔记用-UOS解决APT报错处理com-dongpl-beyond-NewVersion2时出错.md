---
layout: post
title: "仅作笔记用：UOS 解决 APT 报错处理 com.dongpl.beyond (NewVersion2) 时出错"
date: 2022-09-05 17:30:00
categories: 
  - [Webapp]
excerpt: "留意到应用商店里面有一个这个文件对比工具 Beyond Compare，大家如果在安装过此应用之后在 APT 命令出现类似问题的时候可以参考本文章方法来解决。"
mathjax: true
permalink: /archivers/136
isrepublish: false
---

执行 ```apt search``` 以及 ```sudo apt install``` 时报错如下信息：
```bash
~$ sudo apt install lm_sensors
正在读取软件包列表... 有错误！
E: Problem parsing Provides line
E: 处理 com.dongpl.beyond (NewVersion2) 时出错
E: Problem with MergeList /var/lib/apt/lists/d.store.deepinos.org.cn_Packages
E: 无法解析或打开软件包的列表或是状态文件。
```

使用 ```sudo vi``` 打开 ```/var/lib/apt/lists/d.store.deepinos.org.cn_Packages```。使用斜杠搜索 ```com.dongpl.beyond```。找到了一段关于此包名的包。查看文字描述发现是一个文件对比工具的源出了问题。

将这一段删除（查看模式敲两下 D 然后可以删除当前行），```:wq``` 保存。再试试 ```apt search gedit```，问题解决。

留意到应用商店里面有一个这个文件对比工具 Beyond Compare，大家如果在安装过此应用之后在 APT 命令出现类似问题的时候可以参考本文章方法来解决。