---
layout: post
title: "UOS 移植 Flash Player 页游微端"
date: 2022-07-25 10:30:00
categories: 
  - [AtoW]
excerpt: "目前大家可能仍有需要用到 Flash Player 的情况。这里尝试先将部分页游的微端移植到 UOS 上来。鄙人尽最大可能降低操作的复杂度，不会像那篇《GNASH 移植》那样那么复杂！"
mathjax: true
permalink: /archivers/129
isrepublish: false
---

目前大家可能仍有需要用到 Flash Player 的情况。这里尝试先将部分页游的微端移植到 UOS 上来。鄙人尽最大可能降低操作的复杂度，不会像那篇《GNASH 移植》那样那么复杂！

从 UOS 的应用商店下载 Electron，下载好以后从

```bash
/opt/apps/com.electron/files
```

目录里面把 ```electron```这个目录拷出来，放在一个自己找得到的地方。

回到 Windows，到小花仙官网下载 win8/win10 版本的微端。然后用 Universal Extractor 的 LessMSI Extraction 解压这个 MSI 文件。把里面的 ```Binary/resources/app```目录上载到 UOS 的刚才拷出来的 ```electron```目录里面。

在 UOS 里面，把 ```app/assets```里面的 ```hua.js```修改，第 126，127 行的

```js
case 'linux':
	pluginName = 'libpepflashplayer.so'
```

改成

```js
case 'linux':
	pluginName = 'libpepflashplayer.plugin'
```

之所以这么改，是因为米叔他那个上面的 SWFObject.js 不识别 Linux 系统下的 ```.so```的 Flash Player 组件文件，换一个扩展名才行。

![在这里插入图片描述](https://img-blog.csdnimg.cn/d09152098787499dad9f5ed1856a1862.png#pic_center)


从一切可以找得到的地方下载版本 31 的 Flash Player Linux PPAPI 64 位的版本。解压出来的文件名通常是 ```flash_player_ppapi_linux_x86_64.tar.gz```。再从这个 gz 里面提取出 ```libpepflashplayer.so```文件，放到刚才的 ```app/assets```目录，重命名为```libpepflashplayer.plugin```。

![在这里插入图片描述](https://img-blog.csdnimg.cn/c9ad9e776c3146bda859e1467c8c05aa.png#pic_center)


然后修改 hosts，屏蔽掉检测版本的域名。首次运行前务必屏蔽这些域名，否则就会出现“该版本过旧，不支持运行，请升级后使用”的提示，遇到这个提示的话修改起来很麻烦（具体修改参考后面的附注）。到 UOS 应用商店下载 SwitchHosts 并打开，打开 My Hosts，然后添加这些规则，然后点击开关来打开：

```
127.0.0.1 geo2.adobe.com
127.0.0.1 fpdownload2.macromedia.com
127.0.0.1 fpdownload.macromedia.com
127.0.0.1 macromedia.com
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/1ef904d0dc2b4397860b61a469f46dc2.png#pic_center)


在 ```electron```目录新建一个 ```.sh```的任意文件名的文件。添加这些内容：

```bash
./electron ./app
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/28e491801397442d8dc67b9277ad0bec.png#pic_center)

之后就可以通过双击此 sh 文件选择“运行”来使用了。

如果想换成赛尔号，则将 ```app/assets/```的 ```config.json```里面的 ```player_name```改成

```
https://seer.61.com/play.shtml?from=we_seer
```

即可。需要访问其他包含 Flash 内容的网页也可以改成任意网址。

---

## 附注：修复“该版本过旧，不支持运行，请升级后使用”

请删除 ```/data/home/你的用户名/.config/WeHua/Pepper Data```这个目录，然后参照前面的说明修改 hosts，如果已经添加了域名则忽略这个 hosts。

---

获取 UOS 家庭版欢迎前往 [https://home.uniontech.com](https://home.uniontech.com) 。