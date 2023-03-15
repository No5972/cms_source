---
layout: post
title: "将 Python Django 的 Web 项目部署到 Vercel"
date: 2022-01-07 17:00:00
categories: 
  - [Python]
excerpt: "又是一个国内没有资料的操作。这个要是实现了，那些不太大的 Python 项目就全部免了购买云服务器的成本！这次要做的事情是，把 Django 框架的 Python 项目也部署到 Vercel 上去！当然，并发量和流量都不能太大，免费版对这些都有不少限制，流量太大了搞不好会被 Vercel 封禁（之前看某乎评论有人反映项目被 Vercel 封禁），所以别部署太大的项目！另外，这个部署到 Vercel 是不能用数据库的，他们说是云端编译会出错。"
mathjax: true
permalink: /archivers/119
isrepublish: false
---

又是一个国内没有资料的操作。这个要是实现了，那些不太大的 Python 项目就全部免了购买云服务器的成本！这次要做的事情是，把 Django 框架的 Python 项目也部署到 Vercel 上去！当然，并发量和流量都不能太大，免费版对这些都有不少限制，流量太大了搞不好会被 Vercel 封禁（之前看某乎评论有人反映项目被 Vercel 封禁），所以别部署太大的项目！另外，这个部署到 Vercel 是不能用数据库的，他们说是云端编译会出错。

1. 我们还是在 Replit 上创建项目。项目类型我们选择 Django App Template 而不是 Python，也省点事。然后把 urls 和 views 都写好。写好了以后就开始着手配置 Vercel！下列步骤的 2、3、4、5 可以不分先后顺序。

2. 首先，我们还是把 Vercel 的控制台端整来。直接切换到 Shell，保证在项目目录，然后执行 

```bash
npm install vercel
```

3. 然后配置项目的依赖。打开 ```pyproject.toml```，看一下 ```tool.poetry.dependencies``` 里面都有什么。然后按照 Python 的依赖格式，在项目目录撰写依赖清单文件 ```requirements.txt```。

```
django==3.0
```

4. 配置 Vercel 的配置文件。按照 Replit 的模板来配置这个配置文件。在项目目录撰写 Vercel 配置文件 ```vercel.json```。如果没有修改 App 名字的话他默认就是 ```mysite```，这样的话就可以直接使用下面的文件。

```json
{
    "builds": [{
        "src": "mysite/wsgi.py",
        "use": "@ardnt/vercel-python-wsgi",
        "config": { "maxLambdaSize": "15mb" }
    }],
    "routes": [
        {
            "src": "/(.*)",
            "dest": "mysite/wsgi.py"
        }
    ]
}
```
5. 把 ```mysite/settings.py``` 做一下修改。数据库那个不能要。

```python
DATABASES = {}
```

6. 然后就可以往 Vercel 部署了。切换到 Shell，确保是在项目目录，然后执行

```bash
./node_modules/.bin/vercel login
```

根据情况选择登录方式并登录。没有账号的需要注册账号。注册过程可以参考之前的文章[《尽可能简单的搭建Hexo博客并部署到Vercel》](90.html)。

7. 登录上去以后执行

```bash
./node_modules/.bin/vercel --prod
```

还是和刚才提及的那篇文章一样，回答他提出的问题。然后看一看最终完成后输出的访问地址，看看能不能访问了。

![](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/591f2a79901b4a8fba6063088a534329.png)