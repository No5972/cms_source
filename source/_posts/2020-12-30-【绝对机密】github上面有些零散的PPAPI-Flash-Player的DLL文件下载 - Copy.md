---
layout: post
title: "【绝对机密】github上面有些零散的PPAPI Flash Player的DLL文件下载"
date: 2020-12-30 11:30:00
categories: Moving-Away-from-Flash
excerpt: "https://github.com/search?l=&q=filename%3Apepflashplayer.dll&type=code，点开看一下分支名字，看下有没有Releases，如果有的话访问https://cdn.jsdelivr.net/gh/用户名或组织名/仓库名@分支名/路径/pepflashplayer.dll就可以下载了。如果有需要manifest.json的话试着把最后的文件名改成这个，可能会报“Couldn't find the requested file”。如果报的话就再换一个搜索结果看看。"
permalink: /archivers/58
---

[https://github.com/search?l=&q=filename%3Apepflashplayer.dll&type=code](https://github.com/search?l=&q=filename%3Apepflashplayer.dll&type=code)
点开看一下分支名字，看下有没有Releases，如果有的话访问
```
https://cdn.jsdelivr.net/gh/用户名或组织名/仓库名@分支名/路径/pepflashplayer.dll
```
就可以下载了。
如果有需要```manifest.json```的话试着把最后的文件名改成这个，可能会报“Couldn't find the requested file”。如果报的话就再换一个搜索结果看看。