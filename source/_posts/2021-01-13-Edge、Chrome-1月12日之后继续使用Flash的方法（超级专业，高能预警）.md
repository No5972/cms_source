---
layout: post
title: "Edge、Chrome 1月12日之后继续使用Flash的方法（超级专业，高能预警）"
date: 2021-01-13 02:00:00
categories: Moving-Away-from-Flash
excerpt: "先别管那么多，根据计算机常识，数据通常是小端存储，二进制的最高位通常是符号位。我们就把这一串的最后那个字节42想个什么办法改大一点，但是也不要超过80，不然可能就变成负数了。所以我们就暂且先把他改成72。保存之，替换到Edge的原来文件。再打开一个Flash的网页，可以加载Flash了！"
permalink: /archivers/63
---

贴吧赛尔号吧一个大佬提供了一个线索：[在Flash组件文件的二进制数据里面有明文存储Flash自毁定时器的时间戳。](https://tieba.baidu.com/p/7189040657?fid=2173925&pid=137447324456#137447324456)鄙人厚着脸皮找这个大佬问到了这个时间戳在文件里面的16进制数据：```00 00 40 46 3E 6F 77 42```。

注意，修改之前请先这个文件备好份，万一改错了还能还原！

因为1月21日更新之后Edge就不再支持Flash了，改好之后的文件和附带的那个```manifest.json```最好也备个份，到时候可以拷贝到别的浏览器里面继续使用！

我们用WinHex打开Edge浏览器里面的```pepflashplayer.dll```，搜索，查找十六进制数值，把刚才那个十六进制码输入进去（不要空格）。果不其然，在PPAPI的DLL里面也发现了这个十六进制码！![在这里插入图片描述](https://img-blog.csdnimg.cn/20210113015442928.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM1OTc3MTM5,size_16,color_FFFFFF,t_70#pic_center)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210113015704386.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM1OTc3MTM5,size_16,color_FFFFFF,t_70#pic_center)


目前Edge浏览器的Flash版本是32.0.0.465。在版本32.0.0.465的PPAPI的DLL里面，这个时间戳的位置是```015F6C68```。

先别管那么多，根据计算机常识，数据通常是小端存储，二进制的最高位通常是符号位。我们就把这一串的最后那个字节```42```想个什么办法改大一点，但是也不要超过```80```，不然可能就变成负数了。所以我们就暂且先把他改成```72```。保存之，替换到Edge的原来文件。![在这里插入图片描述](https://img-blog.csdnimg.cn/2021011301592869.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM1OTc3MTM5,size_16,color_FFFFFF,t_70#pic_center)


再打开一个Flash的网页，可以加载Flash了！![在这里插入图片描述](https://img-blog.csdnimg.cn/20210113015344268.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM1OTc3MTM5,size_16,color_FFFFFF,t_70#pic_center)
