---
layout: post
title: "搭建本地 Unlimited Waifu2x 动漫立绘图片超分"
date: 2023-11-17 00:00:00
categories: 
  - [Webapp]
  - [PowerShell]
excerpt: "Waifu2x 是一个图片超分的网站，某些图片鄙人经对比发现效果比 Stable Diffusion 的附加功能要好。而 Waifu2x 后续上线的 Unlimited Waifu2x 不仅支持 4 倍超分，而且是使用电脑本地的 CPU/GPU 运行的，也就是通过 WASM 的方式运行的。但是直接访问 Unlimited Waifu2x 的话，模型和 JS 都是从网络上加载的，速度很慢。这里决定在本地搭建一个 Unlimited Waifu2x，这样就不用每次都从网络上加载了，所有资源都是在本地加载。"
mathjax: true
permalink: /archivers/155
isrepublish: false
---

Waifu2x 是一个图片超分的网站，某些图片鄙人经对比发现效果比 Stable Diffusion 的附加功能要好。而 Waifu2x 后续上线的 Unlimited Waifu2x 不仅支持 4 倍超分，而且是使用电脑本地的 CPU/GPU 运行的，也就是通过 WASM 的方式运行的。

但是直接访问 Unlimited Waifu2x 的话，模型和 JS 都是从网络上加载的，速度很慢。这里决定在本地搭建一个 Unlimited Waifu2x，这样就不用每次都从网络上加载了，所有资源都是在本地加载。这里稍微参考了一下 Waifu2x 的 GitHub 说明，但是发现说明里面说的要下载一个上百兆的压缩包，再次劝退。干脆直接从网站加载的网址把需要的最精简的 onnx 模型弄来。

从浏览器的 F12 开发者工具的网络找到原来网站加载的 onnx 的模型地址，将这几个 onnx 的模型先下载到本地，然后再把网站上的 HTML、JS、CSS 都 down 下来。然后按照他加载的路径整理成对应的文件结构。（具体文件结构看下面的代码片段）

这样再看一下站点的大小，只有不到 60MB。如果只想尝试某一种模型的话，甚至可以不用下载其余的超分模型，而只需要下载用的那一个模型，和其他的 util 模型就行，这样需要下载的文件还更少。

网站原来使用的 cdn.jsdelivr 速度也很慢，目前找到了一个 jsdelivr 的反代，可以很好的适用于本场景。把 index.html 里面 11 行的那个 jsdelivr 的网址域名换成反代的域名。

按照 GitHub 上的说明，这里需要将该目录作为一个静态的 HTTP 服务运行。但是这里查了不少资料都没找到如何在 PowerShell 里面搭建静态服务器。**后来从 ChatGPT 上找到了使用 PowerShell 的方法，** 这样就不需要单独整一个第三方框架来设立静态服务器了。先把整来的文件整理成下面的结构。

```powershell
PS E:\Downloads\nginx-1.25.3\html> tree /f
卷 Data2 的文件夹 PATH 列表
卷序列号为 6E72-D95F
E:.
│  blank.png
│  index.html
│  script.js
│  style.css
│
└─models
    ├─cunet
    │  └─art
    │          noise3_scale2x.onnx
    │
    ├─swin_unet
    │  ├─art
    │  │      noise3_scale4x.onnx
    │  │
    │  ├─art_scan
    │  │      noise3_scale4x.onnx
    │  │
    │  └─photo
    │          noise3_scale4x.onnx
    │
    └─utils
            create_seam_blending_filter.onnx
            pad.onnx
```

然后随便找一个目录新建一个 ```startup.cmd``` 的文件，添加这些程序：

```cmd
@echo off
powershell -command "Set-ExecutionPolicy RemoteSigned"
echo $port = 8080  # 指定要使用的端口 > tmp-startup-server.ps1
echo $root = "E:\Downloads\nginx-1.25.3\html"  # 改成整理好文件结构的目录的路径 >> tmp-startup-server.ps1
echo. >> tmp-startup-server.ps1
echo $listener = New-Object System.Net.HttpListener >> tmp-startup-server.ps1
echo $listener.Prefixes.Add("http://localhost:$port/") >> tmp-startup-server.ps1
echo $listener.Start() >> tmp-startup-server.ps1
echo. >> tmp-startup-server.ps1
echo Write-Host "Server is running at http://localhost:$port" >> tmp-startup-server.ps1
echo. >> tmp-startup-server.ps1
echo while ($listener.IsListening) { >> tmp-startup-server.ps1
echo     $context = $listener.GetContext() >> tmp-startup-server.ps1
echo     $response = $context.Response >> tmp-startup-server.ps1
echo. >> tmp-startup-server.ps1
echo     $filename = $context.Request.Url.LocalPath.TrimStart('/') >> tmp-startup-server.ps1
echo     $filepath = Join-Path $root $filename >> tmp-startup-server.ps1
echo. >> tmp-startup-server.ps1
echo     if (Test-Path $filepath -PathType Leaf) { >> tmp-startup-server.ps1
echo         $fileBytes = [System.IO.File]::ReadAllBytes($filepath) >> tmp-startup-server.ps1
echo         $response.OutputStream.Write($fileBytes, 0, $fileBytes.Length) >> tmp-startup-server.ps1
echo     } else { >> tmp-startup-server.ps1
echo         Write-Host "Request url [$filename]" >> tmp-startup-server.ps1
echo         if ($filename -eq '') { >> tmp-startup-server.ps1
echo             $filepath = Join-Path $root 'index.html' >> tmp-startup-server.ps1
echo             if (Test-Path $filepath -PathType Leaf) { >> tmp-startup-server.ps1
echo                 $fileBytes = [System.IO.File]::ReadAllBytes($filepath) >> tmp-startup-server.ps1
echo                 $response.OutputStream.Write($fileBytes, 0, $fileBytes.Length) >> tmp-startup-server.ps1
echo             } else { >> tmp-startup-server.ps1
echo                 $response.StatusCode = 404 >> tmp-startup-server.ps1
echo             } >> tmp-startup-server.ps1
echo         } elseif ($filename -eq 'shutdown') { >> tmp-startup-server.ps1
echo             $response.StatusCode = 200 >> tmp-startup-server.ps1
echo             $responseContent = '' >> tmp-startup-server.ps1
echo             $responseBytes = [System.Text.Encoding]::UTF8.GetBytes($responseContent) >> tmp-startup-server.ps1
echo             $response.OutputStream.Write($responseBytes, 0, $responseBytes.Length) >> tmp-startup-server.ps1
echo             $response.Close() >> tmp-startup-server.ps1
echo             $listener.Stop() >> tmp-startup-server.ps1
echo             break >> tmp-startup-server.ps1
echo         } else { >> tmp-startup-server.ps1
echo             $response.StatusCode = 404 >> tmp-startup-server.ps1
echo         } >> tmp-startup-server.ps1
echo     } >> tmp-startup-server.ps1
echo. >> tmp-startup-server.ps1
echo     $response.Close() >> tmp-startup-server.ps1
echo } >> tmp-startup-server.ps1
echo. >> tmp-startup-server.ps1
echo $listener.Stop() >> tmp-startup-server.ps1
powershell .\tmp-startup-server.ps1
powershell -command "Set-ExecutionPolicy Default"
del tmp-startup-server.ps1
@echo on
```

保存后直接双击打开这个 cmd 文件，看到类似于 ```Server is running at http://localhost:8080``` 的提示后打开浏览器访问 ```http://localhost:8080``` （这里的 8080 为 ```server.ps1``` 程序第 3 行指定的端口号，下同。如果指定的是 80 的话就是 ```http://localhost``` ），放上去需要使用的图片，选择要使用的模型。

- swin_unet / art 立绘模型
- swin_unet / art scan 扫描的纸质立绘模型
- swin_unet / photo 照片模型
- cunet / art (201811) 另一种立绘模型

选择降噪程度，选择超分倍率，然后就可以点击开始来执行超分了。用完以后别忘了访问 ```http://localhost:8080/shutdown``` 停止服务。

![](https://picx.zhimg.com/80/v2-e25c6799f10a84b1d69ce967482b1abd.png)