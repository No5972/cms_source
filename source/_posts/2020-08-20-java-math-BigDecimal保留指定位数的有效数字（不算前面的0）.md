---
layout: post
title: java.math.BigDecimal保留指定位数的有效数字（不算前面的0）
date: 2020-08-20 11:27:49
categories: Java
excerpt: BigDecimal类型的小数可以使用MathContext指定有效数字。
permalink: /archivers/28
---

> 百度百科：从一个数的左边第一个非0数字起，到末位数字止，所有的数字都是这个数的有效数字。
就是一个数从左边第一个不为0的数字数起到末尾数字为止，所有的数字（包括0，科学计数法不计10的N次方），称为有效数字。简单的说，把一个数字前面的0都去掉，从第一个正整数到精确的数位止所有的都是有效数字了。
如：0.0109，前面两个0不是有效数字，后面的109均为有效数字（注意，中间的0也算）。


 &nbsp;```BigDecimal```类型的小数可以使用```MathContext```指定有效数字。

```java
/**
 * 写法来自StackOverflow的Kru 
 * https://stackoverflow.com/questions/7572309/any-neat-way-to-limit-significant-figures-with-bigdecimal
 */
System.out.println(new BigDecimal(0.022223).round(new MathContext(3, RoundingMode.HALF_UP)));
// （四舍五入）输出：0.0222

System.out.println(new BigDecimal(144.022223).round(new MathContext(5, RoundingMode.HALF_UP)));
// （四舍五入）输出：144.02
```
