---
layout: post
title:  "Github Hexo 一键更新"
date:   2020-07-18 01:00:00
categories: 
 - [Web Building]
 - [Github]
excerpt: 这个博客换成Hexo后台之后变成了绑定3个仓库：展示仓库，后台仓库，主题仓库。结果每次更新需要输入3个密码，很不方便。整合各路搜集到的资料之后总结出来一套一键更新的方案，可以一次性同步后台代码、主题代码和展示代码。
permalink: /archivers/16
---

这个博客换成Hexo后台之后变成了绑定3个仓库：展示仓库，后台仓库，主题仓库。结果每次更新需要输入3对账号密码，很不方便。整合各路搜集到的资料之后总结出来一套一键更新的方案，可以一次性同步后台代码、主题代码和展示代码。

1. 原来那个Next主题代码显然是已经不能再直接用了，即使是把后台代码单独拿出来建仓库，主题代码还是不能用自己修改的那个。把这个位于```themes\next```目录的主题代码单独拿出来，原来主题代码的目录建一个github仓库！然后把拿出来的主题代码拷回去！提交！

2. 按照网上现有的操作步骤设置账号全局的免密更新。现在据说github也有针对单个仓库的免密密钥，但是个人不建议在Hexo博客环境使用单个仓库密钥，毕竟更新一次要更新好几个仓库，不方便管理。<br>
这里再稍微重复一下。<br>
在Git Bash里面```cd ~; ssh-keygen -t rsa -C "你的邮箱地址"```，然后全部回车默认设置。<br>
继续执行``` cd ~; cd .ssh; cat id_rsa.pub```，把从```ssh-rsa```开头一直到段落结尾复制。<br>
在网页打开Github，账号Settings里面SSH and GPG Keys，New SSH Key，名字随便输入，下边的文本域粘贴刚才复制的pub内容。

3. 这边设置好以后试一下git push origin发现还是要输入密码。之后查阅资料发现方式不对，最开始git clone的时候用的是 ```https://github.com/用户名/仓库名``` 的方式。这叫HTTPS方式，但是上文使用的是SSH方式，不是HTTPS方式。因此需要修改远程仓库地址格式，改成SSH的格式。<br>
进入仓库的```.git```目录，编辑里面的```config```文件。把里面的```url```从 ```https://github.com/用户名/仓库名``` 改成 ```git@github.com:用户名/仓库名``` 。<br>
3个仓库都要这么改！但是展示仓库的地址不在```config```文件，而是在后台仓库根目录的```_config.yml```文件。最下边有个```deploy```，把里面的```repo```改成 ```git@github.com:用户名/仓库名``` 。

4. 免密更新配置好以后，编写一键更新的CMD批处理放到项目根目录。
```bash
git add .
git pull origin master
git commit -m "update"
git push origin -u master
cd themes/next
git add .
git pull origin master
git commit -m "update"
git push origin -u master
cd ..
cd ..
hexo clean && hexo g && hexo d
```


5. 批处理搞定之后以后可以在编辑了主题代码、后台代码之后在后台仓库根目录直接执行```./保存的CMD文件名.cmd```即可实现一条命令将展示仓库，后台仓库，主题仓库一并更新。