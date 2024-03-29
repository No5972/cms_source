---
layout: post
title: "平板KNoteX Pro 安装Windows 11 记录"
date: 2021-07-08 00:00:00
categories: 
  - [Webapp]
excerpt: "酷比魔方的平板，型号是KNoteX Pro，CPU是N4120。最近新出了Windows 11系统，鄙人把平时上班用的电脑维护U盘偷偷拿回来试一试安装🤣，前几天已经拷进去了22000.51版本预览版的Windows 11系统ISO镜像，更早时候也已经制成了Ventoy启动盘。"
mathjax: true
permalink: /archivers/96
---

酷比魔方的平板，型号是KNoteX Pro，CPU是N4120。最近新出了Windows 11系统，鄙人把平时上班用的电脑维护U盘偷偷拿回来试一试安装🤣，前几天已经拷进去了22000.51版本预览版的Windows 11系统ISO镜像，更早时候也已经制成了Ventoy启动盘。

直接把U盘插在平板的USB接口，接上磁吸键盘。

寨板一般都是开机时不停的击键Del进入BIOS设置，指定启动设备的启动菜单也在BIOS设置里面。切换到Save & Exit选项卡，最下边的列表就是选择启动设备的启动菜单。选择UEFI模式的U盘。熟悉的Ventoy菜单赫然显示在平板上！

直接整个双系统吧，万一翻车了还能复原，不好用了也可以直接格掉合并回去。先进优启通的PE系统，果然这个PE不能用触控，所以为什么得整一个磁吸键盘。打开DG磁盘分区，把原来只有一个分区一掰两半，也就是两个60G。选中原来的系统盘，再打开菜单栏的分区-拆分分区，输入第二个系统盘分区的大小，比如说60G，就可以直接一掰两半了。

重新启动，还是从U盘UEFI启动。这次直接选择那个Windows 11的镜像。很顺利，直接就到了选择安装分区的界面。也没啥检测之类的（之前在原来Windows 10运行过健康状况检查，这台平板直接显示的是可以运行Windows 11😁）。选择刚刚在PE分出来的新分区。接下来就等待释放系统文件。

看到提示重启了之后重启，再从U盘引导，这次还是选择优启通PE系统。打开开始-系统安装-UEFI引导修复。同时打开DG磁盘分区，看一下硬盘哪个分区是放EFI的，然后在UEFI引导修复选择这个放EFI的分区，点选开始修复。这步千万不能出错。

再次重启，他默认还是引导原来的Windows 10分区，但是这次就多出来了一个菜单。因为还没正式发布，所以菜单上显示了两个“Windows 10”。选择所在卷编号较大的那个，那个就是Windows 11了。这个如果看着碍眼的话可以后续用EasyBCD来修改菜单显示名称。又一次重启，然后就显示启动服务、安装设备等字样。然后自动重启，还是出现两个“Windows 10”的菜单，还是选择后一个。然后就看到黑底的“海内存知己，天涯若比邻”的字样了！剩下的步骤就和虚拟机安装Windows 11的过程一样了！

剩下的自动配置过程都很顺利。到选择国别的界面的时候，看一下触控好不好使，触控确实能用，但是在按下移动的时候会出现鬼点的问题。果然寨板的驱动适配是不完整的。连接网络界面也能直接看到Wifi热点的名称，说明网卡直接适配成功！

但是进入桌面后注意到音量图标打了个叉。也无法调整音量。长按开始按钮，选择设备管理器，展开“系统设备”，果然看到一个音频控制器显示黄色惊叹号。所以主要是两个处的驱动没有适配好，一个是触控，另一个是声卡。

此前已了解到，Windows 10的驱动在Windows 11基本都可以直接用。回到原来的Windows 10系统，打开Dism++。把原来的驱动都导出出来（内置驱动可以不用导出）。记住导出驱动的目录。在Dism++中切换到安装的Windows 11，打开会话，再把导出的驱动导入到这里面来。重启到Windows 11，鬼点和无声的问题都自行解决了！

稍微試了两个应用。一个是Flash独立播放器运行小花仙页游，和Windows 10体验基本没差。另一个是B站的UWP客户端播放1080P视频，视频很流畅，但是弹幕滚屏有些跳帧！性能果然不太够。。。