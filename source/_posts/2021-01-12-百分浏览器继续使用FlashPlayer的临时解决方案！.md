---
layout: post
title: "百分浏览器继续使用Flash Player的临时解决方案！"
date: 2021-01-12 09:45:00
categories: Moving-Away-from-Flash
excerpt: "百分浏览器会自动下载版本32的Flash Player放进浏览器的安装目录，这样的话即使是手动替换了Flash Player组件文件也会被新版的Flash Player覆盖掉，而新版Flash Player今天已经自毁了，无法使用！ 所以我们得想办法阻止覆盖！"
permalink: /archivers/62
---

**21.01.13更新：百分浏览器已经将自动下载的Flash改成了下载32.0.0.371的版本，据浏览器论坛超版回应，这个是最后一个没加定时自毁的版本。大家可以不用替换文件和屏蔽域名了。**

---

百分浏览器会自动下载版本32的Flash Player放进浏览器的安装目录，这样的话即使是手动替换了Flash Player组件文件也会被新版的Flash Player覆盖掉，**而新版Flash Player今天已经自毁了，无法使用！** 所以我们得想办法阻止覆盖！

没有这个浏览器的用户如果要使用这个浏览器，应该下载32位便携版的百分浏览器。

已经猜测出浏览器自动下载Flash Player的域名：```static.centbrowser.cn```。

大家需要手动将29版本的Flash Player组件文件放进浏览器的```User Data\PepperFlash```目录！如果有原来的文件则需要覆盖！通常是两个文件：```pepflashplayer.dll```和```manifest.json```。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210112094602630.png#pic_center)
然后在运行之前从hosts屏蔽这个域名！

打开```C:\Windows\System32\drivers\etc\hosts```这个文件，添加一行这样的内容以屏蔽这个域名。注意IP和域名之间有一个空格。

```
127.0.0.1 static.centbrowser.cn
```

{% note warning %}
但是这样的话就不能再从官网重新下载浏览器了，官网这个下载链接也是来自这个域名的。如果需要从官网重新下载浏览器， 则需要将hosts的这个域名解除屏蔽。
{% endnote %}
