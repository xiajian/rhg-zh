---
layout: post
title: 第七章：安全
---

## 基础
----

我在这里所说的安全并不是指密码或加密。Ruby的安全特性用于在类似于CGI编程的环境下， 处理不可靠的对象。

比如，把一个表示数字的字符串转换为一个整数，你可能使用的是eval方法。 然而，eval是一个“把字符串当作Ruby程序运行”的方法。 如果你eval的字符串来自网络上的不明人物，它可能就非常危险。 然而，对程序员来说，让他们完全负责区分安全和不安全的事物，他们会觉得非常烦琐和累赘， 肯定会犯下一些错误。因此，我们让它成为了语言的一部分。这便是这项特性的起因。

那么，Ruby如何保护我们免受这种危险呢？危险的操作，比如打开意图不明的文件， 其原因大体可分为两种：

-  危险数据
-  危险代码

对于前者，处理这些数据的代码是由程序员本身编写的，因此，它是（相当）安全的。 对于后者，程序代码是绝对不能信任的。

基于上面的两个原因，应该采用不同的解决方案，因此，有必要划分出不同的级别。 这个级别叫做安全级别。Ruby的安全级别由$SAFE这个全局变量表示。 值的范围最小为0，最大为4。当这个变量赋值时，级别就会增加。 因为级别一旦升高，就不会再降低。对于每个级别而言，都会限制一些操作。

我就不解释级别2和3了。级别0是通常的程序环境，安全系统不起作用。 级别1处理危险数据。级别4处理危险代码。 我们略过0，详细解释一下级别1和4。

### 级别1

这个级别用来处理危险数据，比如，在通常的CGI应用中，等等。

作为级别1实现的基础，每个对象都有“脏标记”。所有外部读来的对象都标记为脏， 脏对象尝试eval或File.open就会引发异常，尝试便就此终止。

脏标记是“可感染的”。比如，从一个脏字符串中取出一部分，这个部分也还是脏的。

### 级别4

这个级别用来处理危险代码，比如，运行外部（未知）程序，等等。

在级别2中，操作及其用到的数据之间会进行双向检查，但是在级别4中，操作本身也要受到约束。 比如，exit、文件I/O、线程操作、重定义方法等等。当然，在这个过程中，会用到脏标记信息， 但基本上是以操作为基准的。

### 安全单位

$SAFE看上去像个全局变量，但实际上，它是一个线程局部变量。换句话说， Ruby的安全系统工作在线程单元上。在Java和.NET中，可以授权给每个组件（对象）， 但是，Ruby没有那么做。因为估计的主要目标是CGI吧！

如果想提升程序某一部分的安全级别，那它应该创建一个不同的线程，提升线程的安全级别。 我还没有解释如何创建一个线程，但是我们在这里需要的只是一个例子，先忍耐一下：
{% highlight ruby %}
# 在不同的线程中提升安全级别
p($SAFE)   # 缺省值为0
Thread.fork {    # 启动一个不同的线程
    $SAFE = 4    # 提升安全级别
    eval(str)    # 运行危险程序
}
p($SAFE)   # block之外，安全级别仍为0。
{% endhighlight %}

### $SAFE的可靠性

即便实现了脏标志的感染，即便限制了操作，最终还是全要由手工处理。 换句话说，内部库和扩展库必需完全兼容，如果不能，“脏”操作中途就不再传染， 安全便会就此终止。实际上，经常有这种漏洞报出。基于这个原因，我也不太信任它。

当然，这并不是说所有的Ruby程序都是危险的。即便是$SAFE=0， 也可能写出安全程序，即便是$SAFE=4，也可能写出为所欲为的程序。 简单说来，你（还）不能对$SAFE抱有过度的信任。

首先，“添加功能”和“安全”并不兼容。添加新特性同打开漏洞是成正比的， 这是一个常识。因此，我们应该假定ruby也可能是危险的。

## 实现
----

从这开始，我们进入实现部分，为了从机制上完全地理解ruby安全系统，我们必须要注意“在哪里检查？”。 然而，这次没有页面讨论这个问题，当然，我们也不会仅仅满足于将它们一一列出。 在本章结束前，我们来解释一下安全检查的机制。用于检查的API主要有以下两个。

- rb_secure(n)，如果安全级别是n或是更大的时候，抛出异常SecurityError
- SafeStringValue()，如果安全级别是1或更大，而且字符串已感染，抛出异常。

SafeStringValue()就不在这里讨论了。

### 脏标记

脏标记实际存放在basic->flags中，标志为FL_TAINT， 可以使用宏OBJ_INFECT()完成传染。用法如下：
{% highlight ruby %}
OBJ_TAINT(obj)            /* 给obj附上FL_TAINT标志 */
OBJ_TAINTED(obj)          /* 确认obj是否附上了FL_TAINT标志 */
OBJ_INFECT(dest, src)     /* 从src到dest传染FL_TAINT标志 */
{% endhighlight %}

抛开OBJ_TAINT()、OBJ_TAINTED()，我们这里只看一下OBJ_INFECT()。
{% highlight ruby %}
▼ OBJ_INFECT

 441  #define OBJ_INFECT(x,s) do {                             \
          if (FL_ABLE(x) && FL_ABLE(s))                        \
              RBASIC(x)->flags |= RBASIC(s)->flags & FL_TAINT; \
      } while (0)

(ruby.h)
{% endhighlight %}
FL_ABLE()用来确认传入参数VALUE是否为指针。 只有双方都是指针（也就是有flags成员），标志才会传播。

### $SAFE

{% highlight ruby %}
▼ ruby_safe_level

 124  int ruby_safe_level = 0;

7401  static void
7402  safe_setter(val)
7403      VALUE val;
7404  {
7405      int level = NUM2INT(val);
7406
7407      if (level < ruby_safe_level) {
7408          rb_raise(rb_eSecurityError, "tried to downgrade safe level from %d to %d",
7409                   ruby_safe_level, level);
7410      }
7411      ruby_safe_level = level;
7412      curr_thread->safe = level;
7413  }

(eval.c)
{% endhighlight  %}
$SAFE的实体是eval.c的ruby_safe_level。如前所述，$SAFE是线程所有的， 所以，需要放在“实现了线程”的eval.c中。也就是说，本来放在别的地方会更好， 因为C语言的关系，只能把它写在eval.c里。

safe_setter()是全局变量$SAFE的setter。也就是说，在Ruby层次上， 只能通过这个函数进行访问，这样，就不可能降低安全级别。

但是，如你所见，ruby_safe_level没有static修饰符，因此，在C层次上， 完全可以无视接口的存在，直接对安全级别进行修改。

### rb_secure()
{% highlight ruby %}
▼ rb_secure()

 136  void
 137  rb_secure(level)
 138      int level;
 139  {
 140      if (level <= ruby_safe_level) {
 141          rb_raise(rb_eSecurityError, "Insecure operation `%s' at level %d",
 142                   rb_id2name(ruby_frame->last_func), ruby_safe_level);
 143      }
 144  }
(eval.c)
{% endhighlight %}

如果当前的安全级别是level或者更大，就会抛出异常SecurityError。很简单。
