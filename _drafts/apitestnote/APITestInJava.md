---
layout: post
title: "Service API测试-Java编码101"
categories: 测试
excerpt:
tags: 测试 Java
---

* content
{:toc}


在基本的maven项目生成之后，针对一个web service，就是一个api，如何使用java进行脚本化自动化的测试




## 事前准备

- maven项目生成OK；IDE等环境，maven mirror配置OK；
- 使用postman手动调试apiOK，post发送请求是可以的，证明稳定性

## 操作步骤

### 环境测试运行

- 测试的运行需要一个程序的入口点，也就是从哪里开始运行，暂时还没有引入框架的情况下就仅仅使用一个main函数作为入口点

新建一个包用来存放java文件，新建java类文件并写好主函数，先来个helloworld证明运行环境ok

TestClassName.java

```
package testpackage;

/**
 * Created by zhangzj on 2016/11/18.
 */
public class TestClassName {
    public static void main(String[] args) {
        System.out.println("Hello，World!");
    }
}
```

运行成功则说明环境ok，运行可以执行

![](http://ww4.sinaimg.cn/large/8d6a2535gw1f9w0xopwzjj20px0llgpe.jpg)

### Postman生成代码

针对需要测试的API，使用postman手动调试通过；使用postman的代码生成功能来生成java的代码

postman生成的unirest框架代码

```
HttpResponse<String> response = Unirest.get("https://服务器地址/user/captcha")
  .header("cache-control", "no-cache")
  .header("postman-token", "15fd96a8-2f6e-6078-5784-62f9fb24cf85")
  .asString();
```

我们这样就有了从java代码中发出api请求的能力；接下来需要解决调试中遇到的问题，比如导入unirest框架，查看返回结果等；

### 请求发出与打印返回结果

postman生成的代码贴入main函数之后，需要导入Unirest的框架才可以使用Unirest的功能；把下面的dependency贴入mavne的配置文件pom.xml；相对位置如下

```
<modelVersion>4.0.0</modelVersion>

<groupId>com.test</groupId>
<artifactId>apidemo1</artifactId>
<version>1.0-SNAPSHOT</version>

<dependencies>
    <dependency>
        <groupId>com.mashape.unirest</groupId>
        <artifactId>unirest-java</artifactId>
        <version>1.4.9</version>
    </dependency>

    // 很多其他依赖

</dependencies>
</project>
```

之后就可以正常运行代码；我们是用两条打印语句来看请求执行后返回的结果

// file: TestClassName.java

```
package testpackage;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

/**
 * Created by zhangzj on 2016/11/18.
 */
public class TestClassName {
    public static void main(String[] args) {
        System.out.println("Hello，World!");

        try {
            HttpResponse<String> response = Unirest.get("https://unstable.dianlc.com/user/captcha")
                    .header("cache-control", "no-cache")
                    .header("postman-token", "15fd96a8-2f6e-6078-5784-62f9fb24cf85")
                    .asString();

            System.out.println(response.getStatus());
            System.out.println(response.getBody().toString());
        } catch (UnirestException e) {
            e.printStackTrace();
        }
    }
}

```

运行列印的结果

```
Hello，World!
200
{"data":{"url":"/user/captcha/8b4bbd01511d.jpg","token":"8710-ccc3bd01511d"},"error":0}

Process finished with exit code 0
```

### 检查结果的正确性

上面的代码只是打印了api返回的结果，但是并没有做任何对于结果的检验，我们也无法判断结果的正确性与合理性；接下来的要面对的子问题就是如何check返回结果的是不是我们预期的结果，因此需要引入单元测试框架TestNG；

还是针对上文的api，我们需要简单判断返回是否正确；1. api返回的状态码是不是200，表示正常返回；2. 返回的data数据中有没有url字段表示验证码的图片地址，是否存在？

首先先修改pom.xml来引入testng依赖

```
<dependencies>
        <dependency>
            <groupId>com.mashape.unirest</groupId>
            <artifactId>unirest-java</artifactId>
            <version>1.4.9</version>
        </dependency>

        <dependency>
            <groupId>org.testng</groupId>
            <artifactId>testng</artifactId>
            <version>6.9.13.6</version>
        </dependency>

    </dependencies>
```

修改代码运行之后，可以看到运行成功了；这里的修改主要有两处；1. assert相关代码负责确认结果的正确性；2. httpresponse的返回类型由String变成了jsonnode，对应的asString改成了asjson，目的是提供body解析的功能，让我们能提取出结果中的数据；

```
package testpackage;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import org.testng.Assert;

/**
 * Created by zhangzj on 2016/11/18.
 */
public class TestClassName {
    public static void main(String[] args) {
        System.out.println("Hello，World!");

        try {
            HttpResponse<JsonNode> response = Unirest.get("https://unstable.dianlc.com/user/captcha")
                    .header("cache-control", "no-cache")
                    .header("postman-token", "15fd96a8-2f6e-6078-5784-62f9fb24cf85")
                    .asJson();

            System.out.println(response.getStatus());
            System.out.println(response.getBody().toString());

            Assert.assertEquals(response.getStatus(), 200);
            Assert.assertNotNull(response.getBody().getObject().getJSONObject("data").getString("url"));
        } catch (UnirestException e) {
            e.printStackTrace();
        }
    }
}

```

正常运行之后的结果是没有问题的，但是如果assert代码检查结果和预期的不符合就会出现异常结果；比如我们把状态码的返回check修改一下，故意让她出错；200改成123；`Assert.assertEquals(response.getStatus(), 123);`

测试发现不对，终止运行并报错；根据信息可以得出，单元测试框架可以胜任测试结果是都符合预期的任务

```
Hello，World!
200
{"data":{"text":"fZWK","url":"/user/captcha/7f01fe44e88.jpg","token":"c01fe44e88"},"error":0}
Exception in thread "main" java.lang.AssertionError: expected [123] but found [200]
	at org.testng.Assert.fail(Assert.java:94)
	at org.testng.Assert.failNotEquals(Assert.java:513)
	at org.testng.Assert.assertEqualsImpl(Assert.java:135)
	at org.testng.Assert.assertEquals(Assert.java:116)
	at org.testng.Assert.assertEquals(Assert.java:389)
	at org.testng.Assert.assertEquals(Assert.java:399)
	at testpackage.TestClassName.main(TestClassName.java:25)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:497)
	at com.intellij.rt.execution.application.AppMain.main(AppMain.java:144)

Process finished with exit code 1

```
