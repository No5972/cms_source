---
layout: post
title: "NexT主题 Group Pictures添加超链接"
date: 2020-11-20 15:00:00
categories: Web-Building
excerpt: "经过反复的查找相关JS代码包括编译站点的NodeJS代码，最终在group-pictures.js文件找到了问题所在。获取图片DOM的代码是通过正则表达式判断的，他会先把包裹在特定标签的内容生成出来的HTML代码取出来，然后通过正则表达式来找图片HTML标签。但是这个标签是按&lt;img&gt;标签去找的。这样会把包裹在&lt;img&gt;标签外面的&lt;a&gt;标签忽略，导致超链接无法生成。"
permalink: /archivers/47
---

**鄙人向NexT主题提交的[PR](https://github.com/next-theme/hexo-theme-next/pull/143)已经得到合并，大家可以在下一个版本的NexT尝试。**

NexT主题在博文中插入图片时，一张图片会单独占满一行。如果想要将多个尺寸较小的图片放在同一行就比较麻烦。好在NexT主题集成了一个扩展标签[Group Pictures](https://theme-next.js.org/docs/tag-plugins/group-pictures.html)，允许在同一行放多张图片（最多3张）。

但是遇到我們这种非常特殊的需求，要在关于页面的同一行放置多个徽章并且还要能点击跳转。这就需要将图片设置超链接。Group Pictures并不支持超链接。如果直接使用Markdown图片超链接标签，则超链接效果包括```<a>```标签都会被吞掉。

经过反复的查找相关JS代码包括编译站点的NodeJS代码，最终在```group-pictures.js```文件找到了问题所在。获取图片DOM的代码是通过正则表达式判断的，他会先把Hexo那边包裹在特定标签的内容生成出来的HTML代码取出来，然后通过正则表达式来找图片HTML标签。但是这个标签是按```<img>```标签去找的。这样会把包裹在```<img>```标签外面的```<a>```标签忽略，导致超链接无法生成。

我們需要将这里的正则表达式改成既找```<img>```标签也找```<a>```标签。打开```group-pictures.js```，将下边的```groupPicture```函数的正则表达式修改。

```js
function groupPicture(args, content) {
  args = args[0].split('-');
  const group = parseInt(args[0], 10);
  const layout = parseInt(args[1], 10);

  content = hexo.render.renderSync({text: content, engine: 'markdown'});

  // const pictures = content.match(/<img[\s\S]*?>/g);
  const pictures = content.match(/(<a[^>]*>((?!<\/a)(.|\n))+<\/a>)|(<img[^>]+>)/g); // 这一行改成这样

  return `<div class="group-picture">${templates.dispatch(pictures, group, layout)}</div>`;
}
```

这样再使用Group Pictures的时候就可以直接放图片超链接了。例如：

```markdown
{% grouppicture 3-1 %}
  [![](/images/docs/next.svg)](https://theme-next.js.org/)
  ![](/images/docs/next.svg)
  [![](/images/docs/next.svg)](https://theme-next.js.org/)
{% endgrouppicture %}
```