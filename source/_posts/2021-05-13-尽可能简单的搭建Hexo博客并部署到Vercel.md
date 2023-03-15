---
layout: post
title: "尽可能简单的搭建Hexo博客并部署到Vercel"
date: 2021-05-13 17:00:00
categories: 
 - [Web Building]
excerpt: "EXO是一款非常优秀、易用、美观的开源博客框架。提供非常丰富的，可以随意修改的主题供你使用。这里研究一下如何尽可能简化搭建Hexo博客的步骤。我们这里还是使用Repl.it和Vercel来搭建Hexo博客。这次不需要弄GitHub，毕竟近期GitHub国内访问困难。"
mathjax: true
permalink: /archivers/90
---

> HEXO是一款非常优秀、易用、美观的开源博客框架。提供非常丰富的，可以随意修改的主题供你使用。这里研究一下如何尽可能简化搭建Hexo博客的步骤。

我们这里还是使用Repl.it和Vercel来搭建Hexo博客。这次不需要弄GitHub，毕竟近期GitHub国内访问困难。

大致的步骤是这样的：
1. [注册Repl.it](#11-%E6%B3%A8%E5%86%8Creplit)
2. [注册Vercel](#12-%E6%B3%A8%E5%86%8Cvercel)
3. [创建Bash语言的Repl](#21-%E5%9C%A8replit%E5%88%9B%E5%BB%BArepl)
4. [初始化Hexo](#22-%E4%B8%80%E5%8F%A5%E8%AF%9D%E5%88%9D%E5%A7%8B%E5%8C%96hexo)
5. [安装Vercel](#31-%E5%AE%89%E8%A3%85vercel)
6. [登陆Vercel](#32-%E7%99%BB%E9%99%86vercel)
7. [部署到Vercel](#33-%E9%83%A8%E7%BD%B2%E5%88%B0vercel)

# 1. 注册账号
## 1.1 注册Repl.it
现在的网站变成[replit.com](https://replit.com)了。进去之后点击右上角的Sign Up，Username取一个用户名，Email输入注册邮箱（QQ邮箱也可以），Password输入创建密码。下面那个复选框是如果是教师就勾选，但是似乎作用不大，除非是组织学生使用replit来学习。点击Sign Up之后到填写的邮箱查收验证邮件，并点击里面的验证按钮确认验证。点击之后如果还显示需要验证邮箱就刷新一下。这样注册就完成了。
![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/20210513152605365.png)
![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/20210513152752180.png)
![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/20210513152953190.png)
## 1.2 注册Vercel
打开[vercel.com](https://vercel.com/)，还是点击右上角的Sign Up，然后点击右侧下方的Continue With Email。输入邮箱（也可以使用QQ邮箱），再点击Continue With Email。然后会提示验证邮箱。这时候前往注册邮箱查收验证右键，点击验证按钮，注册就完成了。

{% grouppicture 4-2 %}
![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/20210511121841353.jpeg)
![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/20210513153337342.png)
![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/20210513153509427.png)
![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/20210513153737338.png)
{% endgrouppicture %}

# 2. 初始化Hexo
## 2.1 在Replit创建Repl
到Repl的页面，点击左上方的“ + New Repl”，创建一个Bash语言的Repl。如果候选列表看不到Bash也可以输入bash，然后就看到了。给Repl起一个名字。然后点击Create repl，然后就自动跳转到写代码的页面了。
![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/20210513154116948.png)
## 2.2 一句话初始化Hexo
[Vercel官网给了一条命令](https://vercel.com/guides/deploying-hexo-with-vercel)，这一条命令就可以把Hexo初始化了。这里的Repl本身就是一台位于美国的Linux云服务器，所以不需要考虑网速不够的问题，也就不需要配置什么镜像源。

在Replit页面把右边敲命令的黑框点一下，然后直接输入Linux命令。Replit自带了Node.js，也不用安装了，可以直接输入Node.js 的命令。
```bash
npx hexo init my-hexo-blog && cd my-hexo-blog
```

这样就完成了Hexo的初始化。当然，这样的话```hexo```命令是不会加载到```PATH```环境变量的。这样执行之后```hexo```命令位于```/my-hexo-blog/node_modules/.bin```中，要把这个```hexo```加到环境变量里面。

```bash
export PATH=$PATH:~/$REPL_SLUG/my-hexo-blog/node_modules/.bin
```

然后```cd```到```my-hexo-blog```，执行
```bash
hexo s
```
就可以看到右上角出现网页了。也可以点击第二个按钮新开一个标签查看。
![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/20210513155633407.png)
# 3. 部署到Vercel
## 3.1 安装Vercel
我们使用```npm```安装Vercel控制台客户端。```cd```到```my-hexo-blog```，执行
```bash
npm install vercel
```

由于这里把Vercel客户端直接安装在博客目录，所以之前配置的环境变量可以直接使用。但是以后重新打开Repl IDE页面的时候需要在右边的shell中重新执行一下设置环境变量，具体操作参考后面的[部署到Vercel](#33-%E9%83%A8%E7%BD%B2%E5%88%B0vercel)。

## 3.2 登陆Vercel
首次运行Vercel提示你登录。输入你注册Vercel账号的邮箱地址，然后Vercel会给这个邮箱发一封邮件，控制台程序也会等待验证完成，打开这个邮件点击验证（VERIFY）按钮，点击之后就显示验证完成，控制台程序也会提示登录成功。
![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/20210513160536475.png)
![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/20210513160536489.png)
![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/20210513160536481.png)
## 3.3 部署到Vercel
登陆上去之后就可以部署了。我们需要把Hexo生成静态站点，然后到生成的站点目录去执行部署到Vercel。

`cd`到```my-hexo-blog```，执行

```bash
hexo g
```

然后```cd```到```public```目录，执行

```bash
vercel --prod --confirm
```
，然后显示

```bash
✅ Production : https://xxxxxx.vercel.app [copied to clipboard] [10s]
```

的时候就部署到Vercel上了，其中```xxxxxx```是项目名称。这个域名就是部署好的域名，从这个网址进去就可以访问博客了。

以后需要更新博客的话，就可以直接打开Replit，打开这个Repl，在```source/_posts```目录添加```.md```格式的博文，然后执行下列操作：

```bash
cd my-hexo-blog
npm install vercel
export PATH=$PATH:~/$REPL_SLUG/my-hexo-blog/node_modules/.bin
vercel
# 到邮箱查收邮件，验证你的邮箱
hexo cl && hexo g && cd public && vercel --prod --confirm && cd ..
```

{% note info %}
后续还可以安装新的主题，在博客站点的```themes```文件夹```git clone```想要的主题，然后修改博客的```_config.yml```文件的```theme```属性到对应的主题目录，就可以切换新的主题了。也可以在拉取下来的主题修改任意文件设计自己需要的自定义样式。关于主题配置这方面，其他博客写的很详细，这里就不再赘述了。
{% endnote %}

{% note info %}
后续还可以从Vercel网页端的Settings里面绑定自己注册的独立域名，然后在自己的域名解析里面设置解析到```76.76.21.21```，这样就可以通过独立域名来访问了。

> 在Vercel网页端登陆账号，进入这个项目，选择Settings，Domains，添加之前注册的独立域名。添加以后这时候Vercel的界面会提示你需要添加域名的解析。到这个域名解析的后台，添加一个类型为```A```，主机记录为```@```的解析记录，如果之前有这个记录则直接修改。记录值按照Vercel的界面提示填写```76.76.21.21```。其他选项保持默认即可。

> ![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/20210218100218514.png)

> 稍等片刻，再访问这个域名，即可以更快的速度显示页面了。
{% endnote %}

