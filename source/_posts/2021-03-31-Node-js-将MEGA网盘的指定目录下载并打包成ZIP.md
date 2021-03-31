---
layout: post
title: "Node.js 将MEGA网盘的指定目录下载并打包成ZIP"
date: 2021-03-31 18:00:00
categories: JavaScript
excerpt: "Node.js也很适合编写自动化脚本。Node.js的在编写自动化脚本这方面生态不比Python差多少。并且据说相同的代码，Node.js的执行效率要高于Python。Node.js和Python的运行库体积也相差无几。MEGA在PIP和NPM都有现成的封装好的MEGA网盘API。但是经过实测发现Node.js的API相对来说更好使一些。我們把写好的代码放到ReplIt上运行就可以直接下载打包好的ZIP文件了。"
mathjax: true
permalink: /archivers/84
---

Node.js也很适合编写自动化脚本。Node.js的在编写自动化脚本这方面生态不比Python差多少。并且据说相同的代码，Node.js的执行效率要高于Python。Node.js和Python的运行库体积也相差无几。MEGA在PIP和NPM都有现成的封装好的MEGA网盘API。但是经过实测发现Node.js的API相对来说更好使一些。我們把写好的代码放到ReplIt上运行就可以直接下载打包好的ZIP文件了。

我們把生成和运行JS的过程都集中到一个Bash里面，这样方便调用Linux的命令。Node.js调用系统命令比Python要复杂不少，并且有些命令并不能达到想要的效果，例如```clear```命令。

首先需要从NPM下载安装两个依赖，```megajs```即为Node.js的MEGA网盘API，```compress```用来将下载好的文件打成ZIP包。

然后使用```cat```命令生成这个JS文件，然后使用```node```命令执行它。

{% note warning %}
注意在ReplIt上执行完成之后，**如果想要下载得到打包好的ZIP文件，要先把打包好的ZIP文件随便重命名一下**，从shell里面运行生成、删除、重命名的文件变化虽然会反映到左侧的文件列表中，但是执行文件列表菜单中的“Download as ZIP”之后下载得到的文件是没有这个变化的。

**同理，要删除文件的时候，也不宜在脚本中直接删除之前生成的ZIP文件，应该从文件列表中鼠标移到要删除的文件，然后点击右侧三个点的按钮，在菜单中选择Delete来删除。** 否则以后下载整个ZIP文件时会发现之前从脚本删除的文件仍然还在。这种情况需要从文件列表中创建这个文件名的文件然后从文件列表中删除之才能去掉。

[这已经是在ReplIt上提出了数个月的BUG了。](https://replit.com/talk/ask/Download-as-zip-didnt-download-my-output-files/81622)
{% endnote %}

```js
npm install megajs compressing
rm -f run.js || true
# rm -f pixiv*.zip || true
rm -rf pixiv || true
mkdir pixiv
cat>>run.js<<-EOF
const readline = require('readline');
const mega = require("megajs");
const fs = require("fs");
const compressing = require("compressing");
var y, z = 0;
var email = "", password = "";
var folderToDownload = "Pixiv"; // 改成你需要下载的目录名称。暂时只支持根目录下的一级目录

console.log("+-----------------------------------------------------------+");
console.log("|                                                           |");
console.log("|   Download Specific Folder From Mega And Pack Up to Zip   |");
console.log("|                                                           |");
console.log("+-----------------------------------------------------------+");

console.log("ATTENTION: Password will be shown - Do not let any others see");

Date.prototype.format = function (fmt) { //type : 类型 0:时间为秒  1:时间为毫秒
  var date = this;
  var o = {
    "M+": date.getMonth() + 1, //月份
    "d+": date.getDate(), //日
    "h+": date.getHours(), //小时
    "m+": date.getMinutes(), //分
    "s+": date.getSeconds(), //秒
    "q+": Math.floor((date.getMonth() + 3) / 3), //季度
    "S": date.getMilliseconds() //毫秒
  };
  if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.\$1, (date.getFullYear() + "").substr(4 - RegExp.\$1.length));
  for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.\$1, (RegExp.\$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
  return fmt;
}

console.log("Input email: "); 

// 运行到这里的时候输入邮箱
var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

new Promise((resolve, reject) => { 
  rl.on('line', function(line){
    email = line;
    rl.close();
    resolve();
  });
}).then(() => {

console.log("Input password: ");

// 运行到这里的时候输入密码
new Promise((resolve, reject) => {
  var rl2 = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

 
  rl2.on('line', function(line){
    password = line;
    rl2.close();
    resolve();
  });
}).then(async () => {

console.clear();

var storage;
console.log("Logging " + email + " in ...");

new Promise((resolve, reject) => {
  storage = mega({email: email, password: password}, () => { resolve(); });
}).then(() => {

var folder = storage.root.children.find(x => x.name == folderToDownload);

console.log("To Download " + folderToDownload);
console.log("Total Files: " + folder.children.length);

for (var x in folder.children) { 
  folder.children[x].download({}, function () {
    console.log((Number(z) + 1) + "/" + folder.children.length  + " finished");
    z++;
    if (z >= folder.children.length) {
      console.log("begin packing");
      compressing.zip.compressDir('pixiv', 'pixiv' + new Date().format("yyyyMMddhhmmss") + '.zip').then(() => {
        console.log('Packing complete!!!');
        console.log('NOTE: If you want to download from "Download as Zip" in the upper right menu, you must rename this zip file to something else, in the menu next to the zip file, in the file list on the left hand side. Otherwise the zip wont contain the zip you want. This is a ReplIt bug months ago.');
        console.log('Zip file wont be deleted by the nodejs script. As the downloaded zip would preserve the zip file just deleted. The previous zip file is strongly suggested to delete manually in the file list on the left hand side.');
        console.log('Program ends');
        process.exit();
      })
      .catch(err => {
        console.error(err);
      });
    }
  }).pipe(fs.createWriteStream("./pixiv/" + folder.children[x].name)); 
  console.log((Number(x) + 1) + "/" + folder.children.length  + " started");
}

});

});
});


EOF
clear
node run.js
rm -f run.js
rm -rf pixiv
```

代码写好以后，保存为```.sh```的文件，在Linux控制台输入```sh ./保存的bash脚本文件名.sh```即可运行，网盘登录邮箱和密码需要自行输入。

{% note danger %}
注意密码输入没做隐藏，后续还要改进。密码输入完成后会自动清屏。输入的时候谨防被他人看到，导致网盘账号被盗。
{% endnote %}