---
layout: post
title:  "探讨在国内使用Flash Player的解决方案 - 一些找到的线索"
date:   2020-05-26 12:00:00
excerpt: "Flash即将在年底停止支持，但是国内依旧有很多平台在依赖Flash，究竟国内还有多少平台还在依赖Flash？目前在国内仍然有大量的而且是非用不可的业务必须依赖Flash Player。Flash确实是要在2020年底要停止支持了，但是这并不是说Flash要淘汰了你就可以不用了，也不是说你觉得这个网页需要依赖Flash你就不进这个网站了，有些时候你遇到某些非用不可的业务你还非用不可。例如各种网课平台、政务平台、以及这段时间出现的一些虚拟实验平台（特别是一些学校的内网的平台），这些你还说Flash淘汰了不要去，你敢不用试试？【手动狗头】（有的学生因为不能运行Flash导致网课旷课进而导致被学校退学）"
categories: [Moving Away from Flash]
permalink: /archivers/6
---

目前在国内仍然有大量的而且是非用不可的业务必须依赖Flash Player。Flash确实是要在2020年底要停止支持了，但是这并不是说Flash要淘汰了你就可以不用了，也不是说你觉得这个网页需要依赖Flash你就不进这个网站了，有些时候你遇到某些非用不可的业务你还非用不可。例如各种网课平台、政务平台、以及这段时间出现的一些虚拟实验平台（特别是一些学校的内网的平台），这些你还说Flash淘汰了不要去，你敢不用试试？【手动狗头】（有的学生因为不能运行Flash导致网课旷课进而导致被学校退学）

1. Edge浏览器集成：新的Edge浏览器已经集成了PPAPI的Flash Player，一些需要使用Flash Player的网站会出现点击加载Flash 的灰框，点击确认加载即可。有时候会报地区不相容，如果遇到这个情况应手动替换成那种不报地区不相容的pepflashplayer.dll（搜索关键字：替换插件解决Microsoft Edge浏览器Flash Player地区不兼容问题）。

2. 地区不相容的问题也可以通过hosts解决，将geo2.adobe.com，flash.cn，www.flash.cn，flash.2144.com，www.2144.cn，fpdownload2.macromedia.com，fpdownload.macromedia.com，macromedia.com这些域名都引到127.0.0.1，据说有效。

3. 现在版本的PPAPI插件同样含有窃取隐私的服务。但截至撰稿时还可以搜索到一些Flash Player PPAPI版本27的插件，这个经专业鉴定是没有捆绑弹窗广告和窃取隐私服务的（搜索关键字：flashplayerPPAPI_27.0.0.159），注意安装完成后要选择从不更新，否则他会自动更新到特供版。

4. 截至撰稿时国内目前仍然可以下载到睿派克技术论坛制作的Flash Player破解版。这个版本针对限制地区、弹窗广告和窃取隐私服务进行了破解（搜索关键字：Adobe Flash Player AX/NP/PP v32.0.0.223特别版）。

5. 用特殊手段直接下载到外国的Flash Player，保证下载页面的域名不是.cn的。操作比较复杂，但是不保证有效（可能装上去之后用也是报地区不相容，参考解决方案第二条）。

6. 目前的开源Flash解决方案普遍还不成熟，主要的两套方案LightSpark实测装上去之后FireFox并不能识别（Windows安装版），Gnash直接没有Windows的解决方案而且Linux里面也是一大堆依赖要装，安装过程甚至可以说是劝退级别。（搜索关键字：GNASH 移植）

7. 据说在Firefox浏览器中，点击Flash对象所在区域，由系统自动搜索可用的Flash插件，搜索到后，将弹出Flash插件安装窗口，在窗口中就会列出支持Firefox浏览器的Flash插件，包括 Adobe Flash Player、Swfdec player for Adobe/Macromedia flash、Gnash SWF Player等可供选择。（搜索关键字：在Ubuntu系统中玩转Flash视频播放）

8. 或者最简单的办法，但是可能比较占用比较多的系统资源。那就是用虚拟机安装一个XP系统然后直接在虚拟机里面装一个特供版Flash。随他去怎么弹广告盗隐私吧。^\_^ 反正只有专门需要用Flash的场合才会用到，平时我们也不会用这个虚拟机。
