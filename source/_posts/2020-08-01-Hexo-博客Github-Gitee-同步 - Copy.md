---
layout: post
title:  "Hexo 博客Github、Gitee同步"
date:   2020-08-01 17:30:00
categories: 
 - [Web Building]
 - [Github]
excerpt: Github在国内访问还是偏慢的，尽管我们将所有能弄的静态资源都移到拥有国内节点的JSDelivr上了。这里决定将博客在Gitee建立一个镜像，这样如果国内访问太慢的话我们可以从Gitee也就是“码云”来访问网站。
permalink: /archivers/18
---

Github在国内访问还是偏慢的，尽管我们将所有能弄的静态资源都移到拥有国内节点的JSDelivr上了。这里决定将博客在Gitee建立一个镜像，这样如果国内访问太慢的话我们可以从Gitee也就是“码云”来访问网站。

首先当然要登录Gitee账号，没有的话需要注册。新建一个仓库，仓库名称和要输入和这个子路径相同的名称，到时候发布站点的时候系统生成的地址就是这个子路径的地址。路径系统自动生成可以不用管。

然后和Github一样设置免密更新。

我们需要在Hexo站点本地代码的配置中添加Gitee的远程地址。这是展示仓库，我们不需要手动到Gitee的仓库添加代码。

直接在```_config.yml```文件里面在```repo```里面的```github```处再另起一行，填写仓库SSH地址。但是这时候提交会发现Github的分支变成了```gh-page```。发布站点用的分支是```master```，这就造成了混乱，所以这里需要强调的地方就是如何在Hexo往多个远程仓库推送时分别指定对应的分支。

这里就不能用单独的```branch```属性了，需要用另外一种格式来指定远程仓库的分支。

```yaml
gitee: git@gitee.com:[用户名]/[仓库名].git,[分支名]
```

每一个仓库都要加上对应的分支。

完整的```deploy```部分的配置如下：

```yaml
# Deployment
## Docs: https://hexo.io/docs/deployment.html
deploy:
  type: git
  repo:
    github: git@github.com:[Github用户名]/[Github仓库名].git,master
    gitee: git@gitee.com:[Gitee用户名]/[Gitee仓库名].git,master
```

到Gitee页面打开仓库，选择上面的服务-Gitee Pages，选择```master```分支，部署目录不填，最好勾选强制HTTPS。然后点击部署。注意查看部署的URL看看子路径是不是和Github的子路径一致。

类似的方法还可以部署到Coding、Gitlab等更多网站，这里就不再赘述了。