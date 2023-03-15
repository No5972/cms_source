---
layout: post
title: "SpringBoot 集成 WebSocket"
date: 2021-11-03 16:00:00
categories: 
  - [Java]
excerpt: "网上有很多关于 WebSocket 用法的文章，但是有一些内容错误或者代码不全的，这里来个全的，方便自己记忆。"
mathjax: true
permalink: /archivers/111
isrepublish: true
---

来源：[![博客园-仅此而已-远方](https://img.shields.io/badge/%E5%8D%9A%E5%AE%A2%E5%9B%AD-%E4%BB%85%E6%AD%A4%E8%80%8C%E5%B7%B2%E2%80%94%E8%BF%9C%E6%96%B9-brightgreen)](https://www.cnblogs.com/xuwenjin/p/12664650.html)

# 前言
WebSocket 是一种在单个 [TCP](https://baike.baidu.com/item/TCP) 连接上进行[全双工](https://baike.baidu.com/item/%E5%85%A8%E5%8F%8C%E5%B7%A5)通信的协议。WebSocket 通信协议于 2011 年被 [IETF](https://baike.baidu.com/item/IETF) 定为标准 RFC 6455，并由 RFC 7936 补充规范。WebSocket [API](https://baike.baidu.com/item/API) 也被 [W3C](https://baike.baidu.com/item/W3C) 定为标准。WebSocket 使得客户端和服务器之间的数据交换变得更加简单，允许服务端主动向客户端推送数据。在 WebSocket API 中，浏览器和服务器只需要完成一次握手，两者之间就直接可以创建持久性的连接，并进行双向数据传输。

# 说明
本篇主要介绍在 SpringBoot 框架下，WebSocket 基于注解使用的 3 种场景：

1. 自己给自己发消息
2. 自己给所有客户端发送消息（不包括自己）
3. 自己给另一个客户端发送消息

# 代码示例
代码结构如下：
![](https://pic1.xuehuaimg-x.com/proxy/https://img-blog.csdnimg.cn/img_convert/098d112678c4ce3a6069d712283728b5.png)

POM 文件中的依赖：
```xml
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <!-- websocket -->
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-websocket</artifactId>
        </dependency>
        <dependency>
            <!-- fastjson -->
            <groupId>com.alibaba</groupId>
            <artifactId>fastjson</artifactId>
            <version>1.2.47</version>
        </dependency>
```

`application.yml` 文件：
```yaml
server:
  port: 18092
```

WebSocket 配置文件：
```java
@Configuration
public class WebSocketConfig {

    /**
     * 注入一个 ServerEndpointExporter，该 Bean 会自动注册使用 @ServerEndpoint 注解申明的 WebSocket Endpoint
     */
    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }

}
```

在 ```resources``` 目录中创建一个 ```static``` 文件夹，然后新建一个 ```index.html``` 页面：
```html
<!DOCTYPE HTML>
<html>
<head>
<title>My WebSocket</title>
</head>

<body>
    <input id="text" type="text" />
    <button onclick="send()">Send</button>
    <button onclick="closeWebSocket()">Close</button>
    <div id="message"></div>
</body>

<script type="text/javascript">
    var websocket = null;

    // 判断当前浏览器是否支持 WebSocket，主要此处要更换为自己的地址
    if ('WebSocket' in window) {
        websocket = new WebSocket("ws://localhost:18092/test/one");
    } else {
        alert('Not support websocket')
    }

    // 连接发生错误的回调方法
    websocket.onerror = function() {
        setMessageInnerHTML("error");
    };

    // 连接成功建立的回调方法
    websocket.onopen = function(event) {
        //setMessageInnerHTML("open");
    }

    // 接收到消息的回调方法
    websocket.onmessage = function(event) {
        setMessageInnerHTML(event.data);
    }

    // 连接关闭的回调方法
    websocket.onclose = function() {
        setMessageInnerHTML("close");
    }

    // 监听窗口关闭事件，当窗口关闭时，主动去关闭 WebSocket 连接，防止连接还没断开就关闭窗口，服务端会抛异常。
    window.onbeforeunload = function() {
        websocket.close();
    }

    // 将消息显示在网页上
    function setMessageInnerHTML(innerHTML) {
        document.getElementById('message').innerHTML += innerHTML + '<br/>';
    }

    // 关闭连接
    function closeWebSocket() {
        websocket.close();
    }

    // 发送消息
    function send() {
        var message = document.getElementById('text').value;
        websocket.send(message);
    }
</script>
</html>
```

对应上面的 3 种场景，分别给出代码：

## 1、自己给自己发消息
创建一个 ```OneWebSocket``` 类，用来服务端与客户端进行交互：
```java
/**
 * 前后端交互的类实现消息的接收推送（自己发送给自己）
 * 
 * @ServerEndpoint(value = "/test/one") 前端通过此 URI 和后端交互，建立连接
 */
@Slf4j
@ServerEndpoint(value = "/test/one")
@Component
public class OneWebSocket {

    /**
     * 记录当前在线连接数 
     */
    private static AtomicInteger onlineCount = new AtomicInteger(0);

    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session) {
        onlineCount.incrementAndGet(); // 在线数加 1
        log.info("有新连接加入：{}，当前在线人数为：{}", session.getId(), onlineCount.get());
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(Session session) {
        onlineCount.decrementAndGet(); // 在线数减 1
        log.info("有一连接关闭：{}，当前在线人数为：{}", session.getId(), onlineCount.get());
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message
     *            客户端发送过来的消息
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        log.info("服务端收到客户端[{}]的消息:{}", session.getId(), message);
        this.sendMessage("Hello, " + message, session);
    }

    @OnError
    public void onError(Session session, Throwable error) {
        log.error("发生错误");
        error.printStackTrace();
    }

    /**
     * 服务端发送消息给客户端
     */
    private void sendMessage(String message, Session toSession) {
        try {
            log.info("服务端给客户端[{}]发送消息{}", toSession.getId(), message);
            toSession.getBasicRemote().sendText(message);
        } catch (Exception e) {
            log.error("服务端发送消息给客户端失败：{}", e);
        }
    }
```

其中 ```@ServerEndpoint``` 注解是服务端与客户端交互的关键，其值 (```/test/one```) 得与 ```index``` 页面中的请求路径对应。

启动服务，在浏览器请求 ```http://localhost:18092/index.html``` ，如下所示：
![](https://pic1.xuehuaimg-x.com/proxy/https://img-blog.csdnimg.cn/img_convert/0125aadcb2910b4ca22a82e254851683.png)

请求一发出，立马就会建立服务端与客户端的连接。服务端打印日志如下：
![](https://pic1.xuehuaimg-x.com/proxy/https://img-blog.csdnimg.cn/img_convert/f55a76be4c8c650bc8121533f5344d95.png)

在文本框中输入内容：“你好”，然后点击 Send 按钮，浏览器效果：
![](https://pic1.xuehuaimg-x.com/proxy/https://img-blog.csdnimg.cn/img_convert/0a0150c3ba89ca87ffde6ddd0e83d166.png)

服务端日志：
![](https://pic1.xuehuaimg-x.com/proxy/https://img-blog.csdnimg.cn/img_convert/b794905998c2bc232406d4da30fb85f5.png)

（备注：服务端关闭或者浏览器关闭的效果，都会导致连接断开，这里不演示）

## 2、自己给所有客户端发送消息（不包括自己）
创建一个 ```OneToManyWebSocket``` 类，用来服务端与客户端进行交互：
```java
/**
 * 
 * 前后端交互的类实现消息的接收推送（自己发送给所有人（不包括自己））
 * 
 * @ServerEndpoint(value = "/test/oneToMany") 前端通过此 URI 和后端交互，建立连接
 */
@Slf4j
@ServerEndpoint(value = "/test/oneToMany")
@Component
public class OneToManyWebSocket {

    /**
     * 记录当前在线连接数 
     */
    private static AtomicInteger onlineCount = new AtomicInteger(0);

    /**
     * 存放所有在线的客户端 
     */
    private static Map<String, Session> clients = new ConcurrentHashMap<>();

    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session) {
        onlineCount.incrementAndGet(); // 在线数加 1
        clients.put(session.getId(), session);
        log.info("有新连接加入：{}，当前在线人数为：{}", session.getId(), onlineCount.get());
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(Session session) {
        onlineCount.decrementAndGet(); // 在线数减 1
        clients.remove(session.getId());
        log.info("有一连接关闭：{}，当前在线人数为：{}", session.getId(), onlineCount.get());
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message
     *            客户端发送过来的消息
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        log.info("服务端收到客户端[{}]的消息:{}", session.getId(), message);
        this.sendMessage(message, session);
    }

    @OnError
    public void onError(Session session, Throwable error) {
        log.error("发生错误");
        error.printStackTrace();
    }

    /**
     * 群发消息
     * 
     * @param message
     *            消息内容
     */
    private void sendMessage(String message, Session fromSession) {
        for (Map.Entry<String, Session> sessionEntry : clients.entrySet()) {
            Session toSession = sessionEntry.getValue();
            // 排除掉自己
            if (!fromSession.getId().equals(toSession.getId())) {
                log.info("服务端给客户端[{}]发送消息{}", toSession.getId(), message);
                toSession.getAsyncRemote().sendText(message);
            }
        }
    }
}
```

将 ```index.html``` 页面的路径改为 ```/test/oneToMany```。重启服务，在浏览器开多个页面。服务端日志如下：
![](https://pic1.xuehuaimg-x.com/proxy/https://img-blog.csdnimg.cn/img_convert/d74ca599ca01c20ad653f1f8da7ce0b4.png)

在浏览器第一个页面中输入内容：“你好”，会发现其它页面都收到了消息“你好”。服务端日志如下：
![](https://pic1.xuehuaimg-x.com/proxy/https://img-blog.csdnimg.cn/img_convert/2bcc0eedc3e6230a9022f6c16c1839f6.png)

## 3、自己给另一个客户端发送消息
创建一个 ```OneToOneWebSocket``` 类，用来服务端与客户端进行交互：
```java
/**
 * 前后端交互的类实现消息的接收推送（自己发送给另一个人）
 * 
 * @ServerEndpoint(value = "/test/oneToOne") 前端通过此 URI 和后端交互，建立连接
 */
@Slf4j
@ServerEndpoint(value = "/test/oneToOne")
@Component
public class OneToOneWebSocket {

    /**
     * 记录当前在线连接数 
     */
    private static AtomicInteger onlineCount = new AtomicInteger(0);

    /** 
     * 存放所有在线的客户端 
     */
    private static Map<String, Session> clients = new ConcurrentHashMap<>();

    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session) {
        onlineCount.incrementAndGet(); // 在线数加 1
        clients.put(session.getId(), session);
        log.info("有新连接加入：{}，当前在线人数为：{}", session.getId(), onlineCount.get());
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(Session session) {
        onlineCount.decrementAndGet(); // 在线数减 1
        clients.remove(session.getId());
        log.info("有一连接关闭：{}，当前在线人数为：{}", session.getId(), onlineCount.get());
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message
     *            客户端发送过来的消息
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        log.info("服务端收到客户端[{}]的消息[{}]", session.getId(), message);
        try {
            MyMessage myMessage = JSON.parseObject(message, MyMessage.class);
            if (myMessage != null) {
                Session toSession = clients.get(myMessage.getUserId());
                if (toSession != null) {
                    this.sendMessage(myMessage.getMessage(), toSession);
                }
            }
        } catch (Exception e) {
            log.error("解析失败：{}", e);
        }
    }

    @OnError
    public void onError(Session session, Throwable error) {
        log.error("发生错误");
        error.printStackTrace();
    }

    /**
     * 服务端发送消息给客户端
     */
    private void sendMessage(String message, Session toSession) {
        try {
            log.info("服务端给客户端[{}]发送消息[{}]", toSession.getId(), message);
            toSession.getBasicRemote().sendText(message);
        } catch (Exception e) {
            log.error("服务端发送消息给客户端失败：{}", e);
        }
    }

}
```

将 ```index.html``` 页面的路径改为 ```/test/oneToOne```。重启服务，在浏览器打开两个页面。

由于服务端是解析的 JSON 字符串，这里为了简单起见，直接在浏览器输入 JSON 字符串：```{"message":"你好", "userId":1}```。另一个页面收到了消息：
![](https://pic1.xuehuaimg-x.com/proxy/https://img-blog.csdnimg.cn/img_convert/e81a0282a2ac02eb9862e75eef75741a.png)

服务端日志：
![](https://pic1.xuehuaimg-x.com/proxy/https://img-blog.csdnimg.cn/img_convert/2adde634315c6569543a5b54af720a0a.png)

至此，所有场景演示完毕。
