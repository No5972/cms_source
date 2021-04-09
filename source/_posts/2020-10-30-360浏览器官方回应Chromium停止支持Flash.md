---
layout: post
title: "360浏览器官方回应Chromium停止支持Flash"
date: 2020-10-30 08:30:00
categories: [Moving Away from Flash]
excerpt: "鉴于Chrome和Chromium即将在年底停止对Flash的支持，有不少用户关心使用Chromium内核的国产浏览器是否也会相应地移除Flash的支持。对此360安全浏览器官方版主“Spirit_悔灭”做出回应。"
permalink: /archivers/43
isrepublish: true
---

来源：[![360安全浏览器官方论坛-Spirit_悔灭](https://img.shields.io/badge/360安全浏览器官方论坛-Spirit_悔灭-brightgreen)](https://bbs.360.cn/forum-141-1.html)

**11月12日更新：360极速浏览器产品答疑师“fly颖”回应：[“360浏览器会继续支持Flash的”](https://bbs.360.cn/forum.php?mod=viewthread&tid=15933600&page=1#pid118058892)**

鉴于Chrome和Chromium即将在年底停止对Flash的支持，有不少用户关心使用Chromium内核的国产浏览器是否也会相应地移除Flash的支持。对此360安全浏览器官方版主“Spirit_悔灭”做出回应。
> 安全浏览器会根据Flash插件的安全性和需求量评估是否保留内置的Flash插件。另外国外是禁止了内容通过Flash插件加载才会有很长一段时间（2017年发布2020年停止支持）的预先警告，既使安全浏览器不再内置Flash插件，国内仍有其他方式提供Flash插件支持的方法，所以您描述的缓冲期应该询问Flash插件官方客服“什么时候会停止支持插件维护”。安全浏览器只是一种提供支持的客户端，如果不再内置Flash插件会在版本发布时进行公告，您可以留意论坛消息。旧版本不再更新维护，不会变化。

360方面还在评估Flash的**安全性和需求量**，据此猜测，在最终讨论结果确认下来之前，360浏览器仍然将继续提供对Flash的支持。
此外，版主也提到兼容模式可以继续调用ActiveX版的Flash（可能需要国产版Flash）。
> 安全浏览器兼容模式调用系统IE浏览器内核，与IE浏览器表现一致。您可以到Flash插件官网手动安装flash插件。 

此外，版主还提供了针对360浏览器使用Flash的解决方案。
>最近论坛上大家经常反馈视频网站或者网页游戏提示Flash未启用、经常提示Shockwave Flash崩溃。然后就会百度寻找各种Flash插件问题的解决方法，无一例外的都会写到重新安装Flash,但这是一个通用的方法。*下面就说明一下Flash插件在安全浏览器的具体情况以及解决办法*。
> * 先说下Flash插件现况。由于Flash插件经常被发现漏洞引发安全问题，Adobe公司发公告2020年会停止提供Flash插件更新和运行，微软公司也公告2020年12月前会逐步删除自带浏览器的Flash插件。 谷歌浏览器默认阻止Flash插件运行。
> 
>安全浏览器新安装的时候是不会内置Flash。访问有需要Flash插件网页的时候，浏览器会自动下载解压我们预置的Flash插件，路径是```%appdata%\360se6\Application\components\npflash```和```%appdata%\360se6\Application\components\ppflash```。
>所以使用安全浏览器，您不需要单独的去安装flash插件，**当提示您Flash版本低或安装Flash版本时，您只要重新启动浏览器就可以正常浏览网页了。** 如果您不单独安装，不管您安装在什么位置，chrome://plugins插件管理页面中Flash插件是不会出现多个版本的。
>需要注意：我们预置的Flash插件只是极速模式下使用的，兼容模式下我们会调用IE浏览器自带的Flash插件
启用IE浏览器Flash插件的办法：
>1. 您可以使用快捷键Win+R运行```inetcpl.cpl```打开Internet属性
>2. 选择程序选项卡中的管理加载项
>3. 在弹出的窗口中找到Flash启用即可
>* 您已经手动安装了Flash并且经常提示Shockwave Flash崩溃。麻烦您按照以下方法操作，看看是否还会出现。
>1. 如果能够从其他地方获得谷歌浏览器使用的Flash插件，可以直接在```%appdata%\360se6\Application\components```路径下```ppflash```和```npflash```文件夹替换已有文件
>2. 直接删除```%appdata%\360se6\Application\components```路径下```ppflash```和```npflash```文件夹
>3. 如果前两种方法都不能正常，打开浏览器在地址栏输入```chrome://plugins```点击详细信息,停用您安装的版本，只留一个Shockwave Flash 29.0 PPAPI。