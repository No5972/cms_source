---
layout: post
title: "大学 C 语言在线 PTA 平台编译提示警告未使用 scanf 返回值的问题"
date: 2024-10-31 18:00:00
categories: 
  - [C/C++]
excerpt: "最近在知乎发现有不少大学生在使用 PTA 平台在线编写 C 语言代码，编译时提示警告未使用 ```scanf``` 返回值的问题。有不少同学认为程序有问题，要是这样认为倒也是，因为 PTA 平台默认使用的 GCC 编译器希望你重视函数返回值的问题，希望你用上 ```scanf``` 函数的返回值。"
mathjax: true
permalink: /archivers/165
isrepublish: false
---

最近在知乎发现有不少大学生在使用 PTA 平台在线编写 C 语言代码，编译时提示警告未使用 ```scanf``` 返回值的问题。具体现象是编译器输出显示为类似于这样的提示。

![](https://pic1.zhimg.com/v2-49a840da51c32c05bad9caae7d14b102_r.png)


```bash
a.c: In function ‘main’:
a.c:9:5: warning: ignoring return value of ‘scanf’ declared with attribute ‘warn_unused_result’ [-Wunused-result]
    9 |     scanf("%d", &num);
      |     ^~~~~~~~~~~~~~~~~
```

有不少同学认为程序有问题，要是这样认为倒也是，因为 PTA 平台默认使用的 GCC 编译器希望你重视函数返回值的问题，希望你用上 ```scanf``` 函数的返回值。但话又说回来，使用这个 PTA 平台编写 C 语言的大学生基本上都是初学 C 语言的，而教材上的范例程序基本上都不会用到 ```scanf``` 的返回值。 *都这样了知乎上还有人和鄙人杠说“这个返回值其实是很重要的”。 这显然是为了杠而杠了，C 语言初学阶段先把功能或者是题目需求搞定再说细节上的问题。*

**不过，还是希望各位初学者重视编译器的警告，虽然这对部分英语基础不是很好的同学可能有些困难，但是根据警告完善代码，还是非常重要的，这更好地保障了应用程序的稳定性。**

这里鄙人专门注册了一个 PTA 平台的账号研究了一下，并且参考了 StackOverflow 上一些大佬的回答，汇总了几种解决这个警告的办法。

# 一种方法：切换编译器

PTA 平台其实提供了好几种 C 语言的编译器，鄙人实测了一下，只要把编译器切换到 clang，就不会警告未使用 ```scanf``` 返回值的问题了。

切换编译器的下拉框一般位于代码框的上方，他这里默认选择的是“C (gcc)”，我们把这个下拉框选择“C (clang)”，再尝试提交程序，这样就不会警告未使用 ```scanf``` 返回值的问题了。

![](https://picx.zhimg.com/v2-2757bbebe33b3708d1f5c56ac1c32327_r.png)

![](https://pic4.zhimg.com/v2-a334f9676dd2ccb61300b10c5336b766_r.png)

# 另一种方法：修改代码

参考 [StackOverflow 上 rivy 大佬在这个回答的评论区里面提供的线索](https://stackoverflow.com/a/7273026) ，只要把 ```scanf``` 语句稍微修改一下即可。比如说鄙人这个程序里面有一个

```c
scanf("%d", &num);
```

只要在 ```scanf``` 前面加一个 ```(void)!```，就像这样

```c
(void)!scanf("%d", &num);
```

GCC 编译器就不会再警告未使用 ```scanf``` 返回值的问题了。

![](https://pic1.zhimg.com/v2-d6091155c84a83af5eca406241e5f558_r.png)