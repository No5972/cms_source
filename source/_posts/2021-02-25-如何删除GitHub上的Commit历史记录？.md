---
layout: post
title: "如何删除Github上的Commit历史记录？"
date: 2021-02-25 11:00:00
categories: Github
excerpt: "之前在做测试的时候提交了很多无用的记录，现在准备将这些无用的垃圾commit记录删除。具体步骤如下。"
mathjax: true
permalink: /archivers/74
isrepublish: true
---

来源：[![Lestat.Z. - 如何删除Github上的Commit历史记录？](https://img.shields.io/badge/Lestat.Z.-%E5%A6%82%E4%BD%95%E5%88%A0%E9%99%A4Github%E4%B8%8A%E7%9A%84Commit%E5%8E%86%E5%8F%B2%E8%AE%B0%E5%BD%95%EF%BC%9F-brightgreen)](https://lestatzhang.blog.csdn.net/article/details/90607229)

# 前言
之前在做测试的时候提交了很多无用的记录，现在准备将这些无用的垃圾commit记录删除。

# 解决方法
具体步骤如下。
```bash
# Clone your git repo
git clone https://github.com/lestatzhang/lestatzhang.github.io.git
# Entre your local repo
cd lestatzhang.github.io
#Checkout
git checkout --orphan latest_branch
# Add all the files
git add -A
# Commit the changes
git commit -am "Reinitialize"
# Delete the branch
git branch -D master
# Rename the current branch to master
git branch -m master
# Finally, force update your repository
git push -f origin master
```