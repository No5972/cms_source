---
layout: post
title: "提供一个Java SE程序打单个EXE包部署到不带JRE电脑运行的实现（有点复杂）"
date: 2020-12-28 18:00:00
categories: Java
excerpt: "在IDE中打一个Runnable JAR。将JRE目录拷贝一份出来，重命名为jre。使用exe4j把JAR包转换成EXE。把EXE文件和jre目录放在同一个目录。使用《单文件软件封装工具》（标题栏有QQ号，右下角状态栏显示压缩率的那个）把存放EXE和jre的目录打包成单个EXE文件。"
permalink: /archivers/56
---

详细步骤：
1. 在IDE中打一个Runnable JAR。
    - Eclipse右键整个项目-Export-Java-Runnable JAR File，Library Handling前两个都可以，第三个比较麻烦不建议用。
    - IDEA点击File-Project Structure-Artifacts，点击加号，JAR，From Modules and Dependencies，选中启动的那个模块，选择启动主类，选择Extract to the target JAR。然后点击Build-Build Artifacts，然后选中刚才添加的JAR即可。
2. 将JRE目录拷贝一份出来，重命名为```jre```。
3. 使用exe4j把JAR包转换成EXE。
    - Project Type选择"JAR in EXE mode"
    - Application Info是EXE属性附加信息的内容，以及生成EXE文件的位置。
    - Executable Info的Executable Name是生成EXE文件的名字，Icon File可以用来指定生成EXE文件的图标。其他保持默认。
    - Java Invocation里面的列表要添加第一步生成的JAR文件。
    - JRE那一步的Search Sequence里面别的都不要，只设置一个Directory里面填```.\jre```。
    - Splash Screen用来指定刚运行EXE时显示的Logo界面，可以不指定。
    - Messages用来指定如果环境出错显示什么样的错误信息。默认是英文的提示，可以改成中文但是翻译量是比较大的。
4. 把EXE文件和```jre```目录放在同一个目录。
5. 使用《单文件软件封装工具》（标题栏有QQ号，右下角状态栏显示压缩率的那个）把存放EXE和```jre```的目录打包成单个EXE文件。
   - 选择程序目录，选择这个存放EXE和```jre```的目录。
   - 选择执行程序，选择这个EXE文件。
   - 选择保存路径，选择要导出单个EXE文件的位置。
   - 选择文件图标，可以指定单独的ICO图标，如果在exe4j中设置了图标也可以指定EXE文件。
   - 附加信息是EXE属性附加信息的内容，可以选择性设置。
   - 使用7z模式打包出来的EXE启动稍微快一些。

