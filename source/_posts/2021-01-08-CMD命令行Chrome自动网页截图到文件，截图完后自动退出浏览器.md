---
layout: post
title: "CMD命令行Chrome自动网页截图到文件，截图完后自动退出浏览器"
date: 2021-01-08 12:00:00
categories: 
 - [Automation]
excerpt: "https://github.com/search?l=&q=filename%3Apepflashplayer.dll&type=code，点开看一下分支名字，看下有没有Releases，如果有的话访问https://cdn.jsdelivr.net/gh/用户名或组织名/仓库名@分支名/路径/pepflashplayer.dll就可以下载了。如果有需要manifest.json的话试着把最后的文件名改成这个，可能会报“Couldn't find the requested file”。如果报的话就再换一个搜索结果看看。"
permalink: /archivers/59
---

英文内容来自：[![Eric Bidelman-Getting Started with Headless Chrome](https://img.shields.io/badge/Eric%20Bidelman-Getting%20Started%20with%20Headless%20Chrome-brightgreen)](https://developers.google.com/web/updates/2017/04/headless-chrome?hl=en#screenshots)

# Taking screenshots 截图
To capture a screenshot of a page, use the ```--screenshot```flag:
要对页面截图，只需使用```--screenshot```参数即可：

```bash
chrome --headless --disable-gpu --screenshot https://www.baidu.com/

# Size of a standard letterhead. 标准的信件比例
chrome --headless --disable-gpu --screenshot --window-size=1280,1696 https://www.baidu.com/

# Nexus 5x
chrome --headless --disable-gpu --screenshot --window-size=412,732 https://www.baidu.com/
```
Running with ```--screenshot```will produce a file named ```screenshot.png```in the current working directory. If you're looking for full page screenshots, things are a tad more involved. There's a great blog post from David Schnurr that has you covered. Check out [Using headless Chrome as an automated screenshot tool](https://medium.com/@dschnr/using-headless-chrome-as-an-automated-screenshot-tool-4b07dffba79a).
使用```--screenshot```参数会在当前目录生成一个名为```screenshot.png```的文件（编注：截图完成后浏览器会自动退出）。如果需要对整个页面截图的话还需要再加点东西。这里有一个David Schnurr写的博文[《使用无界面Chrome作为自动截图工具》](https://medium.com/@dschnr/using-headless-chrome-as-an-automated-screenshot-tool-4b07dffba79a)可以参考一下。

---

编注：把鄙人之前那篇文章 [提供一个在Selenium截网页长图的实现](https://blog.csdn.net/qq_35977139/article/details/111552903) 稍微改动一下就可以了，之前那篇文章是接入现有浏览器，只需要改成无界面模式（headless）并且改成启动新的浏览器（```chrome_options```里面不设置```debugger_address```），网页截图完成后加一个```driver.quit()```就可以自动关闭浏览器。

```python
from selenium import webdriver
from time import sleep
from base64 import b64decode
from sys import argv

# 改成启动新的浏览器，使用headless无界面浏览器模式
options = webdriver.ChromeOptions() 
# 增加无界面选项
chrome_options.add_argument('--headless') 
# 如果不加这个选项，有时定位会出现问题
chrome_options.add_argument('--disable-gpu') 
# 启动浏览器
driver = webdriver.Chrome(options=options)

# 访问页面，这里可以改成获取启动参数 argv[1]
driver.get("https://www.baidu.com")

# 取出页面的宽度和高度
page_width = driver.execute_script("return document.body.scrollWidth")
page_height = driver.execute_script("return document.body.scrollHeight")

# 直接开启设备模拟，不要再手动开devtools了，否则截图截的是devtools的界面！
driver.execute_cdp_cmd('Emulation.setDeviceMetricsOverride', {'mobile':False, 'width':page_width, 'height':page_height, 'deviceScaleFactor': 1})

# 执行截图
res = driver.execute_cdp_cmd('Page.captureScreenshot', { 'fromSurface': True})

# 返回的base64内容写入PNG文件
with open('screenshot.png', 'wb') as f:
    img = b64decode(res['data'])
    f.write(img)

# 等待截图完成
sleep(15)

# 关闭设备模拟
driver.execute_cdp_cmd('Emulation.clearDeviceMetricsOverride', {})

# 关闭浏览器
driver.quit()
```