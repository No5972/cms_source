---
layout: post
title: "关于Flash停止支持后Chrome如何启用过期插件"
date: 2020-11-05 08:30:00
categories: [Moving Away from Flash]
excerpt: "根据前段时间翻译的Chrome/Chromium停止支持Flash的详细事宜中提到的，2021年以后新版Chrome将直接不支持Flash，而旧版Chrome也会将Flash插件视为过期插件。届时即使是使用旧版的Chrome也会出现“Adobe Flash Player因过期而遭到阻止”的提示，每次都需要点击旁边的运行一次才能使用。"
permalink: /archivers/45
---

根据前段时间翻译的[Chrome/Chromium停止支持Flash的详细事宜](41.html#Flash-Player-blocked-as-“out-of-date”-Target-All-Chrome-versions-Jan-2021-以“过期”原因禁用Flash-2021-1，所有版本)中提到的，2021年以后新版Chrome将直接不支持Flash，而旧版Chrome也会将Flash插件视为过期插件。届时即使是使用旧版的Chrome也会出现“Adobe Flash Player因过期而遭到阻止”的提示，每次都需要点击旁边的运行一次才能使用。

如果仍然有需要依赖Flash的业务，应该提前关闭Chrome的自动更新，然后对旧版的Chrome主程序添加启动参数来手动启用过期的插件。启动参数如下：
```bat
chrome.exe --allow-outdated-plugins
```