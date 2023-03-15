---
layout: post
title: "Java POI WPS另存为的XLSX Excel报错Package should contain a content type part [M1.13]"
date: 2021-04-09 11:00:00
categories: Java
excerpt: "最近在写项目的时候，使用到了POI对表格的处理，在通过文件流创建工作簿的时候，出现异常，异常信息是：Package should contain a content type part [M1.13]。在这里，记录下这个信息，也供大家参考。"
mathjax: true
permalink: /archivers/86
---

最近在写项目的时候，使用到了POI对表格的处理，在通过文件流创建工作簿的时候，出现异常，异常信息是：```Package should contain a content type part [M1.13]```。在这里，记录下这个信息，也供大家参考。

---
# 问题描述：
先看我的测试代码：
```java
String templatePath = this.getClass().getResource("/").getPath()+"/static";
FileInputStream excelFileInputStream = new FileInputStream(templatePath + "/测试模板.xlsx");
Workbook workbook = WorkbookFactory.create(excelFileInputStream);
excelFileInputStream.close();
Sheet sheet = workbook.getSheetAt(0);
Row xssfRow = sheet.getRow(5); Cell xssfCell = xssfRow.getCell(0); xssfCell.setCellValue("交货状态：" + map.get("status").toString());
xssfRow = sheet.getRow(5); xssfCell = xssfRow.getCell(15); xssfCell.setCellValue(map.get("machineNo").toString());
// 省去其他填充字段
FileOutputStream excelFileOutPutStream = new FileOutputStream("C:/测试模板-" + key + ".xlsx");
workbook.write(excelFileOutPutStream);
excelFileOutPutStream.flush();
excelFileOutPutStream.close();
```
这段代码运行，抛POI异常：```Package should contain a content type part [M1.13]```这个异常的原因可能有多种，查找资料发现，大多数回答都是该异常是由于 Excel 2003和2007之间的区别导致的，或者就是说文件是直接改后缀名得到（改后缀名也是会导致异常）。 Excel 2003和2007之间的区别：
>HSSF － 提供读写Microsoft Excel格式档案的功能。
XSSF － 提供读写Microsoft Excel OOXML格式档案的功能。

---

# 原因分析：
Excel 的版本，我使用的是WPS 2019 个人版的，也就是后缀为```.xlsx```，按理说没什么问题的。
而且模板文件也是新建的，不存在是通过改后缀名得到的（后缀名由```.xls```改为```.xlsx```也是不能识别的）。
**此XLSX文件是通过《WPS 2019 个人版》将一个XLS文件另存为XLSX的。可能使用WPS导出的时候有些关键的XLSX文件头没有加入进去导致POI无法识别这是一个2007的XLSX文件。**

---
# 解决方案：
使用必应搜索```online convert```，打开[https://www.online-convert.com](https://www.online-convert.com)，在Document Converter的下拉框中选择Convert to XLSX，然后将WPS另存为的XLSX文件上传，再转换一次XLSX。将这个再转换的XLSX导入进Java的程序。问题解决。
{% note warning %}
此网站转换后生成的文档有些字体发生了变化，如果对格式有严格要求，需要再进行调整。转换后的XLSX文件使用WPS编辑保存后也可以在Java POI程序中使用。
{% endnote %}
![20210409103800710.png](https://images.weserv.nl/?url=https://img-blog.csdnimg.cn/20210409103800710.png)


参考：[POI异常信息：Package should contain a content type part [M1.13]](https://blog.csdn.net/weixin_42833423/article/details/112391440)