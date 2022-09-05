---
layout: post
title: "DebreateForUOS 打包 UOS Electron 应用"
date: 2022-08-04 11:30:00
categories: 
  - [AtoW]
excerpt: "接下来，熟悉如何打包一个 UOS 应用。现在不少新的桌面应用开始使用 Electron 作为 GUI 框架，它允许使用 JavaScript 来实现 GUI 及其交互功能，并且跨平台也比较好，无需用户配置专门的运行环境就可以直接开箱即用。"
mathjax: true
permalink: /archivers/131
isrepublish: false
---

接下来，熟悉如何打包一个 UOS 应用。现在不少新的桌面应用开始使用 Electron 作为 GUI 框架，它允许使用 JavaScript 来实现 GUI 及其交互功能，并且跨平台也比较好，无需用户配置专门的运行环境就可以直接开箱即用。

# 获取 DebreateForUOS

首先“DebreateForUOS”可以在星火应用商店下载得到。当然这个应用商店也是需要开启开发者模式才能安装的。

# 准备好软件的文件

假设这是一个已经写好的 HelloWorld 的 Electron 应用，并且带有完整的 Electron 环境。在项目根目录输入 `./electron ./app` 可以打开 HelloWorld 的界面。完整的 Electron 环境可以在 UOS 应用商店搜索下载 Electron 然后从 `/opt/apps/com.electron/files/electron` 拷贝出来目录。

![在这里插入图片描述](https://img-blog.csdnimg.cn/55af1e9fae0c4a30a2d4ac930abcc526.png#pic_center)
# 准备好软件的图标文件

在程序目录添加一个 512 x 512 的 PNG 图标作为应用的图标。因为 UOS 的任务栏可以缩放，如果不搞这么高分辨率的图片，可能会出现图标模糊的情况。如果没有这样高分辨率的图标，也可以使用 SVG 格式的图标作为图标。随便起个名字，放到 `electron` 目录。

![在这里插入图片描述](https://img-blog.csdnimg.cn/d833ef13b20841d6b711486768c4071a.png#pic_center)
# 打开 DebreateForUOS，从菜单上的页面-Control 文件开始。

* 包名：要求填写域名加点加软件名。
* 版本：你自己定义的软件版本号。
* 维护者：当然是填自己的网名了。
* 电子邮箱：联系邮箱
* 分类：根据此应用的用途来选择类型。它将表征为上架应用商店时所属的归类。
* 优先级：我们是应用软件，不是系统组件，建议还是选择 optional。
* 架构：我们是面向 UOS 家庭版部署的，当然选择 amd64 了。
* 短述：它将表征为应用在双击安装包运行时显示的名称。
* 详细描述：它将表征为应用商店中显示的应用描述。

![在这里插入图片描述](https://img-blog.csdnimg.cn/6ec5061665fb4f2abac72ebdd9093131.png#pic_center)
# 菜单的页面-依赖和冲突：

我们是 Electron 应用，如果没有调用系统 API 的话一般不需要处理这里。

# 菜单的页面-info 文件：

也是应用的基本信息，先参考前面的 Control 文件来填写。这里还没搞懂作用，也有博客描述过这里的作用，可以参考《linux中dpkg里的info是干嘛的》这篇文章。

* 这里建议如实填写应用权限，如果不如实填写的话有可能 Linux 系统底层会限制一些功能，例如是否使用剪贴板，是否使用通知等。

![在这里插入图片描述](https://img-blog.csdnimg.cn/dd950e23e261483284a5ef1f4201ffeb.png#pic_center)
# 菜单的页面-Desktop 文件：
这一步很重要，它将影响应用在启动器菜单的加载。

* 如果我们的应用软件是手动打开的话（而不是作为系统服务来运行的话），就肯定要勾选创建系统菜单启动器。
* 我们的应用是一个应用程序，所以类型肯定是选择 Application。
* 我们是基于 Electron 的 GUI 应用，所以不需要勾选“终端”。否则就会多出来一个显示调试信息的小黑板，这作为面向大众用户的 GUI 应用是不合适的。
* 基于 Electron 的应用编码印象中都是选择 UTF-8 的。
* 启动通知没仔细看，他的描述是“启动时在系统面板显示一个通知”，但是之前曾经打包过的应用，运行时没有发现通知。
* Name 将表征为应用在启动器菜单以及 UOS 应用商店的应用管理显示的名称。
* 注释将表征为应用在 UOS 应用商店的应用管理的应用列表的应用名称下面显示的简述，以及鼠标悬停在启动器菜单项时显示的提示信息。
* MIME 类型这里没有给出提示，可以先留空。
* 可执行命令或路径：这里试了很久，最后是填绝对路径才解决的。这里的 HelloWorld 应用要填写 
```bash
/opt/apps/包名/files/electron /opt/apps/包名/files/应用目录
```
，其中包名就是最前面指定 Control 文件时填写的包名，而应用目录就是整理软件文件时的实际应用业务代码存放的目录。这里填写的是 
```bash
/opt/apps/moe.no5972.electrondemo/files/electron /opt/apps/moe.no5972.electrondemo/files/app
```

* 图标：也是要填写图标文件的绝对路径。这里填写的是
```bash
/opt/apps/moe.no5972.electrondemo/files/icon.png
```

* 分类：程序的类别决定了程序在系统启动器菜单项中的位置。
![在这里插入图片描述](https://img-blog.csdnimg.cn/050d18f9bf5f4cbba0ce2affbb794490.png#pic_center)
# 菜单的页面-icon 文件：
这一步决定了程序在上架时显示的图标。从左侧的树形文件列表找到最开始放进去的图标文件，拖到右边的列表去。然后根据使用图标文件的格式选择文件格式和尺寸。

![在这里插入图片描述](https://img-blog.csdnimg.cn/8e3fdb3f4c504a238c10ef24164c4d1f.png#pic_center)
# 菜单的页面- file 目录文件：
这一步也很重要，这决定了软件本体文件以及要放置的目标位置。注意首先将目标目录选择自定义，然后把输入框的“{包名}”改成之前在 Control 文件填写的包名。因为这里可能有 bug，如果选择前面的带有“{包名}”的选项，打包出来的程序安装后并不会安装到实际的包名目录，而是就放在了一个叫“{包名}”的目录。这里强调一下。

然后在左侧找到整理好的 electron 目录，展开，然后使用 Shift 选中目录下的所有文件，然后注意右键选择 Add to project，不要直接拖，否则他只会拖动鼠标指向的那一个文件，这样就得一个一个的拖了。

![在这里插入图片描述](https://img-blog.csdnimg.cn/8ad69a664acd4e0a9d99e57788ceeee1.png#pic_center)
# 菜单的页面-添加脚本：
如果需要在安装或者卸载时执行一些系统命令，那么在这里可以配置。注意有些涉及管理员操作的命令还是要加 `sudo` 前缀的。

![在这里插入图片描述](https://img-blog.csdnimg.cn/1315709b90254f2fb6cbed0e9add84af.png#pic_center)
# 菜单的页面-更新日志：
它将表征为软件在应用商店显示的更新信息。紧迫性表示此次更新的重要程度。如果这是同一个软件的新版本，那么就需要认真填写版本号和更新情况。
![在这里插入图片描述](https://img-blog.csdnimg.cn/07623dca61924801b30d67e56615aa3d.png#pic_center)
# 菜单的页面-版权文件：
如果这个软件有许可协议，那么可以在此填写。如果是遵循某种开源协议开源的软件，也可以直接选择现成的开源协议模板。

![在这里插入图片描述](https://img-blog.csdnimg.cn/12bfbccf6f1c4955b9a17994c9bb6902.png#pic_center)
# 开始构建

然后就可以到菜单的页面-构建来开始打包了。点击中间的图标，指定打包 deb 文件的位置。然后稍等片刻，打包完成！

![在这里插入图片描述](https://img-blog.csdnimg.cn/85f84683154f4676aedffc8826439eba.png#pic_center)
![在这里插入图片描述](https://img-blog.csdnimg.cn/ee2cafe74b4a45259c3aefd3b6fa9af3.png#pic_center)
# 测试安装

测试安装打包好的文件，如果启动器的菜单项正常显示，并且可以正常打开，那么打包就是完美的。

![在这里插入图片描述](https://img-blog.csdnimg.cn/d7a5bbe9ceea4b0db77d9592157bead3.png#pic_center)
![在这里插入图片描述](https://img-blog.csdnimg.cn/50178062cb3244e6bc5c576025f80bf5.png#pic_center)
![在这里插入图片描述](https://img-blog.csdnimg.cn/74b62f0c2d2d4083b43b256385aa27bb.png#pic_center)


