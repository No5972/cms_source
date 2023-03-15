---
layout: post
title: "通过 U 盘安装 UOS 家庭版并和原来 Windows 组成双系统"
date: 2022-07-29 20:30:00
categories: 
  - [AtoW]
excerpt: "首先将要安装 UOS 系统的电脑空出来一个分区并随便设置一个卷标，用来装 UOS 系统。这里空出来的分区大小是 200GB。可以把分区保留而不需要删除分区。到时候 UOS 安装程序也可以删除分区。"
mathjax: true
permalink: /archivers/130
isrepublish: false
---

# 本安装记录仅适用于 x86 架构的电脑。
# 1. 腾出要安装系统的分区

首先将要安装 UOS 系统的电脑空出来一个分区并随便设置一个卷标，用来装 UOS 系统。这里空出来的分区大小是 200GB。可以把分区保留而不需要删除分区。到时候 UOS 安装程序也可以删除分区。

# 2. 下载 UOS 安装镜像并制作安装盘

从 UOS 家庭版官网选择“镜像安装”下载安装的ISO镜像。

准备一个已制成 Ventoy 启动盘的 U 盘，将下载好的 ISO 镜像拷贝到 U 盘。

# 3. 设置安装分区并进行安装

将 U 盘插入到需要安装的电脑上，进入引导菜单，选择 UEFI 模式的 U 盘进入。看到 Ventoy 的界面后选择 UOS 的安装镜像进入。

![在这里插入图片描述](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/ae68968ef51b43d6ac1cc416e8f8f07d.jpeg)


看到 UOS 的欢迎界面，此时选择自定义设置，然后选择手动安装。

![在这里插入图片描述](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/4bfaa1b45c2147da923193c7df09905d.png)
![在这里插入图片描述](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/7d07735a523145188f726d66892e12ca.png)


原有的安装系统和存放资料的分区不要动，根据最开始设置的卷标找到事先空出来的分区，将其删除，创建一个略小于空出来的分区大小的分区（一般比原来小 1 - 2GB 左右），格式为 ext4，挂载点注意选择“/”。再创建一个分区，格式选择交换分区，大小为原来小出来的那部分大小。选中刚才创建的 ext4 分区，然后他会显示一个“安装到此”的字样。确认无误后点击下一步确认开始。

![在这里插入图片描述](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/b22a296a3ff347feba918c8daaaff9b3.png)


大约 10 到 15 分钟时间可以完成安装。进度条走完后，点击立即重启，点击后立刻拔下 U 盘。

![在这里插入图片描述](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/359a4752597446bc8d1df09e3be3d86a.png)
![在这里插入图片描述](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/eada7e130bba42429adc137ee83c4620.png)


稍等片刻即可进入到 OOBE 界面。此时按照提示输入一个新建用户名，并指定开机密码。确认后会显示正在更新系统配置，稍等片刻就可以进入 UOS 桌面了。

# 4. 激活系统

未激活的情况下只能使用 30 天。可以到 UOS 家庭版官网寻找激活方式。

![在这里插入图片描述](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/d8172bd72f8e4b4b94b4b1c5ddbb2768.png)

激活需要登录 Union ID 的账号，没有的话需要注册。

![在这里插入图片描述](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/fe88364197e844fe88b9f721ce51a54a.png)
![在这里插入图片描述](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/98e010e05f974de18851f1e676c4d6df.png)


此激活是绑定 Union ID 和设备的。如果系统损坏需要重装系统的话，重装系统后无需重新输入激活码，只要重新登录 Union ID 账号即可自动激活。

![在这里插入图片描述](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/0722e9130ef542268ab7c1991cde809c.png)


# 5. 设置双系统引导

**特别注意安装后千万不要在 BIOS 设置里面改启动顺序，尤其是 UEFI 方式引导的电脑。否则就会导致 UOS 系统无法引导。这种情况需要重装 UOS 系统才能解决。**

如果想调整启动顺序，务必在 UOS 的系统设置里面的通用 - 启动菜单里面修改。进入该界面后用鼠标直接在右上角的小窗口点击要默认选中的启动项即可，如果要默认选中 Win10/11 的启动项则在这个小窗口里面点选“Windows Boot Manager”即可。如果有多个分区或者多个硬盘都安装了 Windows 的话，这里的“Windows Boot Manager”后面会有括弧标注分区代号（`sda`，`sdb`，`sdc` 等表示硬盘，字母顺序对应硬盘插在主板上的 SATA1 - 4 的或者主从盘 M.2 插口的顺序，`sda` 等后面的数字表示分区），按照显示的分区代号来确定。

![在这里插入图片描述](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/a1e3713fbf0c4f5ca213e318b71f42c8.png)


如果无法确定的话可以从文件管理器来确认，双击桌面上的“计算机”图标，找到要默认启动的系统所在的分区后右键在终端中打开，输入 `pwd`回车看一看路径里面的分区代号是什么。

部分插图来自 UOS 家庭版官方文档。
