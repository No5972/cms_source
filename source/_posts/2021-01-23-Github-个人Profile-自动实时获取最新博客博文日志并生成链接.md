---
layout: post
title: "Github 个人Profile 自动实时获取最新博客博文日志并生成链接"
date: 2021-01-23 11:30:00
categories: 
 - [Github]
 - [Automation]
excerpt: "很多文章详细阐述了个性化个人Profile说明的方法，却鲜有提到如何实时更新最新博客博文并生成链接的方法。其实不需要本地配置任何东西，只需要在仓库加上特定的文件，Github就会自动读取这个文件并转换成相应的动作（Action）。"
permalink: /archivers/66
---

很多文章详细阐述了个性化个人Profile说明的方法，却鲜有提到如何实时更新最新博客博文并生成链接的方法。
其实不需要本地配置任何东西，只需要在仓库加上特定的文件，Github就会自动读取这个文件并转换成相应的动作（Action）。
方法参考自[GitHub Profile README Generator - Dynamic Latest Blog Posts](https://rahuldkjain.github.io/gh-profile-readme-generator/addons)
首先配置好博客网站的订阅，以RSS格式或者Atom格式输出，要能从互联网HTTP方式或HTTPS方式访问得到。
在个人说明仓库（和用户名同名）添加```.github```目录，再从```.github```目录添加```workflows```目录，再从```.github/workflows```目录添加```blog-post-workflow.yml```这个文件。
文件内容如下：
```yaml
name: Latest blog post workflow
on:
  schedule:
    # 每个小时自动获取一次
    - cron: "0 * * * *"
jobs:
  update-readme-with-blog:
    name: Update this repo's README with latest blog posts
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: gautamkrishnar/blog-post-workflow@master
        with:
          max_post_count: "5" # 获取几条链接
          feed_list: "https://no5972.moe/cms/feed.xml" # 改成博客订阅的地址，以RSS格式或者Atom格式输出的
```

编辑自己的说明文件```README.md```，在需要生成链接的地方添加如下内容。
```markdown
<!-- BLOG-POST-LIST:START -->
<!-- BLOG-POST-LIST:END -->
```
过几个小时再看看自己的Profile页面，看看相应内容是不是已经出现了博文的链接？
![在这里插入图片描述](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/20210123111754169.png)
