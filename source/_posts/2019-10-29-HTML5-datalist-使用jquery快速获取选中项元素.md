---
layout: post
title:  "HTML5 datalist 使用jquery快速获取选中项元素"
date:   2019-10-29 16:30:00
excerpt: 注意到获取datalist目前仍然比较多的使用遍历datalist里面的option来获取选中项的元素(DOM). 如果项目数量比较多的时候效率会比较慢. 如果页面引用的有jquery的话可以直接使用jquery的选择器来快速获取选中项元素. 但是有一个前提, 就是所有option 的某个属性值一定是唯一的, 不能出现重复. 否则将会把全部对应选项都返回出来.
categories: JavaScript
permalink: /archivers/2
---

注意到获取datalist目前仍然比较多的使用遍历datalist里面的option来获取选中项的元素(DOM). 如果项目数量比较多的时候效率会比较慢. 如果页面引用的有jquery的话可以直接使用jquery的选择器来快速获取选中项元素. 但是有一个前提, 就是所有option 的某个属性值一定是唯一的, 不能出现重复. 否则将会把全部对应选项都返回出来.

范例: 已经给一个input输入 框绑定了一个datalist, 现希望在change事件弹出对话框显示datalist选中项的标题.

HTML: 

```html
<input id="type" list="dataList" />
<datalist id="dataList"> <!-- 此范例value属性值必须唯一 -->
	<option value="id_1">选项1</option>
	<option value="id_2">选项2</option>
	<option value="id_3">选项3</option>
	<option value="id_4">选项4</option>
</datalist>
```
JS:
```javascript
$("#type").change(function() {
	alert($("#dataList option[value=" + this.value + "]").text());
})
```

效果: 

![在这里插入图片描述](https://pic1.xuehuaimg-x.com/proxy/https://img-blog.csdnimg.cn/20191029161526424.gif)

测试从6 192个选项中定位的计时:

遍历: 3 680ms

jquery选择器: 38ms
