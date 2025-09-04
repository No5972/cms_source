---
layout: post
title: "仅作笔记用：GPT4All 本地部署 DeepSeek R1 模型，简明说明（手动下载模型）"
date: 2025-02-17 16:00:00
categories: 
  - [AIGC]
excerpt: "GPT4All 内置的模型库，大部分模型是用的抱脸的网址，通常无法直连下载。 我们这里提出一个手动下载和导入 DeepSeek R1 模型的本地部署方法。本方法的关键是找到 GPT4All 默认的读取路径。 此外，GPT4All 不仅支持独显推理，也可使用 CPU 硬算。"
mathjax: true
permalink: /archivers/167
isrepublish: false
---

GPT4All 内置的模型库，大部分模型是用的抱脸的网址，通常无法直连下载。 **我们这里提出一个手动下载和导入 DeepSeek R1 模型的本地部署方法。本方法的关键是找到 GPT4All 默认的读取路径。** 此外，GPT4All 不仅支持独显推理，也可使用 CPU 硬算。 *（不过听别处文章评论区说个别模型用独显是不行的，这个这边也没法证实，鄙人手头暂时没有能跑 AI 的独显；个人猜想 DeepSeek R1 应该不会存在这个问题）* 

1. [下载安装 GPT4All 3.8.0 或以上的版本](https://www.nomic.ai/gpt4all)
    - 该版本开始已原生支持 DeepSeek R1 深度推理
    - 大约需要下载 600 多 MB 的本体包
![](https://pic1.zhimg.com/v2-774c98158cf16894663f6730aa168dcc_r.png)

2. 从[抱脸](https://huggingface.co/models?search=deepseek%20gguf)或[魔搭社区](https://www.modelscope.cn/search?search=deepseek%20gguf)下载 gguf 格式的 DeepSeek R1 模型。
    - 这边 12GB 内存 CPU 硬算可以跑 llama8B 和 Qwen7B 这两个模型。
    - 请留意找到正确的模型
![](https://picx.zhimg.com/v2-5736c083a875fc93701225b4abcd9b2f_r.png)

3. 将下载好的 gguf 格式的模型文件放在 ```%LOCALAPPDATA%\nomic.ai\GPT4All``` 目录
    - GPT4All 在运行时将自动识别该目录下的模型文件。
![](https://picx.zhimg.com/v2-07c3fd8a95d1ad99755c19034f361ebf_r.png)

4. 打开 GPT4All，从左侧按钮切换到模型界面，看看是否识别到了 DeepSeek
    - 首次启动时可能会弹出“匿名使用分析，以改进 GPT4All”和“匿名分享聊天到 GPT4All 数据湖”这两个选项，如果在意数据安全的话应都选择“否”。此项可在设置的“开启数据湖”中找到。
![](https://picx.zhimg.com/v2-caf462bd85d51de9365b5f2ef1d6df07_r.png)


6. 如果识别到了，左侧切换到对话，选择下载的 DeepSeek R1 模型，等待加载完毕。然后就可以开始对话了。
    - 这边测试使用 i3-6100 CPU 硬算，大概是 2.4 令牌左右每秒。
![](https://pica.zhimg.com/v2-86f2b382014ca51e0b79429f80483008_r.png)
![](https://picx.zhimg.com/v2-9063342ea6cd23c83d2d90499655100b_r.png)
![](https://pic1.zhimg.com/v2-3e78cafe3c953a3003d3993733cad688_r.png)
![](https://pica.zhimg.com/v2-957228f710cba37cf5dfe205cc7b345e_r.png)