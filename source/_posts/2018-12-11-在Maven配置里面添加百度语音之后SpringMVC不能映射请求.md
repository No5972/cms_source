---
layout: post
title:  "SpringMVC cannot map requests after importing Baidu Aip into Maven POM/在Maven配置里面添加百度语音之后SpringMVC不能映射请求"
excerpt: "Encountered a problem about SpringMVC and Baidu Aip Speech."
date:   2018-12-11 17:34:26
categories: Java
permalink: /archivers/springmvc-baiduaip-problem
---

Encountered a problem about SpringMVC and Baidu Aip Speech.
After adding 
```xml

		<dependency>

			<groupId>com.baidu.aip</groupId>

			<artifactId>java-sdk</artifactId>

			<version>${baidu.aip.version}</version>

		</dependency>
		
```
this into Maven POM, SpringMVC cannot map requests. The console does not display map information. But once deleted this, SpringMVC can map requests again. I would like to know how to solve the problem...
