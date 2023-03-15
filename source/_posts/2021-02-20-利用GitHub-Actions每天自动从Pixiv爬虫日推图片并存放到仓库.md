---
layout: post
title: "利用GitHub Actions每天自动从Pixiv爬虫日推图片并存放到仓库"
date: 2021-02-20 15:15:00
categories: 
 - [Github]
 - [Automation]
excerpt: "很快联想到GitHub的Actions，如果能把这个爬虫部署到GitHub Actions上，就可以每天自动跑了，还能直接就把图片放到仓库上，直接拿美国GitHub的服务器来跑，也不用考虑网络连接的问题了。但是这个配置Actions的过程还是稍微有点复杂的，要分两个分支，一个用来展示代码，另一个用来存放爬取的图片。"
mathjax: true
permalink: /archivers/73
---

近期注意到有很多使用Python语言编写的爬虫，用来获取Pixiv日推的图片。这里也找了一个大佬开发的这个爬虫：[https://blog.csdn.net/weixin_45826022/article/details/109406389 ](https://blog.csdn.net/weixin_45826022/article/details/109406389)，今天拿来放到Repl.it上跑了一下，效果还不错。

很快联想到GitHub的Actions，如果能把这个爬虫部署到GitHub Actions上，就可以每天自动跑了，还能直接就把图片放到仓库上，直接拿美国GitHub的服务器来跑，也不用考虑网络连接的问题了。但是这个配置Actions的过程还是稍微有点复杂的，要分两个分支，一个用来展示代码，另一个用来存放爬取的图片。

创建仓库以后，先创建一个分支，专门用来存放爬取的图片，这里假定命名为```runner```。然后在```main```分支把这个大佬写的爬虫文件添加，代码就不放了，就在开头那个链接里面的最后面，假定这里命名为```pa.py```。当然，受限于GitHub，当然不能像原文一样一下子搞500张图，这样对谁都不好，建议只取50张图为要。所以第32行
```python
for n in range(1, 10 + 1):
```
应该改成
```python
for n in range(1, 2):
```
当然，考虑到各位画师的辛苦工作，起码把作品的ID也带过来吧，也是对各位画师的一个尊重。所以，从第18行
```python
name = name.group(1)
```
后面继续添加语句（第一行还是原来的）：
```python
name = name.group(1)
illust_id = re.search('"illustId":"(.+?)"', response.text)
illust_id = illust_id.group(1)
```
原来的第28行
```python
f = open(path + '%s.%s' % (name, picture.group(1)[-3:]), 'wb')
```
改成
```python
f = open(path + '%s_%s.%s' % (illust_id, name, picture.group(1)[-3:]), 'wb')
```
将这个```pa.py```文件在```runner```分支也添加。

还是在```main```分支，创建```.github/workflows/xxx.yml```，随便起名一个YML文件。配置如下内容。注意把```with: ref: ```配置要放图片的单独分支，```user.name```配置GitHub账号用户名，```user.email```配置GitHub登录邮箱，```git push -u origin runner```也配置成要放图片的单独分支。
```yaml
name: "Pixiv Crawler"

on:
  schedule:
    - cron: '0 6 * * *'  
  push:
  
env:
  ACTIONS_ALLOW_UNSECURE_COMMANDS: true

jobs:
  job_1:
    name: Python Crawler
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
      with:
        ref: runner # 改成存放图片的分支
    - name: Clear Previous
      run: |
        rm -f -- *.jpg
        rm -f -- *.png
    - name: Setup Python environment
      uses: actions/setup-python@v1.1.1 
    - name: Install Dependence
      run: pip install requests
    - name: Run pa.py
      run: python pa.py
    - name: list
      run: ls
    - name: Upload to this repo
      run: |
        git config --global user.name "No5972" # 改成Github账号用户名
        git config --global user.email "wujiuqier@foxmail.com" # 改成GitHub账号的邮箱
        git add "*.jpg" "*.png" && echo "Git Added" # 参考: https://stackoverflow.com/questions/25083290/git-add-error-unknown-switch
        git commit -m 'upload pa result' && echo "Git Committed"
        git push -u origin runner && echo "Git Pushed Origin" # runner改成存放图片的分支
    - name: Failure test
      if: failure()
      run: | 
        ls
        echo "Error on running!"
```
这样配置好以后，每天下午两点，或者只要```main```分支有提交的内容，GitHub就会自动爬取一次Pixiv日推并存放到放置图片的分支去。之后就可以前往该分支查看了。那个CRON表达式也可以根据需要修改成其他的定时。![在这里插入图片描述](https://pic1.xuehuaimg.com/proxy/https://img-blog.csdnimg.cn/20210221224507720.png)


代码可以前往 [https://github.com/No5972/pixiv-github-action](https://github.com/No5972/pixiv-github-action) 进行参考。