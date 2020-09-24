---
layout: post
title: "Valine评论失效 由于LeanCloud国际版通用域名失效"
date: 2020-09-24 10:30:00
categories: Web-Building
excerpt: 现在如果使用国际版LeanCloud作为Valine评论的后端的话则必须指定自定义服务器URL才能正常使用了。自定义服务器的URL需要到LeanCloud后台查看。打开后台之后进入Settings - App Keys，找到Domain whitelist，里面的Request domain里面的那个xxxxxxxx.api.lncldglobal.com就是你需要指定的服务器URL。其中xxxxxxxx就是各位的AppID的前8位字符。
permalink: /archivers/35
---

昨天开始，国内大量使用国际版LeanCloud后端的博客的Valine评论一齐失效。

通过[Valine的Github的Issue](https://github.com/xCss/Valine/issues/340)得知，早在5月份LeanCloud官方就低调表示us.avoscloud.com域名将于不久后下线。

现在如果使用国际版LeanCloud作为Valine评论的后端的话则必须指定自定义服务器URL才能正常使用了。

自定义服务器的URL需要到LeanCloud后台查看。打开后台之后进入Settings - App Keys，找到Domain whitelist，里面的Request domain里面的那个xxxxxxxx.api.lncldglobal.com就是你需要指定的服务器URL。其中xxxxxxxx就是各位的AppID的前8位字符。

NexT主题需要在主题的```_config.yml```找到```valine```的```serverURLs```，设置为：

```yaml
serverURLs: https://xxxxxxxx.api.lncldglobal.com # 把xxxxxxxx替换成你自己AppID的前8位字符
```

这时候再重新部署应该就可以恢复了。