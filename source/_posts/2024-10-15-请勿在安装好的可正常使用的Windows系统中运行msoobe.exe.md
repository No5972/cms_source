---
layout: post
title: "仅作笔记用：请勿在安装好的可正常使用的 Windows 系统中运行 msoobe.exe"
date: 2024-10-15 18:00:00
categories: 
  - [Webapp]
excerpt: "请勿在一个安装好的、可正常使用的 Windows 系统下运行 msoobe.exe 程序。这将有可能导致系统卡死在“请稍候”或者“海内存知己，天涯若比邻”的画面，相当于系统崩溃的结果。此时只能使用 CMD 盲打 shutdown -r -t 0 或者直接按机箱上的电源键或重启键重启。"
mathjax: true
permalink: /archivers/165
isrepublish: false
---

请勿在一个安装好的、可正常使用的 Windows 系统下运行 ```msoobe.exe``` 程序。

这将有可能导致系统卡死在“请稍候”或者“海内存知己，天涯若比邻”的画面，相当于系统崩溃的结果。此时只能使用 CMD 盲打 ```shutdown -r -t 0``` 或者直接按机箱上的电源键或重启键重启。

据信运行此程序后会在系统下创建一个名为 ```defaultuser0``` 的账号，且无法从设置或控制面板删除。

可使用 ```net user defaultuser0 /delete``` 命令删除。

参考：[安装好系统后运行OOBE程序（msoobe.exe）会怎么样？_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1gM411P7gc/)