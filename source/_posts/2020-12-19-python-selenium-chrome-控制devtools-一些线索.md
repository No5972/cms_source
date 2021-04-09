---
layout: post
title: "Python Selenium Chrome 控制Devtools 一些线索"
date: 2020-12-19 11:00:00
categories: 
 - [Python]
 - [Automation]
excerpt: "只要浏览器的内核版本不低于webdriver的版本即可。Nuget上的最低版本是71的，所以QQ浏览器无法使用C#控制，QQ只有版本70的内核。"
permalink: /archivers/54
---

1. Chrome WebDriver下载地址：[http://chromedriver.storage.googleapis.com/index.html](http://chromedriver.storage.googleapis.com/index.html)
  ~~注意和国产浏览器的内核版本对应（星愿浏览器80.0.3987.163内核可以使用80.0.3987.106的webdriver）~~
  只要浏览器的内核版本不低于WebDriver的版本即可。Nuget上的最低版本是71的，所以QQ浏览器无法使用C#控制，QQ只有版本70的内核。
2. 如果要先开浏览器再用Selenium控制的话，需要给浏览器添加启动参数：
```bash
twinkstar.exe --remote-debugging-port=9222
```
3. Python调用现有星愿浏览器的初始化
```python
from selenium import webdriver
options = webdriver.ChromeOptions()
options.debugger_address = "127.0.0.1:9222"
driver = webdriver.Chrome(options=options)
```
4. 使用Devtools内建的截图功能！（内核59开始支持，详见[https://developers.google.com/web/updates/2017/04/devtools-release-notes](https://developers.google.com/web/updates/2017/04/devtools-release-notes)）
```python
import base64
res = driver.execute_cdp_cmd('Page.captureScreenshot', {})
 
with open('hao123.png', 'wb') as f:
    img = base64.b64decode(res['data'])
    f.write(img)
```
5. Flash缩放的JS原生方法是```Zoom(percentage)```，其中```percentage```是放大倍率的倒数乘以100，例如放大4倍就是1/4*100=25。
6. Flash缩放之后，移动视野的JS原生方法是```Pan(x_position,y_position,mode)```。
  - ```x_position```参数是移动横坐标数，可以给负值
  - ```y_position```参数是移动纵坐标数，可以给负值
  - ```mode```~~参数暂时不清楚，先填1~~ 表示表示坐标的单位，但其值为“0”时,以象数为单位，为“1”时，以百分比为单位。

7. 设置模拟设备的CDP命令是
```js
'Emulation.setDeviceMetricsOverride', {
  mobile: true,
  width: 412,
  height: 732,
  deviceScaleFactor: 2.625,
}
```

8. Python Selenium指定截取区域的命令是
```python
clip = driver.execute_script('return {x: 0, y: 0, width: 4320, height: 7680, scale: 1};', '') # 模拟的是竖屏
res = driver.execute_cdp_cmd('Page.captureScreenshot', {'clip': clip})
```

9. 综上，Python需要执行的操作有（截小花仙页游选人界面的高清图（正中间那个））
```python 
from selenium import webdriver
import base64

# 接入既有的浏览器进程
options = webdriver.ChromeOptions()
options.debugger_address = "127.0.0.1:9222"
driver = webdriver.Chrome(options=options)

# 直接开启设备模拟，不要再手动开devtools了，否则截图截的是devtools的界面！
driver.execute_cdp_cmd('Emulation.setDeviceMetricsOverride', {'mobile':False, 'width':4320, 'height':7680, 'deviceScaleFactor': 1})
# 缩放Flash
driver.execute_script('document.getElementsByTagName("embed")[0].Zoom(100)')
driver.execute_script('document.getElementsByTagName("embed")[0].Zoom(25)')
# Flash缩放后的视野位置微调，还需要完善
driver.execute_script('document.getElementsByTagName("embed")[0].Pan(0,-300,0)') 
# 执行截图
res = driver.execute_cdp_cmd('Page.captureScreenshot', { 'fromSurface': True})
# 返回的base64内容写入PNG文件
with open('hao123.png', 'wb') as f:
    img = base64.b64decode(res['data'])
    f.write(img)

# 关闭设备模拟
driver.execute_cdp_cmd('Emulation.clearDeviceMetricsOverride', {})
# Flash缩放复原
driver.execute_script('document.getElementsByTagName("embed")[0].Zoom(500)')
```
