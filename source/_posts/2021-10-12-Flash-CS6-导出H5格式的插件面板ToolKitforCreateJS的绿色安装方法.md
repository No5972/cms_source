---
layout: post
title: "Flash CS6 导出 H5 格式的插件面板 ToolKit for CreateJS 的绿色安装方法"
date: 2021-10-12 00:30:00
categories: 
  - [Webapp]
    - [Moving Away from Flash]
excerpt: "Flash安装插件的时候，需要Adobe Extension Manager ，但是安装Adobe Extension Manager 是一个很繁琐的过程，不一定成功，有时候还需要重新安装Flash，甚至这个Adobe Extension Manager 还不一定能用。所以就有了此文，手动安装插件面板。此方法可以免去安装 Adobe Extension Manager 的前提。"
mathjax: true
permalink: /archivers/108
isrepublish: false
---

Flash安装插件的时候，需要Adobe Extension Manager ，但是安装Adobe Extension Manager 是一个很繁琐的过程，不一定成功，有时候还需要重新安装Flash，甚至这个Adobe Extension Manager 还不一定能用。所以就有了此文，手动安装插件面板。

此方法可以免去安装 Adobe Extension Manager 的前提。

此方法在Flash CS6 环境下测试有效。

打开 Flash ，不要新建默认类型的文档，而是新建一个 Flash JavaScript  文件，输入```fl.trace(fl.configURI);```，然后点播放按钮，查看输出面板（也就是按 F2 会出现的面板），会看到类似如下的信息：

```
file:///C|/Documents%20and%20Settings/Administrator/Local%20Settings/Application%20Data/Adobe/Flash%20CS6/zh_CN/Configuration/  
```

根据上面的信息，找到相应的目录（前提是你的系统要能查看到隐藏目录）。

ToolKit for CreateJS 这个插件的文件结构是比较复杂的。我们用 7-Zip 打开这个 .zxp 的文件。里面有若干目录，但是首先注意到根目录有一个 .mxi 的文件，强行用文本编辑器打开，发现是一个 XML 格式的文件。经过一番查找后发现在文件下方记载了插件包各个文件需要放置的路径。```destination```的```$Flash```应该就是前者出现的目录路径。前往这个目录的路径，然后在 7-Zip 中将对应的文件放入指定的目录。

![](https://img-blog.csdnimg.cn/426a2eb40e7f4f88a96e5d0ce87fbe16.png)


这样在```Configuration```目录中释放好的文件结构应该是这样子的。

```powershell
PS C:\Users\Admin\AppData\Local\Adobe\Flash CS6\zh_CN\Configuration> tree /F ./CreateJS
>>  tree /F .\WindowSWF\ | Select-String -pattern "(CreateJS|WindowSWF)"
卷 Windows-SSD 的文件夹 PATH 列表
卷序列号为 AEBC-8FC1
C:\USERS\ADMIN\APPDATA\LOCAL\ADOBE\FLASH CS6\ZH_CN\CONFIGURATION\CREATEJS
├─jsfl
│      BitmapSymbol.jsfl
│      ContainerSymbol.jsfl
│      Exporter.jsfl
│      exportUtils.jsfl
│      FileChangeManager.jsfl
│      LayerObj.jsfl
│      Locale.jsfl
│      Log.jsfl
│      main.jsfl
│      Matrix2D.jsfl
│      Publish for CreateJS.jsfl
│      ShapeInst.jsfl
│      SoundSymbol.jsfl
│      StateObj.jsfl
│      SymbolInst.jsfl
│      TextInst.jsfl
│      utils.jsfl
│
├─libs
│      Ease.js
│      easel.js
│      MovieClip.js
│      preload.js
│      sound.js
│      Timeline.js
│      Tween.js
│
└─locale
    ├─en_US
    │      strings.xml
    │
    └─ja_JP
            strings.xml


C:\USERS\ADMIN\APPDATA\LOCAL\ADOBE\FLASH CS6\ZH_CN\CONFIGURATION\WINDOWSWF
    Toolkit for CreateJS.swf
```

按照上面的结构布置好文件以后，打开 Flash ，打开或者新建 FLA 文档，然后点击菜单栏的窗口-其他面板，就可以看到 ToolKit for CreateJS 这个选项了，然后就可以按照其他文章的做法来导出 HTML5 的动画了。

![](https://img-blog.csdnimg.cn/72aaab3b4e734a5cb7dc0c1371470b32.png)
