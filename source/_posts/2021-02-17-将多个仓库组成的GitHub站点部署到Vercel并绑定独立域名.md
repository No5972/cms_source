---
layout: post
title: "将多个仓库组成的GitHub站点部署到Vercel并绑定独立域名"
date: 2021-02-17 03:00:00
categories: 
 - [Web Building]
 - [Github]
excerpt: "鄙人这个站点主页是一个仓库，而博客又是一个仓库。但是直接使用GitHub访问速度很慢，即使是电信网有时候也得半分钟以上，移动联通就更难说了。如果能使用Vercel作为镜像来访问就能快不少，但是Vercel目前还没有发展到能把多个仓库部署到同一个项目的不同目录下，所以这里又要劳驾GitHub Actions了。"
mathjax: true
permalink: /archivers/71
---

鄙人这个站点主页是一个仓库，而博客又是一个仓库。但是直接使用GitHub访问速度很慢，即使是电信网有时候也得半分钟以上，移动联通就更难说了。如果能使用Vercel作为镜像来访问就能快不少，但是Vercel目前还没有发展到能把多个仓库部署到同一个项目的不同目录下，所以这里又要劳驾GitHub Actions了。

# 配置提交时自动拷贝到另一个仓库

GitHub有一个可以在不同仓库之间拷贝文件或目录的动作：[Copycat](https://github.com/andstor/copycat-action)。我们通过这个动作把各个非主页仓库的所有文件拷贝到主页仓库中对应的子文件夹下。

把非主页仓库按照这个动作的说明书添加```.github/workflows/xxx.yml```文件（```xxx.yml```文件名可以随便起，后缀保证是```.yml```就行）。如果是Hexo生成的博客，则应参考此前的文章[《Hexo Gitee Pages 自动部署站点》](70.html)来进行特别配置。

```yaml
name: Copy
on: push
jobs:
  copy:
    runs-on: ubuntu-latest
    steps:
    - name: Copycat
      uses: andstor/copycat-action@v3
      with:
        personal_token: ${{ secrets.PERSONAL_TOKEN }}
        src_path: 改成来源仓库的要拷贝的路径，根目录则填/.
        dst_path: 改成目标仓库的拷贝位置，以斜杠结尾。这里需要填写斜杠非主页仓库名斜杠
        dst_owner: 改成目标仓库所在的用户名
        dst_repo_name: 改成目标仓库名（也就是用户名点github点io）
        dst_branch: 改成目标仓库的分支名
        src_branch: 改成来源仓库的分支名
        clean: true # 这里要保证目标目录先清空，否则非主页仓库若有删除文件就不会同步到主页仓库
        username: 改成操作的用户名
        email: 改成操作用户的邮箱
```

前往GitHub网站，进入账号设置，Developer Settings，Personal access tokens，然后点击Generate new token。Note处随便起个名字，Select scopes里面把Repo勾选。点击最下边的Generate token。把显示出来的令牌复制出来，这个只会显示一次，之后将永远不再显示， 所以需要暂时先复制出来。

![](https://img-blog.csdnimg.cn/2021021809573984.png)

![](https://img-blog.csdnimg.cn/20210218095738971.png)

![](https://img-blog.csdnimg.cn/2021021809573951.png)

在非主页仓库后台设置的Settings里面打开Secrets，添加一个密钥```PERSONAL_TOKEN```，取值就是刚才复制的令牌，注意不要带空格。

![](https://img-blog.csdnimg.cn/20210218100015625.png)

![](https://img-blog.csdnimg.cn/20210218100015582.png)

这样就可以在提交此非主页仓库时自动把此仓库所有文件拷贝到主页仓库下了。

---

# 部署到Vercel并绑定独立域名

参考其他的博文配置好Vercel和GitHub的链接（包括绑定账号和Github的安装Vercel）。

在Vercel的主页点击右上方的New Project，在左边Import Git Repository里面搜索找到主页仓库用户名点github点io那个。点击右边Import。然后找到绑定的账号点击右边的Select。然后直接点击Continue。下一步直接点击Deploy。

进入这个项目，选择Settings，Domains，添加之前注册的独立域名。添加以后这时候Vercel的界面会提示你需要添加域名的解析。到这个域名解析的后台，添加一个类型为```A```，主机记录为```@```的解析记录，如果之前有这个记录则直接修改。记录值按照Vercel的界面提示填写```76.76.21.21```。其他选项保持默认即可。

![](https://img-blog.csdnimg.cn/20210218100218514.png)

稍等片刻，再访问这个域名，即可以更快的速度显示页面了。
