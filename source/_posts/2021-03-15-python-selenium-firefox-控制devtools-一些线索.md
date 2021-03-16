---
layout: post
title: "Python Selenium Firefox 控制Devtools 一些线索"
date: 2021-03-15 09:00:00
categories: Python
excerpt: "版本55或以上的Firefox不支持Flash自动播放。建议使用Firefox 52.9.0 延长支持版。此版本需要使用Gecko Driver 0.17.0才能正常使用。但是不支持 set_window_size（会报错selenium.common.exceptions.WebDriverException: Message: setWindowRect），所以必须手动调整视口尺寸。"
mathjax: true
permalink: /archivers/79
---

版本55或以上的Firefox不支持Flash自动播放。
建议使用[Firefox 52.9.0 延长支持版](http://ftp.mozilla.org/pub/firefox/releases/52.9.0esr/win64/zh-CN/)。
此版本需要使用[Gecko Driver 0.17.0](https://npm.taobao.org/mirrors/geckodriver/v0.17.0/)才能正常使用。但是不支持 ```set_window_size```（会报错```selenium.common.exceptions.WebDriverException: Message: setWindowRect```），所以必须手动调整视口尺寸。
自动播放Flash的设置（参考[https://blog.csdn.net/STL_CC/article/details/104968669](https://blog.csdn.net/STL_CC/article/details/104968669)）：
```python
fp = webdriver.FirefoxProfile()
fp.set_preference("plugin.state.flash", 2)
fp.set_preference("security.insecure_field_warning.contextual.enabled", False)
driver = webdriver.Firefox(firefox_profile = fp)
```
此版本还没有移除GCLI开发者工具栏，可以通过快捷键 ```Shift + F2```呼出。
调整视口尺寸的GCLI命令是```resize to 4320 7680```。第一个参数是宽，第二个参数是高。
截图的命令是
```python
driver.get_screenshot_as_file('baidu.png')
```
综上，截取小花仙人物面板形象的操作有：
```python
from selenium import webdriver
fp = webdriver.FirefoxProfile()
fp.set_preference("plugin.state.flash", 2)
fp.set_preference("security.insecure_field_warning.contextual.enabled", False)
driver = webdriver.Firefox(firefox_profile = fp)
driver.get("http://hua.61.com/play.shtml")
driver.execute_script("document.getElementById('flashContent').innerHTML=\"<embed src='http://hua.61.com/Client.swf' width='100%' height='100%'></embed>\"")
# 切换到浏览器，按 Shift + F2 呼出开发者工具栏，然后输入resize to 4320 7680回车
driver.execute_script("document.getElementsByTagName('embed')[0].Zoom(500)")
driver.execute_script('document.getElementsByTagName("embed")[0].Zoom(20)')
# Flash缩放后的视野位置微调，还需要完善
driver.execute_script('document.getElementsByTagName("embed")[0].Pan(-4500,-2000,0)') 
driver.get_screenshot_as_file('D:\\output.png')
# 切换到浏览器，在开发者工具栏执行resize off
```