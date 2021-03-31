---
layout: post
title:  "（正式版已修复）Hexo NexT主题 Valine评论 多语言失效"
date:   2020-08-06 16:15:00
categories: Web-Building
excerpt: 这个博客必然是要面向全世界开放的（所以为什么初次访问本博客顶部会出现Cookie声明），所以界面是英文的（博文暂不考虑翻译）。之前来必力评论发现发送评论之后页面并不能显示，后台显示了但是前台并没有显示。考虑到现在大部分新开的个人博客网站都采用了Valine框架的评论，这里也打算换用Valine。但是在NexT主题里面配置了```language```属性之后评论界面语言并没有发生变化，这个也是应当按英文来显示的。
permalink: /archivers/22
---

{% note info %}
**8.0.0正式版已经修复了这个小bug，使用8.0.0正式版或者更新版本就可以避免出现此问题了。**
{% endnote %}

这个博客必然是要面向全世界开放的（所以为什么初次访问本博客顶部会出现Cookie声明），所以界面是英文的（博文暂不考虑翻译）。之前来必力评论发现发送评论之后页面并不能显示，后台显示了但是前台并没有显示。考虑到现在大部分新开的个人博客网站都采用了Valine框架的评论，这里也打算换用Valine。但是在NexT主题里面配置了```language```属性之后评论界面语言并没有发生变化，这个也是应当按英文来显示的。

原始的NexT配置文件里面的Valine配置是这样的。（这里找了8.0.0-rc.5的版本）

```yaml
# Valine
# For more information: https://valine.js.org, https://github.com/xCss/Valine
valine:
  enable: false
  appId: # Your leancloud application appid
  appKey: # Your leancloud application appkey
  placeholder: Just go go # Comment box placeholder
  avatar: mm # Gravatar style
  meta: [] # Custom comment header: [nick, mail, link]
  pageSize: 10 # Pagination size
  language: # Language, available values: en, zh-cn
  visitor: false # Article reading statistic
  comment_count: true # If false, comment count will only be displayed in post page, not in home page
  recordIP: false # Whether to record the commenter IP
  serverURLs: # When the custom domain name is enabled, fill it in here (it will be detected automatically by default, no need to fill in)
  enableQQ: false # Whether to enable the Nickname box to automatically get QQ Nickname and QQ Avatar
  requiredFields: [] # Set required fields: [nick] | [nick, mail]
  #post_meta_order: 0
```

发现了这个问题之后，查看服务器生成页面的源代码，注意到有个地方刚好键值对的名称和上面的yaml一一对应。

```js
NexT.utils.loadComments('#valine-comments', () => {
  NexT.utils.getScript('//cdn.jsdelivr.net/npm/valine@1.4.14/dist/Valine.min.js', () => {
    new Valine(Object.assign({
      el  : '#valine-comments',
      path: location.pathname,
    }, {"enable":true,"appId":"...","appKey":"...","placeholder":"Just go go","avatar":"mm","meta":["nick","mail","link"],"pageSize":10,"language":"en","visitor":false,"comment_count":true,"recordIP":false,"serverURLs":null}
    ));
  }, window.Valine);
});
```

猜测是```language```属性读取有问题。查Valine的官方文档，打开“多语言支持”，发现配置语言的属性名称已经变成了```lang```而不是```language```。

于是将配置文件的这个```language```属性名称改成```lang```。重启服务器，刷新页面，此时可以看到评论界面已经成功变为英文。

目前鄙人已将此问题在NexT官方Github提交Issue。希望那边可以订正这个小BUG。

[一个小问题：Valine 1.4.14 多语言属性名字在这边主题配置里面不对（language应该是lang）](https://github.com/next-theme/hexo-theme-next/issues/83)
