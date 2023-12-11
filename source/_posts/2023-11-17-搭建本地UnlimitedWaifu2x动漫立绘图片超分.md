---
layout: post
title: "搭建本地 Unlimited Waifu2x 动漫立绘图片超分"
date: 2023-11-17 00:00:00
categories: 
  - [Webapp]
excerpt: "Waifu2x 是一个图片超分的网站，某些图片鄙人经对比发现效果比 Stable Diffusion 的附加功能要好。而 Waifu2x 后续上线的 Unlimited Waifu2x 不仅支持 4 倍超分，而且是使用电脑本地的 CPU/GPU 运行的，也就是通过 WASM 的方式运行的。但是直接访问 Unlimited Waifu2x 的话，模型和 JS 都是从网络上加载的，速度很慢。这里决定在本地搭建一个 Unlimited Waifu2x，这样就不用每次都从网络上加载了，所有资源都是在本地加载。"
mathjax: true
permalink: /archivers/155
isrepublish: false
---

近期注意到因误操作将屏幕缩放设置为 500% 后无法还原的情况，因为网上有人提出此问题，而其他人尝试复现时也无法解决了，这里给出一种可能的解决办法。

**因为不同人的分辨率是不一样的，有些电脑分辨率设置的不高，如果低于 900P 的话有可能界面是显示不完整的，此时无法使用鼠标操作，所以还是要全程使用键盘。**

Win11 系统下按 Win + I 键打开设置。等待出现窗口界面，然后按回车键展开菜单，按一下 Tab 键将焦点定位到搜索框，输入 scale，然后按“下方向键”，再按回车键。在这里按 9 次 Tab 键，将焦点框框住“关闭自定义缩放并注销”然后按回车键。重新登录即可恢复原始的 100% 缩放。

按键顺序是 Win + I，等待出现设置窗口界面，Enter，Tab，s，c，a，l，e，下方向键，Enter，Tab，Tab，Tab，Tab，Tab，Tab，Tab，Tab，Tab，Enter，然后重新登录。

此法适用于 Windows 11 23H2 版本。

---

Win10 系统下按 Win + I 键打开设置。等待出现窗口界面，然后直接输入 scale，按两次“下方向键”，再按回车键。在这里按 4 次 Tab 键，将焦点框框住“关闭自定义缩放并注销”然后按回车键。重新登录即可恢复原始的 100% 缩放。

按键顺序是 Win + I，等待出现设置窗口界面，s，c，a，l，e，下方向键，下方向键，Enter，Tab，Tab，Tab，Tab，Enter，然后重新登录。

此法适用于 Windows 10 19045.3693 版本。

没有这样设置缩放的电脑就不要轻易这样尝试了，毕竟这影响电脑使用。