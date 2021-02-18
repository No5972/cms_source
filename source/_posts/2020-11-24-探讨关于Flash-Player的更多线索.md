---
layout: post
title: "探讨更多关于Flash Player的线索（21.02.18更新）"
date: 2020-11-24 16:45:00
categories: Moving-Away-from-Flash
excerpt: "Flash即将在2020年底停止支持。如果仍然有一些业内业务需要Flash我們应该如何应对，这里找到了更多的线索。"
permalink: /archivers/48
top: 100
---

Flash即将在2020年底停止支持。如果仍然有一些业内业务需要Flash我們应该如何应对，这里找到了更多的线索。
1. 21.02.18更新：微软已经正式推送移除Flash的系统更新KB4577586。此更新将在Win10 2004、20H2版本自动更新，并且无法还原，除非重装系统。此次移除Flash仅针对系统自带的AX版Flash，一些浏览器和应用软件内置的PPAPI、NPAPI 的Flash组件不受此更新影响。
    * 若有需要恢复AX版Flash的情况，请参考[《根据之前文章整理的在2021年继续使用Flash Player的方法【重新整理】》](68.html)的第三条下载安装“Flash恢复包”，此恢复包针对此系统更新进行恢复，但是**仅适用于安装了此更新的机器，未安装此更新的机器不要安装，否则会出现无法恢复的异常情况** 。
2. 21.01.28更新：网传已有Edge的绿色版出现，经测试，版本小于88的Edge绿色版也可以通过手动导入Flash的方式来使用Flash。
3. 21.01.24更新：截至1月24日零时，仍然需要Flash的电子税务平台有：
    * 内蒙古（网站提供了一个[版本15的Flash下载](https://etax.neimenggu.chinatax.gov.cn/wsbs/download/flashplayer.zip)）
    * 河北（可以使用[手机APP](http://hebei.chinatax.gov.cn/hbsw/nsfw/xzzx/rjxz/202002/t20200229_2568755.html)来替代办理）
    * 辽宁（网站提供了一个[版本15的Flash下载](https://etax.liaoning.chinatax.gov.cn/wsbs/download/flashplayer.zip)；可以使用[手机APP](http://liaoning.chinatax.gov.cn/art/2020/8/31/art_1077_48698.html)来替代办理）
    * 吉林（网站提供了一个[版本15的Flash下载](https://etax.jilin.chinatax.gov.cn:10812/wsbs/download/flashplayer.zip)；可以使用[手机APP](http://jilin.chinatax.gov.cn/art/2020/12/24/art_3292_321739.html)来替代办理）
    * 甘肃（可以使用[手机APP](https://etax.gansu.chinatax.gov.cn/bszm-web/apps/images/indexBefore/icon-ios-qrCode.png)来替代办理）
    * 宁夏（网站提供了一个[版本15的Flash下载](https://etax.ningxia.chinatax.gov.cn/wsbs/download/flashplayer.zip)；可以使用[手机APP](https://etax.ningxia.chinatax.gov.cn/download.sword?ctrl=TzggExtCtrl_getImageByRefcode&refCode=1611197962925&uuid=be78ad4b1e0544bc92f9382d7e45df73&v=1611198054068)来替代办理）
    * 西藏（网站提供了一个[版本15的Flash下载](https://etax.xizang.chinatax.gov.cn:8443/wsbs/download/flashplayer.zip)；可以使用[桌面客户端](https://xizang.chinatax.gov.cn/col/col5360/index.html?uid=13090&pageNum=1)来替代办理）
    * 江苏（网站提供了一个[Flash下载](https://etax.jiangsu.chinatax.gov.cn/r/cms/software/flashplayerpp_install_cn.rar)，但是版本未知；可以使用[手机APP和桌面客户端](https://jiangsu.chinatax.gov.cn/col/col15956/index.html?uid=31591&pageNum=1)来替代办理）
    * 重庆市（可以使用[手机APP](http://chongqing.chinatax.gov.cn/cqtax/nsfw/xzzx/rjxz/202012/t20201202_319631.html)来替代办理）
    * 湖南（21.01.25更新：已经可以使用[手机APP](http://hunan.chinatax.gov.cn/show/20210125360695)来替代办理）
    * 宁波市（可以使用[手机APP](http://ningbo.chinatax.gov.cn/art/2018/11/18/art_1911_3409.html)来替代办理）
    * 深圳市（可以使用[手机APP](https://shenzhen.chinatax.gov.cn/sztax/nsfw/xzzx/rjxz/common_list.shtml)来替代办理）
4. 21.01.22更新：Edge今天已经更新了88版本。Flash已经无法使用。请大家下载绿色版Chrome来继续使用Flash。有不少绿色版Chrome内置旧版Flash Player。
5. 21.01.20更新：Chrome今天已经正式更新了88版本，Flash已经无法再继续使用。Chrome的网上应用店出现了一款可以使用H5替代方案播放Flash内容的扩展[《FlashPlayer - SWF to HTML》](https://chrome.google.com/webstore/detail/flashplayer-swf-to-html/nodnmpgjlnclahkmgjiinfjklgbbgecg/)。此扩展会检测当前网页有无Flash对象，若有，则可以点击工具栏上的该扩展图标，即可以H5形式来播放Flash内容。
	* 该扩展整合了当前两种常用的开源替代方案来播放Flash内容。[Ruffle](https://ruffle.rs/)和[SWF2JS](https://swf2js.com/)。使用过程中可通过右击工具栏上该扩展图标来切换渲染方式。
	* 由于Ruffle目前尚未支持Action Script 3.0，所以使用AS3的Flash内容可能无法正常运作。
	* SWF2JS的免费版尚未提供对AS3的支持；收费版则支持了90%的AS3，并且也提供了Stage3D、Socket、FLV、MP4的支持。
6. 21.01.19更新：淘米已经更新了[新的小花仙微端](http://dl.61.com/hua/WeHua.msi)。经过实测已经可以在移除了Flash 的机器使用。
   * 但此微端体积较大，安装后占用约250MB磁盘空间。
   * 此微端使用Electron开发，目前暂时还没有实现画面缩放和截图功能。
   * 集成的也是版本27的Flash，为PPAPI版本，无弹窗广告和隐私服务。
7. 21.01.18更新：淘米已经更新了[新的赛尔号微端](http://dl.61.com/seer/Seer.msi)，经过实测已经可以在移除了Flash的机器使用。微端集成的是版本27的Flash，无弹窗广告和隐私服务。
    * 大致看了一下文件结构，技术细节应该是走的内嵌Mozilla浏览器（也就是```GeckoWebBrowser```）加载NPAPI Flash。博客园那边也有不少相关文章讨论这方面内容。[.net winform程序下使用firefox作为Web浏览器](https://www.cnblogs.com/chengzi/p/4497692.html)、[C#使用Gecko实现浏览器](https://www.cnblogs.com/deali/p/6426593.html) 
8. 21.01.18更新：[西西软件园已将吾爱破解论坛上的Flash破解补丁整合打包](https://www.cr173.com/soft/1311482.html)，有出现Flash无法使用的用户可以尝试使用，[注意一定要先看说明。](https://www.52pojie.cn/thread-1350285-1-1.html)
    * 此补丁中的Flash恢复包的OCX控件是32.0.0.445版本的，并且已经修改掉了自毁的定时器（也是通过最后的```42```字节改成```72```），注意此恢复包仅适用于安装了KB4577586“移除Flash的系统更新”的机器，未安装此更新的机器不要安装，否则会出现无法恢复的异常情况。
9. 21.01.13更新：百分浏览器论坛官方[推荐使用32.0.0.371版本](https://www.centbrowser.net/zh-cn/forum.php?mod=viewthread&tid=6719&extra=page%3D1)。猜测此版本也没有自毁。论坛超版回应：[看到有大佬实测最后一个能用的国际版版本是 32.0.0.371](https://www.centbrowser.net/zh-cn/forum.php?mod=redirect&goto=findpost&ptid=8423&pid=49387)。
10. 21.01.12更新：Flash 32.0.0.303没有自毁，仍然可以使用。
11. 21.01.12更新：今天开始已经无法在版本32以及以上的Flash Player中加载Flash内容。请大家使用国产浏览器来解决Flash停止支持的情况。
12. 21.01.08更新：淘米页游再次更新了浏览器不支持Flash时的提示信息。左上方出现了“安装Flash插件”的“点击下载”的按钮。此链接指向的是所谓的“特供版Flash”，此版本Flash本方从未承认过，请大家不要从该按钮指向的页面下载任何工具。我們呼吁淘米不要推荐所谓的“特供版Flash”。
13. 21.01.01更新：搜狗浏览器技术支持工程师回应：[搜狗浏览器会一直支持flash插件的](http://ie.sogou.com/bbs/forum.php?mod=redirect&goto=findpost&ptid=2747473&pid=8433589)。
14. 21.01.01更新：4399推荐使用360安全浏览器来游玩小游戏。4399已在1月1日更新了所有小游戏游玩页面，如果浏览器不支持Flash则显示“当前浏览器无法运行Flash。继续游戏，可使用以下第三方浏览器：360浏览器极速模式”，4399页面上的下载链接指向的是4399提供的360安全浏览器10。
	* 未经过测试，但是在云电脑上测试了360官方提供的360安全浏览器12，安装界面和安装过程无捆绑，但是在安装之后使用期间会有弹窗推送建议安装360安全卫士，这一点需注意。
	* 此外7k7k也更新了小游戏游玩页面，7k7k推荐使用360浏览器和搜狗浏览器，链接指向的分别是360安全浏览器的官网和搜狗浏览器的官网。

15. 21.01.01更新：淘米旗下所有Flash页游（包括赛尔号、摩尔庄园、小花仙等）更新了如果浏览器不支持Flash时的提示信息。淘米推荐使用猎豹浏览器、360安全浏览器、360极速浏览器、搜狗浏览器，此外还针对Mac系统推荐360极速浏览器。所有这些浏览器的链接指向的都是淘米提供的浏览器安装包。
16. 20.12.29更新：ZDNet消息：但是，跳过此最新的Flash更新不会删除此“定时炸弹”在以前的版本中，几个月前已添加了killswitch代码，而此最后的Flash更新仅修改了提示用户使用该应用程序的提示中使用的语言。
17. 20.12.29更新：Adobe那边又有动静，说1月12日开始将阻止Flash内容在Flash Player中加载，如果属实，之前的从Edge导入的Flash组件文件也将无法使用Flash，这种情况得换版本29的Flash（网上很难下载到）。对此的对策还在研究中！
18. 20.11.12更新：360极速浏览器产品答疑师“fly颖”回应：[360浏览器会继续支持Flash的](https://bbs.360.cn/forum.php?mod=viewthread&tid=15933600&page=1#pid118058892)。
19. 从[Chromium官方的消息](https://blog.csdn.net/qq_35977139/article/details/109255750)来看，预计将于2021年1月更新的88版本的内核将原生不支持Flash。即使国内继续支持也将无法在88版本以上内核的浏览器使用（这其中包括Win10 20H2开始自带的新版Edge浏览器）。
20. Edge 88的Beta版预计将于12月7日上线，[微软官方明确此版本开始不再包含Flash](https://dy.163.com/article/FP68QH4Q0511MVC3.html)。而稳定版将于1月21日上线。而[88版本开始Chromium将原生不支持Flash](https://blog.csdn.net/qq_35977139/article/details/109255750#t10)，这意味着无论如何魔改也不会让使用这种内核的浏览器再去支持Flash。（已在版本89的Chromium中实测，将Edge的PepperFlash文件夹手动拷贝到Chromium的User Data文件夹下，运行Chromium时Chromium会自动删除PepperFlash文件夹。Chromium浏览器加载Flash会显示Adobe Flash Player已不再受支持，如图所示）（当然，这里的魔改是建立在不动源代码的前提下。因为Chromium本身是开源的，如果能魔改源代码使其能支持Flash也不是不可以）
![在这里插入图片描述](https://img-blog.csdnimg.cn/20201124155808679.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM1OTc3MTM5,size_16,color_FFFFFF,t_70#pic_center)
21. 据外媒报道，Chrome 88版本将于1月19日正式发布。
22. 目前一些浏览器诸如百分浏览器、星愿浏览器均因某些不可描述的原因移除了集成的Flash。需要手动拷贝文件并从hosts屏蔽一些域名。
23. 从已经掌握的各个CVE漏洞（未修复的和已修复的）复现步骤来看，大部分Flash漏洞引起的黑客攻击是因为调用了恶意的SWF或者FLV文件，包含但不限于打开了内嵌恶意Flash的Office文档，以及打开了内嵌恶意Flash URL的网址页面。
24. 谷歌的Chromium内核的浏览器默认使用PPAPI的Flash，这种Flash运行在Chromium的一个沙箱之中，有效减少Flash利用漏洞的黑客攻击。但有些国产浏览器考虑到PPAPI Flash占用运行内存比较大，刻意将其替换为较不安全的NPAPI Flash。

