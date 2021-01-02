---
layout: post
title: "提供一个Java SE程序打单个EXE包部署到不带JRE电脑运行的实现（有点复杂）"
date: 2020-12-28 18:00:00
categories: Java
excerpt: "注意“应用程序文件”那一步指定刚才用exe4j生成的EXE文件，然后把jre目录加到“其他应用程序文件”里面，然后安装脚本里面[Files]的那个jre目录后面的DestDir改成{app}\\jre。"
permalink: /archivers/56
---

大致步骤：
1. 在IDE中打一个Runnable JAR。
2. 将JRE目录拷贝一份出来，重命名为```jre```。
3. 使用exe4j把JAR包转换成EXE，注意JRE那一步的Search Sequence里面别的都不要，只设置一个Directory里面填```.\jre```。
4. 使用Inno Setup打安装包。
   - 注意“应用程序文件”那一步指定刚才用exe4j生成的EXE文件，然后把```jre```目录加到“其他应用程序文件”里面，然后安装脚本里面```[Files]```的那个```jre```目录后面的```DestDir```改成```{app}\jre```。
   - 尽量用命令行确认打包（```ISCC.exe C:\path\to\your\file.iss```），这工具打包时经常出现文件被其他进程占用的问题，用命令行可降低出现此故障的几率。
5. 把安装包安装。
6. 使用《单文件软件封装工具》（标题栏有QQ号，右下角状态栏显示压缩率的那个）把安装目录打包成单个EXE文件。
   - 使用7z模式打包出来的EXE启动稍微快一些。

详细步骤抽时间来补充。