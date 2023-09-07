---
layout: post
title: "Civitai 通过 API 下载模型"
date: 2023-09-07 17:00:00
categories: 
  - [Python]
excerpt: "请求地址里面的 ```{id}``` 就是上一步找到的模型 **版本** 的 ID。访问后会返回一个 307 响应码。响应头的 ``` location``` 就是真实下载地址，但是这个地址是临时的，要尽快完成下载，不久后就会失效。"
mathjax: true
permalink: /archivers/151
isrepublish: false
---

# 域名和 web 网站的域名一样

# 搜索模型：```GET /api/v1/models```
常用参数（都是可选）： 
- ```tag``` 标签 
- ```query``` 标题（模糊查询）
- ```page``` 页数
- ```limit``` 每页大小
- ```username``` 作者用户名
- ```types``` 模型类型 (```Checkpoint, TextualInversion, Hypernetwork, AestheticGradient, LORA, Controlnet, Poses```) ，默认加载所有类型
- ```sort``` 排序方式 (```Highest%20Rated, Most%20Downloaded, Newest```)

在返回的数据中：
- ```items[a].creator``` 作者信息
- ```items[a].name``` 模型标题
- ```items[a].description``` 模型介绍（HTML格式） 
- ```items[a].modelVersions[b].images[c].url``` 预览图
- ```items[a].modelVersions[b].images[c].meta``` 预览图的 AI 参数
- ```items[a].modelVersions[b].downloadUrl``` **下一步** 要下载要用的地址（有跳转，API 不能直接下）

# 下载模型：```GET /api/download/models/{id}```
请求地址里面的 ```{id}``` 就是上一步找到的模型 **版本** 的 ID。

访问后会返回一个 307 响应码。响应头的 ``` location``` 就是真实下载地址，但是这个地址是临时的，要尽快完成下载，不久后就会失效。