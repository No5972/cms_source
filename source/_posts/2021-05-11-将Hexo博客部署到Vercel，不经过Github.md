---
layout: post
title: "将Hexo博客直接部署到Vercel，不经过Github"
date: 2021-05-11 15:00:00
categories: 
 - [Web Building]
excerpt: "近期，Github国内访问困难，想更新下博客都不行。而网上的博客清一色的写着需要将Vercel接入Github仓库来部署。这里研究一下能不能直接把Hexo博客部署到Vercel而不需要经过Github。"
mathjax: true
permalink: /archivers/89
---

近期，Github国内访问困难，想更新下博客都不行。而网上的博客清一色的写着需要将Vercel接入Github仓库来部署。这里研究一下能不能直接把Hexo博客部署到Vercel而不需要经过Github。

首先当然是需要准备一个Vercel账号的。没有的需要注册，~~注册过程网上博客写的很齐全，这里不再赘述。~~ 居然还有博客写的必须使用Github，这里纠正一下，邮箱就可以注册了，Github访问困难的情况下没有必要弄Github第三方登录！在注册页面右侧点击最下面那个不太显眼的Continue with Email就可以了！有博客说QQ邮箱不能用，这里也实测了，其实也是可以用的。就是那种类似于```123456789@qq.com```的邮箱就行！

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210511121841353.jpeg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM1OTc3MTM5,size_16,color_FFFFFF,t_70#pic_center)


既然已经有Hexo博客了，那么肯定是有Node.js了。如果没有Hexo博客的话需要搭建一个，具体过程其他博客写的都有，这里就不再重复了，要能在博客根目录执行```hexo s```并能通过HTTP访问博客页面为准。

我们使用```npm```安装Vercel控制台客户端。

```bash
npm install -g vercel
```

Hexo自带了一个生成静态站点的功能，我们只需把Hexo博客生成静态站点然后就可以直接部署到Vercel。Vercel是可以自动识别根目录和子目录的```index.html```文件的。
```bash
hexo g
```

然后```cd```到博客的```public```目录。执行
```bash
vercel
```

第一次会提示你登录。输入你注册Vercel账号的邮箱地址，然后Vercel会给这个邮箱发一封邮件，控制台程序也会等待验证完成，打开这个邮件点击验证（VERIFY）按钮，点击之后就显示验证完成，控制台程序也会提示登录成功。

这时候再执行

```bash
vercel --prod
```

然后出现这些提示，按照提示操作！

{% note info %}
如果需要自动化集成（也就是不用回答下列问题）的话，前面的命令也可以使用```vercel --prod --confirm```，但是这样的话项目名称会自动使用缺省值，如果需要指定项目名称的话就需要在博客根目录添加```vercel.json```文件，配置```name```属性：```{ name": "my-hexo-blog" }```
{% endnote %}

```bash
? Set up and deploy “/home/runner/no5972tk/my-hexo-blog”? [Y/n] 
# 选择发布到的位置 -> 直接回车
# 默认就是账户名，显示在提示下面
# 可以在官网登录后访问这个地址查看：https://vercel.com/dashboard
Which scope do you want to deploy to?
·[username]
# 是否链接到一个存在的项目 -> n
? Link to existing project? [y/N]
# 为项目命名，这里输入的项目名会反映在域名上
? What’s your project’s name? (my-hexo-blog)
# 选择代码的位置，当前代码位置就是根目录 -> 直接回车
? In which directory is your code located? ./
```

最后显示

```bash
✅ Production : https://xxxxxx.vercel.app [copied to clipboard] [10s]
```
的时候就部署到Vercel上了，其中```xxxxxx```是项目名称。这个域名就是部署好的域名，从这个网址进去就可以访问博客了。

{% note info %}
后续还可以从Vercel网页端的Settings里面绑定自己注册的独立域名，然后在自己的域名解析里面设置解析到```76.76.21.21```，这样就可以通过独立域名来访问了。

> 进入这个项目，选择Settings，Domains，添加之前注册的独立域名。添加以后这时候Vercel的界面会提示你需要添加域名的解析。到这个域名解析的后台，添加一个类型为```A```，主机记录为```@```的解析记录，如果之前有这个记录则直接修改。记录值按照Vercel的界面提示填写```76.76.21.21```。其他选项保持默认即可。
>
> ![](https://img-blog.csdnimg.cn/20210218100218514.png)
>
> 稍等片刻，再访问这个域名，即可以更快的速度显示页面了。
{% endnote %}