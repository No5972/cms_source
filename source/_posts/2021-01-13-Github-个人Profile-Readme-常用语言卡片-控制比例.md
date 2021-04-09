---
layout: post
title: "Github 个人Profile Readme 常用语言卡片 控制比例"
date: 2021-01-13 18:00:00
categories: [Github]
excerpt: "和之前的控制仓库语言的原理是一样的，这个功能也是通过统计代码量来统计常用语言的占比。所以我們仍然需要使用各个仓库的.gitattributes文件的linguist-language=XXX以及linguist-vendored（后者特别注意）。"
permalink: /archivers/64
---

和之前的控制仓库语言的原理是一样的，这个功能也是通过统计代码量来统计常用语言的占比。所以我們仍然需要使用各个仓库的```.gitattributes```文件的```linguist-language=XXX```以及```linguist-vendored```（后者特别注意）。
前者大家都熟悉了，把指定路径的文件视为XXX语言，可以使用星号通配符。
主要是后者，这个国内很多地方都没说，统计时忽略指定路径的文件的语言，一般用于引入的现有的第三方提供商JS等代码。

例如：
```gitattributes
*.bat linguist-language=csharp
miniprogram/pages/index/UPNG.js linguist-vendored
miniprogram/pages/index/gifuct-js.js linguist-vendored
miniprogram/pages/index/pako.min.js linguist-vendored
miniprogram/pages/index/jquery*.js linguist-vendored
```
通过这两个设置不仅能控制仓库的代码统计，**也可以控制个人Profile Readme 常用语言卡片的语言占比**。

---

此外，Hexo的生成博客仓库可能提交不了```.gitattributes```文件，这里需要修改两个设置，一个是在```source```目录的根目录添加```.gitattributes```文件，另一个是在Hexo的配置文件```_config.yml```中的```deploy```设置添加```ignore_hidden: false```，因为Git Bash会将只有后缀名没有文件名的文件默认视为隐藏文件，这里要把隐藏文件也提交至Github仓库。
```yaml
deploy:
  type: git
  ignore_hidden: false
  repo: 
    github: git@github.com:XXX/YYY.git,master
    gitee: git@gitee.com:XXX/YYY.git,master
```