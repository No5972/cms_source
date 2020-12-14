---
layout: post
title: "探讨更多关于Flash Player的线索"
date: 2020-11-24 16:45:00
categories: Moving-Away-from-Flash
excerpt: "Flash即将在2020年底停止支持。如果仍然有一些业内业务需要Flash我們应该如何应对，这里找到了更多的线索。"
permalink: /archivers/48
---

Flash即将在2020年底停止支持。如果仍然有一些业内业务需要Flash我們应该如何应对，这里找到了更多的线索。
1. 从[Chromium官方的消息](41.html)来看，预计将于2021年1月更新的88版本的内核将原生不支持Flash。即使国内继续支持也将无法在88版本以上内核的浏览器使用（这其中包括Win10 20H2开始自带的新版Edge浏览器）。
2. Edge 88的Beta版预计将于12月7日上线，[微软官方明确此版本开始不再包含Flash](https://dy.163.com/article/FP68QH4Q0511MVC3.html)。而稳定版将于1月21日上线。而[88版本开始Chromium将原生不支持Flash](41.html#Flash-Support-Removed-from-Chromium-Target-Chrome-88-Jan-2021-从Chromium移除对Flash的支持-2021-1，版本88及以上)，这意味着无论如何魔改也不会让使用这种内核的浏览器再去支持Flash。
 - 已在版本89的Chromium中实测，将Edge的PepperFlash文件夹手动拷贝到Chromium的User Data文件夹下，运行Chromium时Chromium会自动删除PepperFlash文件夹。Chromium浏览器加载Flash会显示Adobe Flash Player已不再受支持，如图所示。
 - 当然，这里的魔改是建立在不动源代码的前提下。因为Chromium本身是开源的，如果能魔改[源代码](https://github.com/chromium/chromium)使其能支持Flash也不是不可以。 
![在这里插入图片描述](https://img-blog.csdnimg.cn/20201124155808679.png)
3. 目前一些浏览器诸如百分浏览器、星愿浏览器均因某些不可描述的原因移除了集成的Flash。需要手动拷贝文件并从hosts屏蔽一些域名。
4. 从已经掌握的各个CVE漏洞（未修复的和已修复的）复现步骤来看，大部分Flash漏洞引起的黑客攻击是因为调用了恶意的SWF或者FLV文件，包含但不限于打开了内嵌恶意Flash的Office文档，以及打开了内嵌恶意Flash URL的网址页面。
5. 谷歌的Chromium内核的浏览器默认使用PPAPI的Flash，这种Flash运行在Chromium的一个沙箱之中，有效减少Flash利用漏洞的黑客攻击。但有些国产浏览器考虑到PPAPI Flash占用运行内存比较大，刻意将其替换为较不安全的NPAPI Flash。