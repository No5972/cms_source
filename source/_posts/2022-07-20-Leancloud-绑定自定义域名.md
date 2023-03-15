---
layout: post
title: "Leancloud 绑定自定义域名"
date: 2022-07-20 15:50:00
categories: 
  - [Web Building]
excerpt: "昨天收到邮件提醒，Leancloud 共享域名将于 8 月 1 日停止服务，需要使用自己的域名。由于本站评论系统依赖于 Leancloud 作为后端，这里需要将业务绑定到自己的域名上。按照 Leancloud 的指引来绑定自己的域名。"
mathjax: true
permalink: /archivers/128
isrepublish: false
---

昨天收到邮件提醒，Leancloud 共享域名将于 8 月 1 日停止服务，需要使用自己的域名。

由于本站评论系统依赖于 Leancloud 作为后端，这里需要将业务绑定到自己的域名上。按照 Leancloud 的指引来绑定自己的域名。

打开 Leancloud 的后台，打开自己的业务，选择设置-域名绑定。点击绑定新域名按钮，然后输入自己注册的独立域名的三级域名！第三级域名这里可以随便写，当然，为了便于区分，这里第三级域名就直接用 ```leancloud``` 好了。

其他的选项默认，然后直接点击确定。这时候他会提示需配置 DNS。前往注册域名的 NameServer 中指定的解析后台（这里的是 DNSPod），添加一条记录，主机记录填写刚才写的第三级域名，**记录类型这里注意选择 CNAME**，然后记录值填写他提示的推荐 DNS 配置。点击确定。

稍等片刻，刷新 Leancloud 的后台，然后就会显示已绑定。

![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/fe110c03e0044420b2e4f0e09c91d671.png)

前往网站之前配置评论的地方，这里的 hexo 是 ```themes/next/_config.yml```，找到 ```valine.serverURLs``` 属性，改成刚才在 Leancloud 后台配置的域名（注意不是 CNAME 的记录值）。然后重新部署页面，再看看评论有没有正常加载。如果正常加载，那么就可以继续使用评论系统了。

