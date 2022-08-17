---
layout: post
title: "UOS ARM 安装安卓手机软件 APK 软件包"
date: 2022-08-17 11:30:00
categories: 
  - [Webapp]
excerpt: "统信 UOS 系统现在做的真是越来越好用，个人也是非常的喜欢，在平时的工作中也经常使用 UOS 系统，万万使用的是鲲鹏 920 处理器的机器，ARM 架构，和大部分手机架构一样，所以按理来说是可以直接在 UOS 系统上运行手机软件的，此系统天生与手机的生态有着千丝万缕的联系。"
mathjax: true
permalink: /archivers/133
isrepublish: true
---

来源：

[![万万没想到-UOS安装安卓手机软件APK软件包](https://img.shields.io/badge/%E4%B8%87%E4%B8%87%E6%B2%A1%E6%83%B3%E5%88%B0-UOS%E5%AE%89%E8%A3%85%E5%AE%89%E5%8D%93%E6%89%8B%E6%9C%BA%E8%BD%AF%E4%BB%B6%20APK%E8%BD%AF%E4%BB%B6%E5%8C%85-brightgreen)](https://www.wanpeng.life/1604.html)

统信 UOS 系统现在做的真是越来越好用，个人也是非常的喜欢，在平时的工作中也经常使用 UOS 系统，万万使用的是鲲鹏 920 处理器的机器，ARM 架构，和大部分手机架构一样，所以按理来说是可以直接在 UOS 系统上运行手机软件的，此系统天生与手机的生态有着千丝万缕的联系。

{% note success %}
今天万万跟大家分享一下鲲鹏 920 架构的统信 UOS 上安装手机软件的方法。
{% endnote %}

其实我们的 UOS 系统上已经内置好了安卓软件的安装脚本。

# 如何安装

```bash
/usr/bin/android-appmgr.sh install +软件包名
```

{% note info %}
注：软件包可以去各大软件官网下载。
{% endnote %}

因为 UOS 商店中没有百度网盘，ARM 架构的鲲鹏 920 运行不了 wine 版，这里测试安装了百度网盘手机客户端，事先已在官网下载好软件包 ```BaiduNetdisk_11.9.2.apk``` 文件。

执行 ```/usr/bin/android-appmgr.sh install BaiduNetdisk_11.9.2.apk```

![](https://obs.wanpeng.life/wp-content/uploads/2021/05/ad.png)

<p style="align:center">安装成功</p>

{% note warning %}
如果没有此脚本，可以在应用商店中安装一个安卓软件（应用名字通常带有“（Android）”后缀），这样会自动安装 kbox，就会生成这个脚本，或者执行命令 ```apt -y install kbox```
{% endnote %}

安装成功后可在 ```/home/Kbox/desktop``` 目录下看到已安装软件的启动图标，双击即可启动。

![](https://obs.wanpeng.life/wp-content/uploads/2021/05/rj.png)

实测像开心消消乐、百度网盘、抖音、QQ等都可以安装并正常使用。

但是像王者荣耀这种大型游戏会因显示问题无法运行。