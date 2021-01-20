---
layout: post
title: "AX版Flash 1月12日之后继续使用Flash的方法"
date: 2021-01-15 15:30:00
categories: Moving-Away-from-Flash
excerpt: "稍微简化了一下，整了一个BAT加Node.js的脚本。需要把BAT、demo32.js、demo64.js、和node.exe（Node.js的可执行文件）放进同一目录。然后右键BAT文件以管理员身份运行。"
permalink: /archivers/65
---

# Flash已经停止维护了，大家能不用Flash就尽量不要用Flash，停止维护之后此组件会非常不安全！
稍微简化了一下，整了一个BAT加Node.js的脚本。需要把BAT、```demo32.js```、```demo64.js```、和```node.exe```（Node.js的可执行文件）放进同一目录。然后右键BAT文件以管理员身份运行。
# BAT文件：
```bat
@echo off

net.exe session 1>NUL 2>NUL && (
    goto as_admin
) || (
    goto not_admin
)

:as_admin
	title 一键解决Flash 1月12日定时自毁的问题 - AX版
	color 09
	echo ====================================================
	echo      一键解决Flash 1月12日定时自毁的问题 - AX版
	echo                       作者：佚名
	echo ====================================================
	echo.
	echo                    按任意键开始修改！
	echo.
	pause
	echo 开始修改Flash.ocx所有者到Administrators
	TAKEOWN /F %SystemRoot%\system32\Macromed\Flash\Flash.ocx /a
	TAKEOWN /F %SystemRoot%\sysWOW64\Macromed\Flash\Flash.ocx /a
	echo 开始修改Flash.ocx权限
	ICACLS %SystemRoot%\system32\Macromed\Flash\Flash.ocx /grant Administrators:F
	ICACLS %SystemRoot%\sysWOW64\Macromed\Flash\Flash.ocx /grant Administrators:F
	%~dp0\node.exe %~dp0\demo32.js
	%~dp0\node.exe %~dp0\demo64.js
	echo 程序结束
	goto end

:not_admin	
	title 一键解决Flash 1月12日定时自毁的问题 - AX版
	color 09
	echo ====================================================
	echo      一键解决Flash 1月12日定时自毁的问题 - AX版
	echo                       作者：佚名
	echo ====================================================
	echo.
	echo    错误：未得到管理员权限，请右键以管理员身份运行！
	echo.

:end
	pause
	@echo on
```
# ```demo32.js```文件：
```javascript
'use strict';
var exec = require('child_process').exec;
var path = require("path") ;
var fs = require("fs") ;
var filePath = path.resolve("C:/Windows/System32/Macromed/Flash/Flash.ocx");

fs.open(filePath, 'r', function (error, fd) {
	var i = 0, j = 0;
	if (error) {
		console.log("\u001b[31m打开文件错误！没有找到文件或者没有权限，可能已经安装了移除Flash的系统更新\u001b[0m");
		
		process.exit();
	}
	
	let size = fs.statSync(filePath).size;
	let buf = Buffer.alloc(size);
	fs.read(fd, buf, 0, size, 0, function (error, data, buffer) {
		console.log("\u001b[37m文件路径：" + filePath + "\u001b[0m");
		console.log("\u001b[37m文件长度：" + buffer.length + "\u001b[0m") ;

		var sourceBytes = [0x00, 0x00, 0x40, 0x46, 0x3E, 0x6F, 0x77, 0x42];
		var isFound = false;
		
		try {
			for (i = 0; i < buffer.length - 8 && !isFound; i++) {
				for (j = 0; j < sourceBytes.length; j++) {
					if (buffer[i+j] != sourceBytes[j]) break;
					if (buffer[i+j] == sourceBytes[j] && j == sourceBytes.length - 1) isFound = true;
				}
			}
		} catch (err) {
			console.log("越界！位置：" + (i+j));
			throw(err);
		}

		if (i == size - 8) {
			console.error("\u001b[31m文件找到了，但是没找到定时自毁的代码！或者已经修改过！\u001b[0m");
		} else {
			
			console.log("\u001b[37m已找到定时自毁的代码：" + (--i) + "\u001b[0m");
			buffer[i+7] = 0x72;
			fs.close(fd, function () {
				fs.writeFile(filePath, buffer, {encoding: "ascii"}, function (err) {
					if (err) {
						console.log("\u001b[31m写入失败！错误信息：" + err + "\u001b[0m");
					} else {
						console.log("\u001b[32m" + "写入成功！已去除自毁定时器，现在可以使用AX版Flash了。" + "\u001b[0m");
					}
				});
			});
		}
	});
});

```
# ```demo64.js```文件：
```javascript
'use strict';
var exec = require('child_process').exec;
var path = require("path") ;
var fs = require("fs") ;
var filePath = path.resolve("C:/Windows/SysWOW64/Macromed/Flash/Flash.ocx");

fs.open(filePath, 'r', function (error, fd) {
	var i = 0, j = 0;
	if (error) {
		console.log("\u001b[31m打开文件错误！没有找到文件或者没有权限，可能已经安装了移除Flash的系统更新\u001b[0m");
		
		process.exit();
	}
	
	let size = fs.statSync(filePath).size;
	let buf = Buffer.alloc(size);
	fs.read(fd, buf, 0, size, 0, function (error, data, buffer) {
		console.log("\u001b[37m文件路径：" + filePath + "\u001b[0m");
		console.log("\u001b[37m文件长度：" + buffer.length + "\u001b[0m") ;

		var sourceBytes = [0x00, 0x00, 0x40, 0x46, 0x3E, 0x6F, 0x77, 0x42];
		var isFound = false;
		
		try {
			for (i = 0; i < buffer.length - 8 && !isFound; i++) {
				for (j = 0; j < sourceBytes.length; j++) {
					if (buffer[i+j] != sourceBytes[j]) break;
					if (buffer[i+j] == sourceBytes[j] && j == sourceBytes.length - 1) isFound = true;
				}
			}
		} catch (err) {
			console.log("越界！位置：" + (i+j));
			throw(err);
		}

		if (i == size - 8) {
			console.error("\u001b[31m文件找到了，但是没找到定时自毁的代码！或者已经修改过！\u001b[0m");
		} else {
			
			console.log("\u001b[37m已找到定时自毁的代码：" + (--i) + "\u001b[0m");
			buffer[i+7] = 0x72;
			fs.close(fd, function () {
				fs.writeFile(filePath, buffer, {encoding: "ascii"}, function (err) {
					if (err) {
						console.log("\u001b[31m写入失败！错误信息：" + err + "\u001b[0m");
					} else {
						console.log("\u001b[32m" + "写入成功！已去除自毁定时器，现在可以使用AX版Flash了。" + "\u001b[0m");
					}
				});
			});
		}
	});
});

```
