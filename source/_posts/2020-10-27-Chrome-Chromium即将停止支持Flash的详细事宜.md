---
layout: post
title: "Chrome/Chromium即将停止支持Flash的详细事宜"
date: 2020-10-27 17:30:00
categories: [Moving Away from Flash]
excerpt: "2021.1：从Chromium移除对Flash的支持！"
permalink: /archivers/41
isrepublish: true
---

来源：[![Chromium-Flash Roadmap](https://img.shields.io/badge/Chromium-Flash%20Roadmap-brightgreen)](https://www.chromium.org/flash-roadmap)

# Upcoming Changes 即将实装
## Removing Support for Hostname Wildcards for PluginsAllowedForUrls (Target: Chrome 85 - Aug 2020)<br>移除启用Flash的网站域名白名单通配符的支持 - 2020.8，版本85
### Summary 概要
Remove the ability to define Flash Player content settings that use wildcards in the hostname (e.g., ```https://*```or ```https://[*.]mysite.foo```).
移除启用Flash的网站域名白名单通配符的支持。（例如```https://```或```https://[*.]mysite.foo```）

### Rationale 原理
The change requires that administrators to audit their Flash usage and explicitly add urls that they want to automatically enable Flash Player support for.
此变更要求管理员确认其使用Flash的用途并明确添加需要自动启用Flash支持的URL。


## Removing the Ability for Extensions to Inject Flash Content Settings (Target: Chrome 86 - Oct 2020)<br>移除开发扩展时访问Flash内容的支持 - 2020.10，版本86
### Summary 概要
Remove the ability for extensions to inject Flash Player content settings.
移除开发扩展时访问Flash内容的支持

### Rationale 原理
Ensure that all non-policy enabled Flash content requires per session activation, which coupled with the warning in the activation prompt should help to increase awareness of the impending change in support.
确保所有未启用策略的Flash内容都需要按会话激活，再加上激活提示中的警告应有助于提高对即将发生的支持更改的认识。

## Flash Player blocked as "out of date" (Target: All Chrome versions/ - Jan 2021)<br>以“过期”原因禁用Flash - 2021.1，所有版本
### Summary 概要
Flash Player will be marked as out of date and will be blocked from loading.
Flash Player将被标记为过期，试图加载时将被禁用。

### Rationale 原理
Align with Adobe's announced plan to end support.
和Adobe宣布停止支持Flash的计划同步。

## Flash Support Removed from Chromium (Target: Chrome 88+ - Jan 2021)<br>从Chromium移除对Flash的支持 - 2021.1，版本88及以上
### Summary 概要
Flash support/ capability will be removed from Chromium.
从Chromium移除Flash的支持和兼容！

### Rationale 原理
Align with Adobe's announced plan to end support.
和Adobe宣布停止支持Flash的计划同步。
