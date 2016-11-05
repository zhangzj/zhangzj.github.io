---
layout: post
title:  "有必要背诵复杂算法的实现么？如何学习算法和数据结构？"
categories: 博客
tags:  算法 博客
---

* content
{:toc}





## 疑问

- 有没有必要亲手实现甚至是背诵复杂算法的实现？对于找工作的帮助有多大？还说是必须的？

- 复杂算法的熟悉程度是不是代表着一个程序员的水平？如何增强算法和数据结构能力？

- 怎么定义复杂算法这个词，多复杂算是复杂的，各种排序，红黑树，KMP，链表数据结构，什么是必须的，什么是理解为主？

## 小论

### **算法和数据结构学习的意义**

从码农到高级的程序员，实际上水平差别很大，对于算法，理解了之后不一定真正写出来能运行，运行的也不一定够健壮

基本要求就是，记住是什么，理解并钻研吃透，如果目标不仅仅是码农而是更高层次的程序员，那就是必须的素养，论程序员的自我修养

算法的的出现必然伴随着问题和应用场景，为什么这个算法会是最合适的解决方案，之后才是实现细节

**算法数据结构的必须**

面试笔试肯定会有算法和数据结构相关的内容，必须掌握，越多越好，自己用事件成本去权衡就好

如何衡量职业技能？如果没有履历背书，名校背景，基础知识和实际作品将会成为衡量的底线

刚毕业也好，贯穿整个职业生涯也罢，找工作相关的内容永不过时，只要大家觉得还有价值，面试官觉得需要掌握，那就需要

**内容层次的掌握**

凡事从简到难更符合规律，对于不同的水平的人，算法是否复杂也会得出不同的结论，凡人的难题对神人不值一提

字符串，数组，哈希表，二叉树等等这些简单常用并且也是常考的，之后红黑树就会更有底气，一步一步慢慢来

对于实现的熟悉和理解的确会代表一个程序员的部分水平，还是要学习一个

背诵默写代码本身，除了笔试的时候，基本上并没有什么用，对于一个的算法的学习要点还是要放在，算法本身是什么，目的，原理，应用场景，以及使用的方式方法；需要记住的点有，算法本身解决了什么问题，有哪些好处，以及其中的一些线索，这样子可以在需要的时候重新推导出来（和数学的学习方式有点相似）；如果再深入，就是优缺点和类似算法的横向比较，如何改进及优化

### **算法和数据结构的学习方式**

贴上Robert Love在Quora上写的文章，如何增强数据结构和算法能力下面的答案-[How do I strengthen my knowledge of data structures and algorithms?](https://www.quora.com/How-do-I-strengthen-my-knowledge-of-data-structures-and-algorithms/answer/Robert-Love-1)

Robert Love, Software Engineer at Google

I see it time and again in Google interviews or new-grad hires: The way data structures and algorithms—among the most important subjects in a proper computer science curriculum—are learnt is often insufficient. That's not to say students read the wrong books (see my recommendation below) or professors teach the wrong material, but how students ultimately come to understand the subject is lacking.

不是我们不努力，奈何敌人有高达，大家其实都有误区，不是老师不行，也不是学生不行，大概

The key to a solid foundation in data structures and algorithms is not an exhaustive survey of every conceivable data structure and its subforms, with memorization of each's Big-O value and amortized cost. Such knowledge is great and impressive if you've got it, but you will rarely need it. For better or worse, your career will likely never require you to implement a red-black tree node removal algorithm. But you ought be able—with complete ease!—to identify when a binary search tree is a useful solution to a problem, because you will often need that skill.

一般来讲你可能不会需要手撸一个算法实现出来，当然能撸出来算你厉害，但是实际上一般人的关键不在于纠结各个算法的细节；更有用的是，当你遇到某个特定问题的时候，知道哪一个算法是合适的解决方案，这才是关键

So stop trying to memorize everything. Instead, start with the basics and learn to do two things:

放下手中的笔，放弃单纯死记硬背手撸代码，开始做下面两件事情

- Visualize the data structure. Intuitively understand what the data structure looks like, what it feels like to use it, and how it is structured both in the abstract and physically in your computer's memory. This is the single most important thing you can do, and it is useful from the simplest queues and stacks up through the most complicated self-balancing tree. Draw it, visualize it in your head, whatever you need to do: Understand the structure intuitively.

数据结构的可视化，让算法生动起来，他们看起来是什么样子，用心感受一下。从最简单的结构到最复杂的结构，在脑中有一个直观的印象，无论如何要直观理解数据结构

- Learn when and how to use different data structures and their algorithms in your own code. This is harder as a student, as the problem assignments you'll work through just won't impart this knowledge. That's fine. Realize you won't master data structures until you are working on a real-world problem and discover that a hash is the solution to your performance woes. But even as a student you should focus on learning not the minutia details but the practicalities: When do you want a hash? When do you want a tree? When is a min-heap the right solution?

学习什么时候，以及用什么方式将不同的数据结构和算法应用到代码中。

One of the questions I ask in Google engineering interviews has a binary search tree as a potential solution (among others). Good candidates can arrive at the binary search tree as the right path in a few minutes, and then take 10-15 minutes working through the rest of the problem and the other roadblocks I toss out. But occasionally I get a candidate who intuitively understands trees and can visualize the problem I'm presenting. They might stumble on the exact algorithmic complexity of some operation, but they can respond to roadblocks without pause because they can visualize the tree. They get it.

As for a book, there is but one: Introduction to Algorithms by Cormen, Leiserson, Rivest, and Stein, otherwise known as CLRS.

算法书那必称算法导论，没话说

If you want another text, perhaps one with more examples in a specific language, I recommend Robert Sedgewick's Algorithms in C++ or Algorithms in Java, as appropriate. I prefer CLRS as a text, but you might find these a better teaching aid.

还有一些书咯，Algorithm in C++ 和 Algorithm in Java


- 数据可视化网站推荐

[Data Structure Visualization](http://www.cs.usfca.edu/~galles/visualization/Algorithms.html)

[VisuAlgo - visualising data structures and algorithms through animation](https://link.zhihu.com/?target=http%3A//visualgo.net/)

扩展一下思路，在学习其他的CS基础课的时候，都要扪心自问一些问题来拯救自己点歪的技能树，多问自己为什么会这么设计，要是自己来做会怎么办

下文引用自网络

> 学习操作系统，需要理解为什么会有OS这个东西，如何没有OS会怎么样；OS提供给用户哪些抽象、它又是怎么管理硬件的；进程是怎么管理和调度的，死锁是怎么产生和解决的，内存是怎么管理，文件系统有什么用以及是如何实现的，最好再就一个具体的操作系统（比如xv6）研究这些原理是怎么应用的；而不是开机启动的详细步骤，当然你知道最好。

> 学习计算机组成原理，需要理解的是为什么在这个高级语言泛滥的时代我们还需要学习汇编，计算机是如何一步一步发展到如今这个组成结构的，为什么单周期实现的cpu效率不高，之后的流水线cpu是如何改进单周期的以及其设计中的挑战是什么，由流水线引发的hazard有哪些以及怎么处理，forwarding又是怎么实现；而不需要背下来每一级流水线寄存器是哪些，因为现代cpu实现一般都是15级以上的流水线stage，除非你是cpu设计者否则背了根本没用。

>学习计算机体系结构，需要理解常用的并行方法，并知道每一种并行方法里的具体手段，比如instruction-level parallelism中，需要理解Instruction pipelining，Out-of-order execution，Register renaming，Speculative execution等技术到底干了什么达到改善的目的，知道这些的目的是为了帮助你在程序里合理地组织代码和数据来最好地发挥CPU功能，而不是为了让你设计一个新的CPU。另外，处理器设计中包括了许多工程实践中的很好的原则，学习它可以帮助你理解和解决别的领域的问题。

>学习编译原理，需要理解的是一个编译器实现的几个步骤（词法分析、语法分析、语义分析、运行时环境、中间代码、代码生成、代码优化）以及一些关键算法。学词法分析你需要理解状态机、学语法分析你至少需要知道LL自顶向下和LR自底向上的算法，以及为什么需要把我们的程序转成抽象语法树。学运行时环境需要理解程序是怎么存储、装载和执行的。代码优化的时候需要知道最常见的优化方法。

>学习计算机网络，需要理解的是整个全球互联网是怎么运作的以及5层模型（应用层、传输层、网络层、数据链路层、物理层）中上层和下层是怎么交互的。可能对大部分开发者有用的是应用层和传输层TCP/UDP的原理，重点是TCP原理的理解：为什么TCP是一个可靠协议？它为了“可靠”付出了什么代价？TCP为什么要握3次手而不是4次5次6次？为什么结束TCP连接需要4次挥手而不是5次6次？TCP的重传机制是怎么实现的？为什么要引入滑动窗口的概念？以及需要理解Congestion control的核心算法是怎样的。

>学习数据库原理，重点不是让你知道sql怎么写，而是让你理解如何设计正确的schema，在这个过程中为了消除数据冗余、插入/删除/修改异常会逼着你理解那几种范式（1NF、2NF，3NF，BCNF），以及思考一个功能完整、效率高的数据库是怎么实现，重点是原理的学习，比如在学习transaction的ACID性质的时候，这四点分别代表什么意思，以及是怎么实现它们的？如何实现一个高效的数据库这个话题就太大了，不展开了。

>总结一下，为了让自己更高效地学习这些课，介绍一个我一直在用的方法，就是在学习这些课的同时，不断地问自己，“这个设计/算法为什么是这样的，而不是那样的。如果让我来解决这个问题，我会怎么做”。



## 资源

### **算法相关的面试真题**

[Leetcode.com](https://leetcode.com/)

### **数据可视化网站**

[Data Structure Visualization](http://www.cs.usfca.edu/~galles/visualization/Algorithms.html)

搭梯子也无法访问的VisualGO-[VisuAlgo - visualising data structures and algorithms through animation](https://link.zhihu.com/?target=http%3A//visualgo.net/)

### **厉害的链接**

[朱佳顺同学的知乎](https://www.zhihu.com/people/zhu-js/about)

[朱佳顺同学的博客](http://lifeofzjs.com/)
