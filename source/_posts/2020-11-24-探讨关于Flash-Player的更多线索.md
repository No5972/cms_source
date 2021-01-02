---
layout: post
title: "探讨更多关于Flash Player的线索（21.01.01更新）"
date: 2020-11-24 16:45:00
categories: Moving-Away-from-Flash
excerpt: "Flash即将在2020年底停止支持。如果仍然有一些业内业务需要Flash我們应该如何应对，这里找到了更多的线索。"
permalink: /archivers/48
top: 100
---

Flash即将在2020年底停止支持。如果仍然有一些业内业务需要Flash我們应该如何应对，这里找到了更多的线索。
1. 21.01.01更新：搜狗浏览器技术支持工程师回应：[搜狗浏览器会一直支持flash插件的](http://ie.sogou.com/bbs/forum.php?mod=redirect&goto=findpost&ptid=2747473&pid=8433589)。
2. 21.01.01更新：4399推荐使用360安全浏览器来游玩小游戏。4399已在1月1日更新了所有小游戏游玩页面，如果浏览器不支持Flash则显示“当前浏览器无法运行Flash。继续游戏，可使用以下第三方浏览器：360浏览器极速模式”，4399页面上的下载链接指向的是4399提供的360安全浏览器10。
	* 未经过测试，但是在云电脑上测试了360官方提供的360安全浏览器12，安装界面和安装过程无捆绑，但是在安装之后使用期间会有弹窗推送建议安装360安全卫士，这一点需注意。
	* 此外7k7k也更新了小游戏游玩页面，7k7k推荐使用360浏览器和搜狗浏览器，链接指向的分别是360安全浏览器的官网和搜狗浏览器的官网。

3. 21.01.01更新：淘米旗下所有Flash页游（包括赛尔号、摩尔庄园、小花仙等）更新了如果浏览器不支持Flash时的提示信息。淘米推荐使用猎豹浏览器、360安全浏览器、360极速浏览器、搜狗浏览器，此外还针对Mac系统推荐360极速浏览器。所有这些浏览器的链接指向的都是淘米提供的浏览器安装包。
4. 20.12.29更新：ZDNet消息：但是，跳过此最新的Flash更新不会删除此“定时炸弹”在以前的版本中，几个月前已添加了killswitch代码，而此最后的Flash更新仅修改了提示用户使用该应用程序的提示中使用的语言。
5. 20.12.29更新：Adobe那边又有动静，说1月12日开始将阻止Flash内容在Flash Player中加载，如果属实，之前的从Edge导入的Flash组件文件也将无法使用Flash，这种情况得换版本29的Flash（网上很难下载到）。对此的对策还在研究中！
6. 20.11.12更新：360极速浏览器产品答疑师“fly颖”回应：[360浏览器会继续支持Flash的](https://bbs.360.cn/forum.php?mod=viewthread&tid=15933600&page=1#pid118058892)。
7. 从[Chromium官方的消息](https://blog.csdn.net/qq_35977139/article/details/109255750)来看，预计将于2021年1月更新的88版本的内核将原生不支持Flash。即使国内继续支持也将无法在88版本以上内核的浏览器使用（这其中包括Win10 20H2开始自带的新版Edge浏览器）。
8. Edge 88的Beta版预计将于12月7日上线，[微软官方明确此版本开始不再包含Flash](https://dy.163.com/article/FP68QH4Q0511MVC3.html)。而稳定版将于1月21日上线。而[88版本开始Chromium将原生不支持Flash](https://blog.csdn.net/qq_35977139/article/details/109255750#t10)，这意味着无论如何魔改也不会让使用这种内核的浏览器再去支持Flash。（已在版本89的Chromium中实测，将Edge的PepperFlash文件夹手动拷贝到Chromium的User Data文件夹下，运行Chromium时Chromium会自动删除PepperFlash文件夹。Chromium浏览器加载Flash会显示Adobe Flash Player已不再受支持，如图所示）（当然，这里的魔改是建立在不动源代码的前提下。因为Chromium本身是开源的，如果能魔改源代码使其能支持Flash也不是不可以）
![在这里插入图片描述](https://img-blog.csdnimg.cn/20201124155808679.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM1OTc3MTM5,size_16,color_FFFFFF,t_70#pic_center)
9. 据外媒报道，Chrome 88版本将于1月19日正式发布。
10. 目前一些浏览器诸如百分浏览器、星愿浏览器均因某些不可描述的原因移除了集成的Flash。需要手动拷贝文件并从hosts屏蔽一些域名。
11. 从已经掌握的各个CVE漏洞（未修复的和已修复的）复现步骤来看，大部分Flash漏洞引起的黑客攻击是因为调用了恶意的SWF或者FLV文件，包含但不限于打开了内嵌恶意Flash的Office文档，以及打开了内嵌恶意Flash URL的网址页面。
12. 谷歌的Chromium内核的浏览器默认使用PPAPI的Flash，这种Flash运行在Chromium的一个沙箱之中，有效减少Flash利用漏洞的黑客攻击。但有些国产浏览器考虑到PPAPI Flash占用运行内存比较大，刻意将其替换为较不安全的NPAPI Flash。

