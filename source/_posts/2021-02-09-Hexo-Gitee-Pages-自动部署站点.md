---
layout: post
title: "Hexo Gitee Pages 自动部署站点"
date: 2021-02-09 00:00:00
categories: 
 - [Web Building]
 - [Github]
 - [Automation]
excerpt: "经过查阅Hexo文档发现，Hexo默认会忽略隐藏文件和文件夹（包括名称以下划线和 .开头的文件和文件夹，Hexo的_posts和_data等目录除外）。因此需要在后台仓库的_config.yml文件添加这样的配置才能把.github的目录也给带进来。可能已经预留了include属性，建议先搜索这个属性，然后直接往这里面添加。"
mathjax: true
permalink: /archivers/70
---

此博客站点使用了Github作为主站，又使用了Gitee作为镜像站。但是Gitee免费账户是不支持提交后自动部署的，所以有大佬开发了在Github上使用的动作：```gitee-pages-action```（[点击查看](https://github.com/yanglbme/gitee-pages-action)）。只要在某个仓库配置好这个动作就能在往这个仓库提交任何内容时自动让Gitee部署Gitee里面指定仓库的内容。

我们按照这个仓库的文档往Hexo站点的```source```目录添加```.github\workflows\sync.yml```这个文件，并在这个文件里面配置要使用的Gitee站点仓库和用户名。
```yaml
name: Sync

on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Build Gitee Pages
        uses: yanglbme/gitee-pages-action@main
        with:
          # 注意替换为你的 Gitee 用户名
          gitee-username: 改成你的Gitee用户名
          # 注意在 Settings->Secrets 配置 GITEE_PASSWORD
          gitee-password: ${{ secrets.GITEE_PASSWORD }}
          # 注意替换为你的 Gitee 仓库，仓库名严格区分大小写，请准确填写，否则会出错
          gitee-repo: 改成你的Gitee仓库（用户名斜杠仓库名）
          # 要部署的分支，默认是 master，若是其他分支，则需要指定（指定的分支必须存在）
          branch: master
```

但是一个比较严重的问题是鄙人要让Github这边部署站点的仓库更新时触发这个动作，鄙人用的是Hexo，如果鄙人在```source```目录配置了```.github```目录时使用Hexo的```generate```命令是不会向Github提交这个动作的配置的。国内也没有一个比较好的解决方案，只好去查Hexo的文档。

经过查阅[Hexo文档](https://hexo.io/zh-cn/docs/configuration)发现，Hexo默认会忽略隐藏文件和文件夹（包括名称以下划线和 **```.```开头的文件和文件夹**，Hexo的```_posts```和```_data```等目录除外）。因此需要在后台仓库的```_config.yml```文件添加这样的配置才能把```.github```的目录也给带进来。可能已经预留了```include```属性，建议先搜索这个属性，然后直接往这里面添加。
```yaml
include: 
  - ".github/**/*"
```
但是这样即使配置了添加这些文件，他默认也会把这个源文件也给渲染，所以我们还需要设置忽略这个文件的渲染。继续在```_config.yml```文件查找```skip_render```属性，添加这个文件名。
```yaml
skip_render: 
  - ".github/**/*"
```
还有一处也需要修改，往远程仓库部署时要设置不能跳过隐藏的文件，因为Git Bash是按Linux设计的，默认会将```.```开头的文件和文件夹视为隐藏文件。所以要继续在```_config.yml```文件查找```deploy```属性，设置里面```ignore_hidden```为```false```。
```yaml
deploy:
  type: git
  ignore_hidden: false # 添加这个属性值为false
  repo: 
    gitee: git@gitee.com:你的Gitee仓库.git,要使用的分支名
    github: git@github.com:你的Github仓库.git,要使用的分支名
    # 可以先提交Gitee然后再提交Github，也就是把这个Gitee的地址放在前面。这样保证Gitee的站点内容能在Github开始动作之前完成提交。
```
注意Github的部署仓库后台的Settings里面也要按照最上面那个仓库说明中那样配置Secrets（```GITEE_RSA_PRIVATE_KEY```和```GITEE_PASSWORD```的两个密钥。其中：```GITEE_RSA_PRIVATE_KEY```存放```id_rsa```私钥；```GITEE_PASSWORD```存放Gitee帐号的密码），这一步不要忘记了。

这样设置之后就可以在Github完成部署仓库提交之后通过配置的动作自动使Gitee也部署站点。