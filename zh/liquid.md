---
layout: post 
title: liquid模板语言
---
来自: [Liquid for Designers][liquid]

##缘起
----
Jekyll使用Liquid模板，因此，想要用好Jekyll，需要了解一些关于Liquid相关的知识。本文翻译自[Liquid for Designers][liquid]，用作自己学习参考。


Liquid中存在两种类型的标签(markup): Output and Tag
- Output markup (which may resolve to text) is surrounded by

> {% raw %} {{ 匹配成对出现的大括号 }} {% endraw %}

- Tag markup (which cannot resolve to text) is surrounded by

> {% raw %} {% 匹配成对出现的大括号以及百分号 %} {% endraw %}

## Output
----

Here is a simple example of Output:
下面是一些Output标签的简单例子: 
Hello {{name}}
Hello {{user.name}}
Hello {{ 'tobi' }}
Hello ,this is {{site.title}}

### 高级Output标签：过滤器(Filters)

Output markup takes filters. Filters are simple methods. The first parameter is always the output of the left side of the filter. The return value of the filter will be the new left value when the next filter is run. When there are no more filters, the template will receive the resulting string.

Output标签中可以使用过滤器。所谓的过滤器，其实就是一些简单的方法。过滤器总是将左边输出作为第一个参数，其返回值将作为下一个过滤器的输入。一旦处理结束，即没有更多的过滤器时，模板处理器将接受最后的处理结果(字符串)。

示例如下:
{% raw %}
Hello {{ 'tobi' | upcase }}  
Hello tobi has {{ 'tobi' | size }} letters!  
Hello {{ '*tobi*' | textilize | upcase }}  
Hello {{ 'now' | date: "%Y %h" }}  
{% endraw %}

处理结果为： 

Hello {{ 'tobi' | upcase }}  
Hello tobi has {{ 'tobi' | size }} letters!  
Hello {{ '*tobi*' | textilize | upcase }}  
Hello {{ 'now' | date: "%Y %h" }}  

### 标准过滤器(Standard Filters)

    date - 格式化日期 (syntax reference)
    capitalize - 将输入句子中的单词大写
    downcase - 将输入字符串转为小写
    upcase - 将输入字符串转为大写
    first - 获取传递的数组中的第一个元素get the first element of the passed in array
    last - 获取传递的数组中的最后一个元素
    join - join elements of the array with certain character between them
    sort - 数组元素排序
    map - map/collect an array on a given property
    size - 返回字符串或者数组的大小
    escape - 转义字符串
    escape_once - 返回转义版的html，并且不影响已存在的转义实体(escaped entities)
    strip_html - 剔除字符串中的html(strip html from string)
    strip_newlines - 剔除字符串中所有的换行符(\n)
    newline_to_br - 将字符串中换行符替换成html断行(<br>)
    replace - replace each occurrence e.g. {{ 'foofoo' | replace:'foo','bar' }} #=> 'barbar'
    replace_first - replace the first occurrence e.g. {{ 'barbar' | replace_first:'bar','foo' }} #=> 'foobar'
    remove - remove each occurrence e.g. {{ 'foobarfoobar' | remove:'foo' }} #=> 'barbar'
    remove_first - remove the first occurrence e.g. {{ 'barbar' | remove_first:'bar' }} #=> 'bar'
    truncate - 将字符串截断为x个字符
    truncatewords - 将字符串截断为x个字(主要用来处理多字符的字，比如CKJ的字符集)
    prepend - 向前追加一个字符串 例如: {{ 'bar' | prepend:'foo' }} #=> 'foobar'
    append - 向后追加一个字符串 e.g. {{ 'foo' | append:'bar' }} #=> 'foobar'
    minus - 减subtraction e.g. {{ 4 | minus:2 }} #=> 2
    plus - 加addition e.g. {{ '1' | plus:'1' }} #=> '11', {{ 1 | plus:1 }} #=> 2
    times - 乘multiplication e.g {{ 5 | times:4 }} #=> 20
    divided_by - 除division e.g. {{ 10 | divided_by:2 }} #=> 5
    split - 以给定的模式分隔字符串 e.g. {{ "a~b" | split:"~" }} #=> ['a','b']
    modulo - 求余remainder, e.g. {{ 3 | modulo:2 }} #=> 1

## Tags
----

Tags are used for the logic in your template. New tags are very easy to code, so I hope to get many contributions to the standard tag library after releasing this code.

Tags标签用作模板的逻辑。Tag实现很简单，所以很容易扩展出新的Tag。所以，原作者希望在发布Liquid之后，能有更多贡献者的编写tag并添加到tab库中。

Here is a list of currently supported tags:  
如下是当前支持的一些标签:

    assign - 赋值给某个变量Assigns some value to a variable
    capture - 可江文本捕获到变量中的块标签 Block tag that captures text into a variable
    case - Block tag, its the standard case...when block
    comment - Block tag, comments out the text in the block
    cycle - Cycle is usually used within a loop to alternate between values, like colors or DOM classes.
    for - For loop
    if - Standard if/else block
    include - Includes another template; useful for partials
    raw - temporarily disable tag processing to avoid syntax conflicts.
    unless - Mirror of if statement

### Comments

Comment is the simplest tag. It just swallows content.
{% raw %}
We made 1 million dollars {% comment %} in losses {% endcomment %} this year
{% endraw %}

We made 1 million dollars {% comment %} in losses {% endcomment %} this year

### Raw

Raw temporarily disables tag processing. This is useful for generating content (eg, Mustache, Handlebars) which uses conflicting syntax.

>{% raw %}  
>  In Handlebars, {{ this }} will be HTML-escaped, but {{{ that }}} will not.  
>{% endraw %}

### If / Else

if / else should be well-known from any other programming language. Liquid allows you to write simple expressions in the if or unless (and optionally, elsif and else) clause:

    {% raw %}
    {% if user %}
      Hello {{ user.name }}
    {% endif %}
    
    # Same as above
    {% if user != null %}
      Hello {{ user.name }}
    {% endif %}
    
    {% if user.name == 'tobi' %}
      Hello tobi
    {% elsif user.name == 'bob' %}
      Hello bob
    {% endif %}
    
    {% if user.name == 'tobi' or user.name == 'bob' %}
      Hello tobi or bob
    {% endif %}
    
    {% if user.name == 'bob' and user.age > 45 %}
      Hello old bob
    {% endif %}
    
    {% if user.name != 'tobi' %}
      Hello non-tobi
    {% endif %}
    
    # Same as above
    {% unless user.name == 'tobi' %}
      Hello non-tobi
    {% endunless %}
    
    # Check for the size of an array
    {% if user.payments == empty %}
       you never paid !
    {% endif %}
    
    {% if user.payments.size > 0  %}
       you paid !
    {% endif %}
    
    {% if user.age > 18 %}
       Login here
    {% else %}
       Sorry, you are too young
    {% endif %}
    
    # array = 1,2,3
    {% if array contains 2 %}
       array includes 2
    {% endif %}
    
    # string = 'hello world'
    {% if string contains 'hello' %}
       string includes 'hello'
    {% endif %}
    {% endraw %}

### Case Statement

If you need more conditions, you can use the case statement:  
如果需要更多的条件，可以使用case语句:

    {% raw %}
    {% case condition %}
    {% when 1 %}
    hit 1
    {% when 2 or 3 %}
    hit 2 or 3
    {% else %}
    ... else ...
    {% endcase %}
    {% endraw %}

Example:

    {% raw %}
    {% case template %}
    
    {% when 'label' %}
         // {{ label.title }}
    {% when 'product' %}
         // {{ product.vendor | link_to_vendor }} / {{ product.title }}
    {% else %}
         // {{page_title}}
    {% endcase %}
    {% endraw %}

### Cycle

Often you have to alternate between different colors or similar tasks. Liquid has built-in support for such operations, using the cycle tag.

    {% raw %}
    {% cycle 'one', 'two', 'three' %}
    {% cycle 'one', 'two', 'three' %}
    {% cycle 'one', 'two', 'three' %}
    {% cycle 'one', 'two', 'three' %}
    {% endraw %}

will result in

one  
two  
three  
one

If no name is supplied for the cycle group, then it's assumed that multiple calls with the same parameters are one group.

If you want to have total control over cycle groups, you can optionally specify the name of the group. This can even be a variable.

    {% raw %}
    {% cycle 'group 1': 'one', 'two', 'three' %}
    {% cycle 'group 1': 'one', 'two', 'three' %}
    {% cycle 'group 2': 'one', 'two', 'three' %}
    {% cycle 'group 2': 'one', 'two', 'three' %}
    {% endraw %}

will result in

one  
two  
one  
two

### For loops

Liquid allows for loops over collections:  
Liquid同样允许对集合应用循环: 

    {% raw %}
    {% for item in array %}
      {{ item }}
    {% endfor %}
    {% endraw %}
When iterating a hash, item[0] contains the key, and item[1] contains the value:  
如果对哈希表进行迭代，item[0]表示键，item[1]表示键所对应的值:

    {% raw %}
    {% for item in hash %}
      {{ item[0] }}: {{ item[1] }}
    {% endfor %}
    {% endraw %}
During every for loop, the following helper variables are available for extra styling needs:  
在每次循环中，提供如下的辅助变量以供特殊的样式需求:

    forloop.length      # => length of the entire for loop
    forloop.index       # => index of the current iteration
    forloop.index0      # => index of the current iteration (zero based)
    forloop.rindex      # => how many items are still left?
    forloop.rindex0     # => how many items are still left? (zero based)
    forloop.first       # => is this the first iteration?
    forloop.last        # => is this the last iteration?

There are several attributes you can use to influence which items you receive in your loop

limit:int lets you restrict how many items you get. offset:int lets you start the collection with the nth item.

    {% raw %}
    # array = [1,2,3,4,5,6]
    {% for item in array limit:2 offset:2 %}
      {{ item }}
    {% endfor %}
    # results in 3,4
    {% endraw %}

### Reversing the loop

{% for item in collection reversed %} {{item}} {% endfor %}

Instead of looping over an existing collection, you can define a range of numbers to loop through. The range can be defined by both literal and variable numbers:

    {% raw %}
    # if item.quantity is 4...
    {% for i in (1..item.quantity) %}
      {{ i }}
    {% endfor %}
    # results in 1,2,3,4
    {% endraw %}

### Variable Assignment

You can store data in your own variables, to be used in output or other tags as desired. The simplest way to create a variable is with the assign tag, which has a pretty straightforward syntax:

可以将数据存放在自己设定的变量里，然后output标签或者tags标签中使用。最简单的创建变量的方法是通过`assign`标签，其语法简洁明了。

    {% raw %}
    {% assign name = 'freestyle' %}
    {% for t in collections.tags %}{% if t == name %}
      <p>Freestyle!</p>
    {% endif %}{% endfor %}
    {% endraw %}

Another way of doing this would be to assign true / false values to the variable:  
上述代码的另一种处理方式是通过给变量赋 `true/false` 值:

    {% raw %}
    {% assign freestyle = false %}
    
    {% for t in collections.tags %}{% if t == 'freestyle' %}
      {% assign freestyle = true %}
    {% endif %}{% endfor %}
    
    {% if freestyle %}
      <p>Freestyle!</p>
    {% endif %}
    {% endraw %}
If you want to combine a number of strings into a single string and save it to a variable, you can do that with the `capture` tag. This tag is a block which "captures" whatever is rendered inside it, then assigns the captured value to the given variable instead of rendering it to the screen.

如果想要将一组字符串组合成单个字符串并将其包存到变量中，可以使用capture标签，该标签是一个捕获任何在其内部渲染的内容代码块，然后将其赋值到给定的变量而不是渲染到屏幕上。

    {% raw %}
    {% capture attribute_name %}{{ item.title | handleize }}-{{ i }}-color{% endcapture %}
  
    <label for="{{ attribute_name }}">Color:</label>
    <select name="attributes[{{ attribute_name }}]" id="{{ attribute_name }}">
      <option value="red">Red</option>
      <option value="green">Green</option>
      <option value="blue">Blue</option>
    </select>
    {% endraw %}
处理结果如下: 
{% capture attribute_name %}{{ item.title | handleize }}-{{ i }}-color{% endcapture %}
  
<label for="{{ attribute_name }}">Color:</label>
<select name="attributes[{{ attribute_name }}]" id="{{ attribute_name }}">
  <option value="red">Red</option>
  <option value="green">Green</option>
  <option value="blue">Blue</option>
</select>

## 后记
----
Liquid模板还是相当的简洁好学的，剩下的就剩如何使用了。

[liquid]: https://github.com/shopify/liquid/wiki/liquid-for-designers
