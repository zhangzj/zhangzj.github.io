---
layout: post
title:  "身份证号生成器-Java实现"
categories: 博客
tags:  Java 算法 身份证号
---

* content
{:toc}





## 疑问

- 大陆身份证号的规律标准是什么？生成的算法是什么？

## 小论

**310105198605125678**

以上海身份证号为例，前六位是地区号码，上海市310，后面的三位是区县代码；接下来的8位是出生年月日，位数不足就补零处理；还剩4位，15位到17位是当天出生的婴儿的顺序号，第17位有特殊含义，奇数是男生，偶数是女生，这三位生成可以当做随机数处理；最后一位，第18位是校验位，根据前面17位计算得出。

ISO 7064:1983.MOD11-2校验码计算法 : (身份证校验码-18位)

假设某一17位数字是

17位数字 `1     2     3     4     5     6     7     8     9     0     1     2     3     4     5     6     7`

加权因子 `7     9     10    5     8     4     2     1     6     3     7     9     10    5     8     4     2`

计算17位数字各位数字与对应的加权因子的乘积的和S：
`1×7＋2×9＋3×10＋4×5＋5×8＋6×4＋7×2＋8×1＋9×6＋0×3＋1×7＋2×9＋3×10＋4×5＋5×8＋6×4＋7×2＝368；`

计算S÷11的余数T：
`368 mod 11＝5；`

((  余数0－10对应校验码为[1, 0, X , 9, 8, 7, 6, 5, 4, 3, 2]，算法如下 ))

计算（12-T）÷11的余数R，如果R＝10，校验码为字母“X”；如果R≠10，校验码为数字“R”：（12-5）mod 11＝7。
该17位数字的校验码就是7，聚合在一为123456789012345677。

## 实现-IdGen.Java

其他的字符串拼接都没什么，主要是校验码算法的实现calcTrailingNumber()方法

```
import java.util.*;
public class IdGen {
  public String generate() {
    StringBuilder generater = new StringBuilder();
    generater.append("110101");
    generater.append("20161110");
    generater.append(this.randomCode());
    generater.append(this.calcTrailingNumber(generater.toString().toCharArray()));
    System.out.println("31023019920622745" +" and  "+calcTrailingNumber("31023019920622745".toCharArray()));
    return generater.toString();
  }
  public char calcTrailingNumber(char[] chars) {
    if (chars.length < 17) {
      return ' ';
    }
    int[] c = { 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };
    char[] r = { '1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2' };
    int[] n = new int[17];
    int result = 0;
    for (int i = 0; i < n.length; i++) {
      n[i] = Integer.parseInt(chars[i] + "");
    }
    for (int i = 0; i < n.length; i++) {
      result += c[i] * n[i];
    }
    return r[result % 11];
  }
  public String randomCode() {
    int code = (int) (Math.random() * 1000);
    if (code < 10) {
      return "00" + code;
    } else if (code < 100) {
      return "0" + code;
    } else {
      return "" + code;
    }
  }
}
```
