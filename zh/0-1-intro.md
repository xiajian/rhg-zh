---
layout: post 
title: 序章 导读
---

## Ruby的特征
----

读者当中，也许有人比较熟悉Ruby，不过，还有很多人不熟悉（在阅读本章之前，我倒是希望你不熟悉它）。 首先，就为那些不熟悉Ruby的读者介绍一下Ruby的特征。

在随后的文字中，需要注意区分一下。 大写字母开头的Ruby表示Ruby语言, 小写字母开头的ruby表示Ruby语言的实现。

### 开发形态

Ruby是松本行弘开发的一种计算机语言。它不像C、Java、Schema等语言那样拥有标准。 Ruby没有标准，ruby实现就是它的标准，而且这个实现还会经常变化，可能变好也可能变坏。

再者，ruby是自由软件……也就是说ruby的源代码是公开的， 无需对其支付任何费用，这两点必须首先声明，否则本书就失去了存在的基础。
阅读README和LEGAL可以准确的了解版权说明，总之，首先要记住以下几条规则：

- ruby的源代码可以再发布
- ruby的源代码可以修改
- 修改后的ruby源代码可以再发布

任何情况都无需要特别的许可或者费用。

本书以阅读原本的ruby源代码为目的，使用的是未经任何修改的源代码， 只不过在源代码中增加了一些空格、换行以及注释。

### 保守的语言

Ruby是一种保守的语言。Ruby选择的都是在其它计算机语言上广泛使用并验证过的设计、功能等， 没有什么新奇的功能或是实验性的设计。 因此，注重实用的人比较容易接受Ruby。 不过Ruby可能无法像Scheme, Haskell等那样，广受黑客们的爱戴。

程序库也是如此。新函数会有一个毫无省略的、简单易懂的名字， 不过，C或者Perl的程序库常用的名字得以保留，比如printf，getpwent，sub，tr等等。

ruby的实现同样保守，没有为了追求速度而使用汇编语言进行开发。 执行速度与可移植性发生冲突时，通常会倾向于可移植性。

### 面向对象的语言

Ruby是一种面向对象的计算机语言。这绝对是Ruby不得不提的一个特征。

本书省略了面向对象概念的介绍。谈到Ruby的面向对象， 本书将要解读的对象——ruby的源代码正是要说明这一概念。

### 脚本语言

Ruby是一种脚本语言。这也绝对是介绍Ruby时不得不提的一个特征。 如果介绍Ruby时，不谈到“面向对象的脚本语言”，大家是不会满意的。

但是，什么是脚本语言呢？脚本语言的概念并不是很明确。 比如Tcl/Tk的作者John K.Ousterhout的定义是`“在UNIX下使用#!执行的语言”`， 脚本语言还有其他的一些定义，比如`仅仅一行代码就能写出有用程序的语言`， `在命令行直接提交程序文件就能执行的语言（即无需编译）`等等。

不过，在这里我倒准备对Ruby采用别的定义。 为什么呢，因为我对“什么是脚本语言”不感兴趣。 把一种语言称为脚本语言，我只有一个标准， 如果称该语言为脚本语言，大家都没有异议的话，它就是脚本语言。 一般来说，我认为需要满足以下条件：

>  该语言的作者称其为脚本语言。

这个定义绝对没有问题。Ruby也确实满足这个条件，因此，我决定称Ruby为脚本语言。(^_^)

### 解释器（Interpreter）

ruby是解释器，这是事实。不过为什么是解释器？比如，编译器不行吗？ 因为解释器比编译器要好……(^_^)至少对Ruby来说是这样的。那么解释器好在哪呢？

考虑这个问题之前，先来想想解释器和编译器的不同之处。 仅从理论上比较程序执行过程的话，解释器和编译器没有什么区别。 编译器将程序翻译成机器语言在CPU上运行，解释器本质上也是同样运行。 那差异在什么地方呢？从现实的角度来看，也就是开发过程了。

说到这，有人会老生常谈的说，解释器无需编译，所以，时间会大为降低，开发很轻松。 我认为这种观点并不正确。编译语言完全可以做到不让开发者看到编译过程。 实际上Delphi就是这样，编码结束后按F5就能让程序执行。 有人说编译的时间长，那是因为如果程序代码比较长，程序优化比较花时间，编译本身并没有什么不好。

那么，为什么解释器和编译器给人的印象如此不同呢？ 我认为，这只不过是现在的语言开发者根据语言特征区分出的两种实现而已。 也就是说，如果构建小规模的日常工具，采用的语言通常是解释型的， 如果构建大规模的多人参与的项目，采用的语言通常是编译型的。 造成这种差异的原因，有执行速度，也有语言的易用性。

因此，我认为`“因解释而轻便”`是一个被夸大的神话。 一种语言并不会因为它是解释型而轻便，而是因为要将该语言做得轻便而自然的采用了解释的方式。

这里想再强调一下，“ruby是解释型的”这一事实将左右本书的方向。 解释的方式是不是让ruby变得更轻便，我们不得而知，总之，ruby采用了解释的方式实现。

### 高可移植性
ruby的核心接口是基于UNIX的，除此之外，ruby的可移植性应该说是比较高的。 ruby并不需要一些特殊的程序库，源代码中也没有大量的使用汇编语言。 因此，相对而言，ruby比较容易移植到新的平台上，它已经可以在以下平台上运行：

    Linux
    Win32（Windows 95、98、Me、NT、2000、XP）
    Cygwin
    djgpp
    FreeBSD
    NetBSD
    OpenBSD
    BSD/OS
    Mac OS X
    Solaris
    Tru64 UNIX
    HP-UX
    AIX
    VMS
    UX/4800
    BeOS
    OS/2 (emx)
    Psion
    WinCE

据说，ruby的作者Matz主要使用Linux, 如果用Linux编译的话，应该没有什么问题。

可以预期，基本上在UNIX类的系统上，ruby都可以稳定的工作。 考虑到追随软件包的速度，各种PC UNIX应该是现在探索ruby最有利的环境。

另一方面，不管怎么说，最容易出问题的还是Win32环境。 从OS的模型来看，Windows与linux(UNIX)完全不同，所以在机器栈、链接器等地方比较容易出问题。 不过，最近这些问题已经被Windows黑客们改善得七七八八了。 我在Windows 2000与Windows ME上使用native版本的ruby，轻易不会出现异常问题。 因此，我觉得Windows上的主要问题还是在规范方面。

其他大家比较感兴趣的OS还有Mac OS(v9 之前)和Palm等手持设备的系统。

ruby 1.2时，Mac OS还有对应，不过，最近这方面的开发陷入停滞，甚至编译都无法通过。 最大的原因恐怕是Mac OS的环境和开发者在减少。 然而，Mac OS基本上也是UNIX，因此不会有太大问题。

ruby在Palm上不能正常运行，没有听到已经将ruby移植到palm上的消息。 与其说ruby难于实现，倒不如说先要解决stdio的规范。 不过最近倒是传出移植到Psion的消息（[ruby-list:36028]）。

然后，就是最近成为话题的Java 和.NET的VM了。 这部分内容牵扯到ruby的实现，我们稍后会在最后一章中再次提及。

### 自动内存管理

从功能的角度上说，可以称之为垃圾回收（garbage collection，GC）。 无需C语言中的malloc()，free()等内存管理的函数。 系统可以自动检测并释放无用的内存。 这是一个很方便的功能，习惯GC之后，就不必再将手工内存管理放在心上。

最近的语言中，GC几乎成了`标准配置`，而不只是一个普遍的话题， 我们很高兴的看到，GC在算法上还有很多可以改善的空间。

> 思: 为毛GC成为了标配？   
> 答: 可以从多个方面回答这个问题，比如开发效率之类的。现代的语言要生存，就必须要获得用户，想GC这样明显对程序员友好的技术必然受到欢迎。毕竟，不是人人都能理解指针和内存管理这样细微的底层技术。编程语言的发展也沿着更高的抽象层次和更快的开发效率演进。

### 无类型变量(动态类型)

Ruby的变量是无类型的（即动态类型）。理由是为了让面向对象的最强武器之一——多态能够更好的得到运用。 当然，不是说静态类型变量的语言不能使用多态。只是无类型会让多态更易用而已。

这里的易用指的是使用简便。如果“以简单轻便为目标”是个长处的话，Ruby恰恰是以此为目标的。

> 思: 何为动态类型，何为静态类型，何为强类型，何为弱类型?  
> 答: 动态和静态之分在于，变量的类型是在运行前确定还是运行中确定，如果说某个语言是动态类型的，它必然能进行运行时类型推断或识别。强类型和弱类型之分在于不同类型变量之间是否可相互赋值或隐式装换，不能则强，能则弱，不能则强。

### 几乎所有的语法元素都是表达式

仅从字面上理解这项有些困难，这里稍微说明一下。比如，下面的程序在C语言中会引发语法错误：

{% highlight ruby %}
result = if (cond) { process(val); } else { 0; }
{% endhighlight %}

因为从C的语法来看，if是一个语句，不过可以这样写：

{% highlight ruby %}
result = cond ? process(val) : 0;
{% endhighlight %}

之所以可以这样写，因为条件运算符（a?b:c）从语法上来说是一个表达式。

另一方面，在Ruby中if是表达式，所以可以这样写。

{% highlight ruby %}
result = if cond then process(val) else nil end
{% endhighlight %}
粗略的说，函数和方法的参数都可以看作是表达式。

当然，还有其它“大部分语法是表达式”的语言。Lisp便是其中一例。 从这个角度来说，Ruby对于熟悉Lisp的读者来说，会有种似曾相识的感觉。

> 思: 如何理解“表达式”，如果说某一事物是表达式，那么它具有什么样的属性？  
> 答: 表达式，故名思义，表达某种东西的语言符号。计算机中的表达式，表达了某种计算的结果并返回某个值。大体看来，程序是由表达式构成的，比如Lisp中将数据和代码都看作数据，都是S表达式。总而言之表达式很强大就是了，具体个人也没个透彻的理解。

### 迭代器

Ruby中实现了迭代器。什么是迭代器呢？哦，迭代器这个词最近不太受欢迎，也许应该使用另外的词。 然而，实在想不出什么好的词，目前只好继续使用“迭代器”。

那么，到底什么是迭代器呢？如果你了解`高阶函数`(使用函数作为参数的函数)，可以把迭代器想象成与高阶函数类似的东西。 如果是C语言的话，迭代器就相当于作为参数传递的函数指针。 在C++中，它对应于STL Iterator方法封装的操作部分。 如果以sh或Perl解释的话，它就像可以单独定义的for循环语句一样。

枚举至此，都是些“像什么一样”，没有一种语言的迭代器与Ruby的迭代器完全相同。 等真正谈到迭代器的时候，再进行严谨一些的讨论吧！

### 用C编写的语言

时至今日，用C编写的程序并不罕见。因此，把它作为一个特征应该没有什么问题。 至少ruby不是用`Haskell`或者`PL/I`编写的，这让一般读者读懂的可能性提高了一些 （至于是否真的是这样，我也希望可以考证一番）。

虽说是用C编写，但ruby用的基本上是K&R C。稍早之前有K&R only的环境，如果不是很多，至少还有。 如今不含ANSI C的环境近乎绝迹，不过，从技术上来说，转移到ANSI C不存在什么问题。 即便如此，ruby的作者Matz还是根据个人兴趣选择了K&R风格(由经典的`C Programming Language`一书所定义的风格)。

因为函数定义全部采用K&R风格，所以，函数原型并没有得到很好的定义。 用gcc 编译时若加上–Wall会出现大量的警告，用C++编译器编译的时候， 会出现函数原型无法正确匹配导致不能编译的现象……等等之类的话题都可以在邮件列表中找到。

> 所谓K&R的风格，大体函数定义和缩进格式如下:
{% highlight ruby %}
//函数示例来自ruby/bignum.c
static VALUE
rb_big_odd_p(VALUE num)
{
    if (BIGNUM_LEN(num) != 0 && BDIGITS(num)[0] & 1) {
	return Qtrue;
    }
    return Qfalse;
}
{% endhighlight %}
> 目测，个人确实是无法喜欢上这种风格

### 扩展程序库

Ruby的程序库可以直接用C编写，无需Ruby再次编译就直接可以加载, 这样的程序库通常称为`Ruby的扩展程序库`或者直接叫做`扩展程序库`。

不仅是可以用C编写，扩展程序库最突出的特点是Ruby层次和C层次的差异极小。 Ruby中可以使用的命令几乎在C中也能直接使用，比如像下面这样。
{% highlight ruby %}
# 调用方法
obj.method(arg)                                 # Ruby
rb_funcall(obj, rb_intern("method"), 1, arg);   # C

# 调用块(block)
yield arg        # Ruby
rb_yield(arg);   # C

# 抛出异常
raise ArgumentError, 'wrong number of arguments'       # Ruby
rb_raise(rb_eArgError, "wrong number of arguments");   # C

# 生成对象
arr = Array.new             # Ruby
VALUE arr = rb_ary_new();   # C
{% endhighlight %}

使用扩展程序库如此轻松,这也造就了现实中ruby的无可替代。 不过这也同时成为了ruby语言实现(解释器)的沉重脚镣，其影响随处可见。 特别是对GC和线程的影响最为显著。
线程

Ruby中有线程。因为几乎没有不知道线程的读者， 所以，这里就不再为“什么是线程”多费口舌了。以下是一些更为细节的讨论。

ruby的线程是独创的`用户级线程`。这使得它在规范和实现两方面都具备非常高的可移植性。 这样的线程即便在DOS上也可以运行，不管用在什么地方，ruby线程都能够产生同样的动作。 许多人将此视为ruby最大的优点。

不过，ruby线程无与伦比的可移植性带来的反面效果是极大的牺牲了运行速度。 到底牺牲了多少？世界上所有计算机语言的所有用户级线程中,ruby的线程几乎是最慢的。 这个特点也明确的表现出ruby实现的倾向(可移植性高于性能的原则)。

## 阅读源代码的技术
----

接下来，有关ruby特点的介绍告一段落，终于要进入源代码的阅读了，不过，请稍等!

阅读源代码,是每个程序员必做的一件事。 不过，对于“如何阅读源代码”，程序员们却没有很具体方法。为什么会这样？ 很简单，能写自然会读。

不过，我却也认为阅读别人的代码并不简单。同写代码一样，读代码肯定也有一些必需的技术或定式。 因此阅读ruby源码之前，让我们整理一下思路，看看阅读代码有什么通用方法。

### 原则(Principles)

做人，最重要的要讲良心、讲原则。原则性问题是很重要的问题，所以，在阅读源码之前，先来谈谈原则。

#### 确定目标

“阅读代码的最高境界是带着目的去读。”

这句话来自Ruby的作者Matz。的确是这样，这句话非常能够得到大家的肯定。 “是时候读读内核代码了”，于是打开一大堆代码，买来一大堆参考书， 结果却是不知从何下手，相信有此经验的人不在少数。 另一方面,“这个程序有bug，不尽快修复就赶不上交付日期……”的时候， 即便是别人的程序也能在转瞬之间将问题搞定，这种事是不是也曾发生过？

这两种情况的差异就在于，人的主观意识不同。 `如果自己不知道自己要弄懂什么，肯定什么都不会弄懂。` 所以，首先搞清楚自己想要了解什么，明确目标是所有行动的第一步。

当然，仅仅这样不足以称之为“技术”。 所谓技术,是指无论是谁只要有意识的去了解，就肯定能够了解的东西。 接下来的讨论，就从“迈出第一步到最终达成目的”所用到的方法开始。

#### 具体化目标

现在，我们最终的目标是`“理解ruby的一切”`。 即便这勉强算确定了目标，但到底怎样实际的阅读代码还是没有明确。 因为没有与具体的工作联系到一起。因此，必须先把这个暧昧的目标明确化。

具体该怎么做呢?首先，假想自己就是编写这个程序的人。 这个时候，编写一个这样的程序所用到的知识自然就会运用到阅读程序上来。 比如，阅读传统的结构化程序，自己也要用结构化的方法进行思考。即逐步分割目标。 又如，类似于GUI的程序总要进入事件循环，首先，粗略的阅读整个事件循环，然后，找出每个时间处理器的作用; 或者，先从MVC（模型-视图-控制器 Model View Controller）中的M(模型)着手调查。

再者就是有意识的`选择分析方法`。 无论是谁都会有一套自己的分析方法，不过，自己的方法通常是建立在经验和直觉的基础上。 怎样做才能更好的阅读源码呢？自己的思考和意识非常重要。

都有哪些分析方法呢？下面就来说明一下。

### 分析方法

阅读代码的手法大体上可以分为`静态方法`和`动态方法`两种。 静态方法是指不运行程序对代码进行阅读和分析。 动态方法是指运用`调试器`等工具观察程序的实际运行过程。

研究代码最好从动态分析入手。 因为它就是“事实”。静态分析并不运行程序，所以或多或少带有“预测”的成分。 如果希望了解真相，那么我们应该从事实起步。

当然，动态分析的结果是否真的是事实也未可知。 也许调试器有错误，也许CPU过热死机，也许自己设错了条件…… 即便如此，动态分析还是比静态解析更接近事实。

### 动态分析

#### 使用目标程序

缺少这一步便无法开始。 这个程序是个什么样的东西，它可以完成哪些操作，这些都是我们应该预先知道的。

#### 使用调试器追踪程序运行

比如，“实际的代码经过了哪里，采用了怎样的数据结构”之类的问题， 与其在脑中思考，不如实际运行程序之后看结果来得更快。 调试器会让这个工作变得简单。

如果能将程序运行时的数据结构画成图，那就太棒了。 不过这样的工具实在难找(特别是自由的很少)。 比较简单的数据结构快照可以用文本表示，也可以使用一个叫graphviz(UNIX下的绘图工具，可以参考[我的博客](http://blog.csdn.net/xiajian2010/article/category/2194659))的工具， 不过，如果以通用和实时为目标，那就比较难了。

#### Tracer

如果想了解代码经过了哪些过程，那就应该使用tracer。 如果是C话，有一个叫ctrace的工具。 此外，系统提供的tracer还有strace, truss, ktrace等工具。
到处打印

有一种说法叫“打印调试”。即便算不上什么调试技术，这种方法依然很有用。 观察特定变量的变化时，与其一点点的用调试器追踪，不如嵌入打印语句， 这样，只要把结果搜集起来就可以了。
改写后运行

对于程序不易理解的地方，可以稍微修改参数和代码，尝试运行。 修改可以运行的话，就可以推测出代码的行为。

不用说，应该预留原来的二进制文件，让二者去做同样的事情。
静态分析
名称的重要性

静态分析就是通过阅读代码进行分析，对源码的分析就是对名称的调查： 文件名、函数名、变量名、类型名、参数名等等，程序本身就是一个名称的集合。 名称是程序抽象化的最大武器，如果认识到这一点，那么阅读的效率就会有很大的不同。

另外，还要注意编码规则。比如，如果是C的函数名， 为了区分函数种类，会给extern函数加上许多前缀。 如果程序是面向对象的风格，函数的归属信息都会放在前缀中，使之成为重要的信息（比如：rb_str_length)。
阅读文档

也许会有解释内部构造的文档。特别要注意名为“HACKING”的文件。
阅读目录结构

通常目录都是根据某些策略进行划分的。 了解程序可以分为哪些部分，把握各部分的概要。
阅读文件构成

结合文件中的函数（名），了解文件划分的策略。 类似于程序注释，文件名是一种保质期很长的东西，应该得到特别的重视。

另外，如果文件中还有模块（module），构成这个模块的函数在文件中应该放到接近的地方。 也就是说，根据函数的排列顺序就可以了解模块的组成。
调查缩略语

若有晦涩难懂的缩略语，应预先列出，提早调查。 比如，“GC”究竟是Garbage Collection，还是Graphic Context,二者的含义相去甚远。

程序相关的缩略语大多是通过“取单词的首字母，省略元音字母”的方法形成的。 特别要注意的是，目标程序的领域中一些已广为接受的缩略语应该预先弄清楚。
了解数据结构

如果数据和代码放在一起，应该首先从数据构造看起。 也就是说，如果是C的话，从头文件入手是个不错的选择。 这时，可以最大限度的发挥想象力，根据文件名进行推测。 比如，在语言处理系统中有一个叫frame.h的头文件，它可能就定义了栈帧（stack frame）。

此外，结构体的类型和成员的名称也会给人许多启示。 比如，如果结构体中有一个指向结构体自身的指针next，会联想到这可能是一个链表。 同样，如果存在诸如parent/children/sibling等元素，该结构体十有八九是树（tree）。 如果有prev，可能就是堆栈。
把握函数间的调用关系

函数之间的关系是仅次于名称的重要信息。 有一种表现函数间调用关系的图，称为调用图（call graph），它的确很方便。

对于这个工具，基于文本的方式已经够用了，但如果能用图的话，那就更没得说了。 只是这么方便的工具很少（自由的尤其少）。 我为本书分析ruby时，用Ruby写了一个小命令语言解析器， 然后，将结果传给那个叫做graphviz的工具，进行半自动生成。
阅读函数

阅读函数的动作，用一句话来概括它的行为。 看着函数关系图来阅读函数的各个部分还是不错的。

阅读函数时候，重要的不是“读什么”，而是“不读什么”。 可以说，削减了多少代码决定了阅读的难易程度。 具体如何进行正确的削减，很难在这里演示，因此，这部分会放在正文中解释。

编码风格不符合自己的习惯时，可以用indent之类的工具进行转换。
按个人喜好改写代码

人体很奇妙，尽可能使用身体的各个部分去做的事情，很容易留下记忆。 认为“草稿纸好于PC键盘”的大有人在，我想，如果不是单纯的怀古，与此还是有些关系的。

所以，仅仅对着屏幕阅读是无法记忆到身体中的， 应该尝试一下边读边改，代码就会比较快的融入身体之中。

遇到不顺眼的名字和代码就要毫不犹豫的改写。 将那些晦涩难懂的缩略语以它未省略的形式替换掉。

当然，改写时应该单独预留一个原有代码的备份。 修改途中遇到问题，可以通过对比原有代码进行确认。 为一个简单的错误而陷入几小时苦恼的困境中，得不偿失。 改写是为了熟悉代码，改写本身不是我们的目的，希望不会投入太多热情。
阅读历史

程序一般都会有一个文档，记载着变更的历史。 比如，GNU的软件必定有一个名为Changlog的文件，对于了解“程序演变的原因”很有帮助。

如果使用了诸如CVS和SCCS这样的版本管理系统，并可以直接进行访问的话，会比Changelog更具价值。 以CVS为例，了解特定行最近的修改用cvs annotate，比较特定版本的差异用cvs diff，等等。

此外，最好能够直接从开发用的邮件列表和新闻组中检索过往的记录，其中常常记载了变更的理由。 当然，如果能直接从Web上搜索就更好了。
用于静态分析的工具

不同的目的有不同的工具对应，不能一概而论。如果只让我选一个的话，我会推荐global。

这么选择是因为它很容易用于其它的用途。 比如，其中包含的gctags原本是为了制作tag文件，不过，也可以用它取出“文件所包含的函数”的名称列表。

~/src/ruby % gctags class.c | awk '{print $1}'
SPECIAL_SINGLETON
SPECIAL_SINGLETON
clone_method
include_class_new
ins_methods_i
ins_methods_priv_i
ins_methods_prot_i
method_list
        ：
        ：

虽说如此，这只不过是我的推荐，读者使用何种工具取决于个人喜好。 不过，选择的工具至少应该具备以下功能：

    能够列出“文件所包含的函数”的名称
    能够搜索函数名、变量的位置（能够直接跳转到那的更好）
    函数的交叉索引

构建
目标版本

本书解说的ruby版本为1.7的2002-09-12版。 对于ruby来说，minor版本号为偶数是稳定版，奇数是开发版，所以，1.7是开发版。 而9月12日的这个版本没有什么特殊含义，所以，并没有对应官方发布包。 这个版本可以通过CD-ROM或本书的支持站点（ http://i.loveruby.net/ja/rhg ）获得， 或者后面提到的CVS。

没有选择稳定版1.6而选择1.7，是因为1.7在规范和实现两个方面都经过重新整理，更容易处理。 其次，最新的开发版使用CVS更容易。再者，下一个稳定版1.8即将推出。 最后，阅读最新代码的心情会比较好。
获取源代码

附赠的CD-ROM里收录了这次解说的目标版本。在CD-ROM的顶级目录下有

    ruby-rhg.tar.gz
    ruby-rhg.zip
    ruby-rhg.lzh

这里放置了三种类型的文件，请自行挑选使用。 当然，其内容是一致的。以tar.gz的包为例，这样展开：

~/src % mount /mnt/cdrom
~/src % gzip -dc /mnt/cdrom/ruby-rhg.tar.gz | tar xf -
~/src % umount /mnt/cdrom

编译源码

仅仅“看”代码也算是阅读。但是，为了了解程序，实际的使用、改造，以及做一些试验也是必要的。 实验时只用原来的代码就失去了意义，自然要自己来编译。

这里说明一下编译的方法。首先从UNIX类的OS说起。在Windows上编译有不少差异，在随后一节中讨论。 不过，我还是希望你继续读下去，因为Windows上的Cygwin与UNIX非常接近。
在UNIX类OS上构建

在UNIX类OS上，C编译器是标准配置，按照下面的顺序来做，基本都能通过。这里假设源码解开到~/src/ruby。

~/src/ruby % ./configure
~/src/ruby % make
~/src/ruby % su
~/src/ruby # make install

接下来说说应该注意的几点。

在Cygwin、UX/4800等一部分的平台上，configure不加-enable-shared选项会导致连接失败。 -enable-shared是“将ruby的主要部分作为共享程序库（libruby.so）提供给外部”的选项。

~/src/ruby % ./configure --enable-shared

附赠CD-ROM中的doc/build.html中有一个详尽的教程，可以边读边尝试一下。
在Windows上构建

在Windows上的构建比较复杂，问题的根源在于有许多构建环境。

    Visual C++
    MinGW
    Cygwin
    Borland C++ Compiler

首先是Cygwin环境，它与UNIX环境非常接近，遵循UNIX类的构建方法就可以了。

用Visual C++ 编译的话，前提条件是Visual C++ 5.0以及以上版本。版本6和.NET应该没有问题。

MinGW, Minimalist GNU for Windows，是将GNU的编译环境（包括gcc和binutils）移植到Windows上。 同Cygwin整体移植UNIX相比，MinGW只移植了编译所需要的工具。 此外，使用MinGW编译的程序运行时并不需要特殊的DLL文件。 也就是说，用MinGW编译的ruby可以与用Visual C++编译的版本同等对待。

如果只是个人使用的话，还可以从Borland的网站上免费下载Borland C++ Compiler的5.5版。 它最近才开始支持ruby，多少有些顾虑，不过，在本书出版之前的构建试验并没有发现什么特别的问题。

如何在上述4个环境中做出选择呢？首先，推荐Visual C++，因为基本上它极少出问题。 如果有UNIX经验，放上一套完整的Cygwin，使用Cygwin也是个不错的选择。 没有UNIX经验，也没有Visual C++，不妨试试MinGW。

下面说明一下Visual C++和MinGW的构建方法，不过，只是一些概要。 更详尽的解释和在Borland C++ Compiler上的构建方法，请适当参考附赠CD-ROM中的doc/build.html。
Visual C++

谈到Visual C++，通常并不使用IDE，而是在DOS提示符下进行构建。 为了运行Visual C++本身，首先要初始化环境变量。 Visual C++中有完成这个工作的批处理文件，先来执行它。

C:\> cd "\Program Files\Microsoft Visual Studio .NET\Vc7\bin" 
C:\Program Files\Microsoft Visual Studio .NET\Vc7\bin> vcvars32

这是Visual C++ .NET的情况。版本6在下面这个位置。

C:\Program Files\Microsoft Visual Studio\VC98\bin\

执行过vcvar32，转到ruby源码树的win32文件夹，构建就可以了。以下假定源码树在c:\src。

C:\> cd src\ruby
C:\src\ruby> cd win32
C:\src\ruby\win32> configure
C:\src\ruby\win32> nmake
C:\src\ruby\win32> nmake DESTDIR="C:\Program Files\ruby" install

这样执行之后，ruby命令安装到C:\Program Files\ruby\bin下，ruby的程序库安装到C:\ Program Files\ruby\lib下。 因为ruby完全没有使用注册表，卸载的话，只要删除C:\Program Files\ruby即可。
MinGW

如前所述，MinGW只是一个编译环境，它没有一般UNIX的一些工具，比如sed, sh。 不过，构建ruby需要它们，因此，要从别的地方获得。有两种方法，Cygwin或者MSYS(Minimal SYStem)。

不过，在本书出版之前，MSYS在构建中接连出现问题，因此，不是特别推荐。 相对而言，使用Cygwin就可以顺利通过。因此，本书介绍的是使用Cygwin的方法。

将Cygwin的setup.exe同MinGW及开发工具集放在一起。Cygwin和MinGW都在附赠的CD-ROM中。 之后，在Cygwin的bash提示符下这样敲：

~/src/ruby % ./configure --with-gcc='gcc -mno-cygwin' \
                                 --enable-shared i386-mingw32
~/src/ruby % make
~/src/ruby % make install

就是这样。虽然这里configure所在行换行了，但它实际是一行，反斜线其实并不需要。 安装的位置是编译驱动器的\usr\local\下。这个部分比较麻烦，说明比较长，更多细节请参照附赠CD-ROM中的doc/build.html。
构建详解

到这里都是些类似于README的说明。这次要试着深入一下，看看具体做了些什么。 然而，这里的内容可能需要部分高级知识。遇到不理解的地方，可以先跳到下面一节。读完全书之后再回来看，应该就可以理解了。

无论什么平台，ruby的构建都可以分为3个阶段，即：configure, make, make install。 这里抛开make install，对configure, make进行解说。
configure

首先是configure。其内容是一个shell脚本，用它检测系统参数。 比如，检查“头文件setjmp.h是否存在”、“alloca()能否使用”。 检查的方法出乎意料的简单。
检查目标 	方法
命令 	实际运行并查看$?
头文件 	if [ -f $includedir/stdio.h ]
函数 	试着编译一些小程序，看是否可以成功连接

找出差异之后，无论如何都要传出来。至于方法，首先可以用Makefile。 在Makefile.in中留下类似于@PARAM@的嵌入参数，生成Makefile时会把它转换为一个实际的值。 比如像下面这样。

Makefile.in:  CFLAGS = @CFLAGS@
                     ↓
Makefile   :  CFLAGS = -g -O2

再有一种方法，将函数和头文件是否存在的信息输出到头文件中。输出文件的名字根据程序而不同， 在ruby中是config.h。执行configure之后，确认是否生成了这个文件。内容大概是这样。
▼ config.h

         ：
         ：
#define HAVE_SYS_STAT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRING_H 1
#define HAVE_MEMORY_H 1
#define HAVE_STRINGS_H 1
#define HAVE_INTTYPES_H 1
#define HAVE_STDINT_H 1
#define HAVE_UNISTD_H 1
#define _FILE_OFFSET_BITS 64
#define HAVE_LONG_LONG 1
#define HAVE_OFF_T 1
#define SIZEOF_INT 4
#define SIZEOF_SHORT 2
         ：
         ：

每个都很容易理解。HAVE_xxxx_H用以检查头文件是否存在，SIZEOF_SHORT表示C的short类型是多少个字节。 同样，SIZEOF_INT是int的字节长，HAVE_OFF_T表示是否定义了offset_t类型。 在configure中，“有/没有”的信息都定义成HAVE_xxxx宏。

从上面可以了解到，configure可以检测出差异，但是，差异并不能自动处理。 使用这里定义的值，填补这些差异是程序员的工作。
▼ HAVE_宏的典型用法

  24  #ifdef HAVE_STDLIB_H
  25  # include <stdlib.h>
  26  #endif

(ruby.h)

autoconf

configure并非ruby的专用工具。是否有这个函数，是否有这个头文件……的试验明显都是有规则的， 大家各写一份显然是浪费。

这里就该autoconf登场了。在configure.in或configure.ac中写下“做这样的检查”， 然后用autoconf处理，生成适当的configure。configure.in中的.in是input的缩写。 等同于Makefile和Makefile.in的关系。.ac当然是autoconf的缩写。

图1显示了迄今为止的过程。

直至Makefile完成
图1: 直至Makefile完成

对于希望进一步了解的读者，推荐《GNU Autoconf/Automake/Libtool》。

对了，据说ruby的configure是用autoconf生成的，世间的configure未必都是用autoconf生成的。 也有用手写的，或是其它自动生成工具的。无论如何，只要最终生成Makefile、config.h或其它变体就好。
make

第二阶段，make做了些什么呢？当然，应该是编译ruby的源码，但查看make的输出信息， 可以看到还做了其它一些事情。简单说明一下这个过程。

    编译构成ruby自身的源码。
    创建聚集了ruby主要部分的静态程序库libruby.a。
    创建经常用于静态连接的ruby(miniruby)。
    --enable-shared的时候创建共享程序库libruby.so。
    使用miniruby编译扩展程序库（ext/下面）。
    最后，生成真正的ruby。

将miniruby和ruby分开生成有两个原因。一是编译扩展程序库需要ruby。 在--enable-shared的情况下，ruby本身是动态连接的，由于程序库加载路径的关系， 不能立即运行。创建出静态连接的miniruby就可以用于构建过程。

第二个原因是，在一些不能使用扩展程序库的平台上，扩展程序库可能要静态连接到ruby上。 在这种情况下，ruby要在编译全部扩展程序库之后才能创建出来，但是，没有ruby又不能编译扩展程序库。 为了消除这个矛盾，用到了miniruby。
CVS

无论是本书附增CD-ROM中的ruby存档，还是官方发布包，都不过是ruby程序不停变化中一个瞬间的快照。 其中并没有描述ruby如何变化以及为什么变化。那么要了解包括过去在内的全部该怎么办呢？ 使用CVS就可以做到。
什么是CVS

一句话概括，CVS就是编辑器的undo列表。如果预先源码放到CVS下管理，无论何时， 都可以让它返回到之前的样子，立刻可以知道谁在什么时候改变了哪里。 开放源码的世界中，最著名的源码管理系统就是CVS。

ruby使用了CVS进行管理，这里稍微解释一下CVS的机制和使用方式。 CVS中最重要的概念是repository和working copy。之前说过，CVS类似于编辑器的undo列表， 因此有必要将变更记录保存在什么地方。将所有这些全部保存在一起的地方就是“CVS repository”。

也就是说，repository聚集了过去所有的源码。当然，这只是概念上而已，实际上为了节省容量， 它只是以最新版本和变更差异（补丁）的形式进行累积。无论怎样，取出过去某个时刻的文件都是可以的。

另一方面，从repository选择的某个点取出的文件叫做working copy。 repository只有一个，而working copy可以有很多。（图2）

repository和working copy
图2: repository和working copy

想修改源码时，先取出一个working copy，用编辑器编辑之后，再“返还”到repository。 随即变更就会记录在repository中。从repository取出working copy叫做checkout， 返还到repository叫做checkin或commit。检入时repository会记录变更， 这样，无论何时都可以取出。

checkin和checkout
图3: checkin和checkout

CVS的最大特征就是跨越网络访问CVS repository。也就是说，只要有一个维护repository的服务器， 每个人在任何地方都可以通过互联网进行检入检出。然而，通常checkin会受到访问限制，而不是无限制的。
修订版

怎样从repository中取出特定的版本呢？有一种方法是指定时间。 “给出当时最新的版本”，它按请求做出选择。然而，实际中指定时间的方法不大常用。 一般会使用“修订版（revision）”。

“修订版”和“版本”的意义几乎相同。因为项目本身都会有一个“版本”，所以，版本这个词容易造成混淆。 在这里，用“修订版”这个词表示更细小的单位。

在CVS中，刚放到repository的文件其修订版是1.1。检出，修改，检入，修订版就成了1.2。 接着是1.3，接着是1.4。
CVS使用的简单例子

基于上面的讨论，再来谈谈CVS的使用方法。首先，没有cvs命令什么都做不了，所以，需要先安装。 cvs的源码收录在附赠的CD-ROM中。cvs的安装方法偏离了本书的主题，这里就不介绍了。

安装之后，可以试着检出ruby的源码。在接入互联网的情况下，如下键入。

% cvs -d :pserver:anonymous@cvs.ruby-lang.org:/src login
CVS Password: anonymous
% cvs -d :pserver:anonymous@cvs.ruby-lang.org:/src checkout ruby

没有选项的话，会自动检出最新的版本，所以，ruby/下面应该出现真正最新版的ruby。

要取出某天的版本，给cvs checkout加上-D就可以了。 像下面这样键入可以取出本书解释这个版本的working copy。

% cvs -d :pserver:anonymous@cvs.ruby-lang.org:/src checkout -D2002-09-12 ruby

这个时候需要注意，参数必须紧接着写在checkeout后面。 先写“ruby”的话，会出现“没有组件”的奇怪错误。

顺便说一下，像例子这样以anonymous访问是不能检入的。 要练习检入，不妨在本地建立一个repository，试着将Hello, World!程序放入其中也不错。 具体放入的方法就不在这里写了。cvs附带的手册就很不错。
ruby的组成
物理结构

接下来可以看看源码了，不过，什么是必须先做的事呢？ 那就是查看目录结构。一般情况下，目录结构表示的就是源码树的模块组成。 直接grep出main()，以此开头读按顺序读下去，这种做法并不明智。 当然，查找main()也很重要，但首先应该用ls和head去把握全貌。

以下是从CVS repository中检出之后顶层目录的样子。“/”结尾的是子目录。
COPYING 	compar.c 	gc.c 	numeric.c 	sample
COPYING.ja 	config.guess 	hash.c 	object.c 	signal.c
CVS/ 	config.sub 	inits.c 	pack.c 	sprintf.c
ChangeLog 	configure.in 	install-sh 	parse.y 	st.c
GPL 	cygwin/ 	instruby.rb 	prec.c 	st.h
LEGAL 	defines.h 	intern.h 	process.c 	string.c
LGPL 	dir.c 	io.c 	random.c 	struct.c
MANIFEST 	djgpp/ 	keywords 	range.c 	time.c
Makefile.in 	dln.c 	lex.c 	re.c 	util.c
README 	dln.h 	lib/ 	re.h 	util.h
README.EXT 	dmyext.c 	main.c 	regex.c 	variable.c
README.EXT.ja 	doc/ 	marshal.c 	regex.h 	version.c
README.ja 	enum.c 	math.c 	ruby.1 	version.h
ToDo 	env.h 	misc/ 	ruby.c 	vms/
array.c 	error.c 	missing/ 	ruby.h 	win32/
bcc32/ 	eval.c 	missing.h 	rubyio.h 	x68/
bignum.c 	ext/ 	mkconfig.rb 	rubysig.h
class.c 	file.c 	node.h 	rubytest.rb

近来，随着程序本身变大，也划分出更多细小的子目录，ruby在相当长一段时间里都只有一个顶层目录。 有大量的文件当然麻烦，但是如果是这种程度，应该算不了什么。
顶层文件可以分为六类。也就是

    文档
    ruby自身的源码
    构建ruby所需的工具
    标准扩展程序库
    标准Ruby程序库
    其它

确实，源码和构建工具很重要，还有其它一些很有用的东西。

    ChangeLog

ruby的变更记录。了解变更的理由也很重要。

    README.EXT README.EXT.ja

记录着扩展程序库的编写方法，作为其中的一环，其中记录了ruby的一些实现。
源码分类

这里要对ruby自身的源码进行更细小的划分。 主要文件的分类都写在README.EXT里，只需遵循即可。我把其中一些没有记录的文件也进行了分类。
Ruby语言的核心
class.c 	类相关API
error.c 	异常相关API
eval.c 	评估器
gc.c 	垃圾回收器
lex.c 	保留字一览
object.c 	对象系统
parse.y 	解析器
variable.c 	常量、全局变量、类变量
ruby.h 	ruby主要的宏和函数原型
intern.h 	ruby C API的函数远行, 一般认为intern是internal的简写，扩展程序库使用这里记录的函数也没有问题
rubysig.h 	存放信号相关宏的头文件
node.h 	语法树节点相关定义
env.h 	表示评估器上下文结构的定义

这些就是ruby解释器的核心部分。这里的文件就是本书解说的主要部分。 同ruby的文件总数相比，这只是很小的一部分，不过，按字节算，则占了近50%。 特别是，200K字节的eval.c和100K字节的parse.y都很大。
实用程序
dln.c 	动态加载器
regex.c 	正则表达引擎
st.c 	hash表
util.c 	基数转换、排序等程序库。

这是对ruby而言的实用程序。从实用程序这个词很难想到其中也有大东西。 比如，regex.c有120K字节。
ruby命令的实现
dmyext.c 	dummy扩展（DumMy EXTention）程序库的初始化例程
inits.c 	核心和程序库初始化例程的入口点
main.c 	命令的入口点（无需libruby）
ruby.c 	ruby命令的主要部分（需要libruby）
version.c 	ruby的版本

在命令行键入ruby执行时需要有ruby的实现。这个部分解释命令行的选项。 在ruby命令以外，使用ruby核心的命令包括mod_ruby和vim等等。 这些命令链接了libruby程序库（.a/.so/.dll）。
类库
array.c 	class Array
bignum.c 	class Bignum
compar.c 	module Comparable
dir.c 	class Dir
enum.c 	module Enumerable
file.c 	class File
hash.c 	class Hash（实际是st.c）
io.c 	class IO
marshal.c 	module Marshal
math.c 	module Math
numeric.c 	class Numeric、Integer、Fixnum、Float
pack.c 	Array#pack、String#unpack
prec.c 	module Precision
process.c 	module Process
random.c 	Kernel#srand()、rand()
range.c 	class Range
re.c 	class Regexp（实际是regex.c）
signal.c 	module Signal
sprintf.c 	ruby专用的sprintf()
string.c 	class String
struct.c 	class Struct
time.c 	class Time

Ruby的类库实现。这里的东西基本上采用与通常Ruby扩展程序库同样的方法实现。 也就是说，这里的程序库可以作为编写扩展程序库的例子。
平台相关文件
bcc32/ 	Borland C++（Win32）
beos/ 	BeOS
cygwin/ 	Cygwin（Win32的UNIX仿真层）
djgpp/ 	djgpp（DOS下的自由开发环境）
vms/ 	VMS（以前DEC发布的OS）
win32/ 	Visual C++（Win32）
x68/ 	Sharp X680×0系列（OS是Human68k）

这里是平台相关的代码。
fall back函数
missing/

弥补各个平台缺失的文件，主要是libc函数居多。
逻辑组成

上面核心的四组大致可以分为三类。第一类创建出Ruby的对象世界，“对象空间（object space）”。 第二类是将Ruby程序（文本）转换为内部形式的解析器（parser）。 第三类是驱动Ruby程序的评估器（evaluator）。解析器和评估器都建立在对象空间之上， 解析器将程序转换为内部形式，评价器驱动着程序。下面就按顺序解释一下。
对象空间

首先是对象空间。这个非常容易理解。这么说是因为，其操作的所有东西基本上都在内存之中， 用到它们的函数可以直接显示和操作。因此，本书就先从这里开始解释。 第2章到第7章是第一部分。
解析器（parser）

其次是解析器。这个有必要解释一下。

ruby命令就是Ruby语言的解释器。也就是说，启动时分析输入的文本，随后执行。 ruby必须解释写成文本的程序的含义，不幸的是，文本对于计算机来说，很难理解。 文本文件对计算机来说最终就是字节序列。为了掌握文本的含义，需要借助一个特殊的东西。 这个东西就是解析器。通过解析器，Ruby程序（文本）转换为ruby专用的、易于处理的内部结构。

所谓内部结构具体来说就是“语法树”。语法树就是将程序表现为树的结构。 比如，if语句就会表现为图4这样。

if语句，及其对应的语法树
图4: if语句，及其对应的语法树

在第二部分“语法分析”中，会对解析器进行解释。第二部分从第10章到第12章。 解释的对象只有一个文件：parse.y。
评估器（evaluator）

对象可以实际接触到，比较容易弄懂。解析器做的实际上是数据格式转换，也好理解。 至于第三个的评估器则完全不知从何下手。

评估器所做的是根据语法树“执行”程序。说起来很简单，但是怎样“执行”，仔细考虑起来还是有难度的。 if语句怎样执行？while语句怎样执行？局部变量怎样赋值？怎样调用方法？ 等等所有这些问题没有得到解答之前，评估器还是一个谜团。

本书的第三部分“评估”会讨论评估器。目标文件是eval.c。“评估器”的英文是evaluator， 省略一下就是eval。

简单解释了ruby的组成，然而，即便解释了程序运作之类的概念，它还是难于理解的。 在下一章中，让我们从实际使用ruby起步。
