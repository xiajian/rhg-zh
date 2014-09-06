---
layout: post 
---
## 翻译杂记

翻译使用Jekyll的模板来自[Jekyll-bootstrap](https://github.com/plusjade/jekyll-bootstrap),模板这种事情明显不想自己折腾，现成的拿来用就好。
最初的想法是直接用原先的模板就好了，不过，英文版的库使用的textile并且里面的样式不太喜欢，原先中文版的库只有HTML，自己又像用markdown，思前想后，折腾了好久，下定决心自己重做个库。

将原先的textile文件的复制过来转换为md后缀时，使用了一个shell语句:

> for file in $(ls)  ; do mv $file ${file%%.*}.md ; done

其中，${file%%.*}截获不含后缀名的文件名，而记忆中的basename命令是从包含路径的字符串中截取文件名。

Jekyll中使用的Liquid模板中的注释:
> {% comment %} in losses {% endcomment %}

更多关于Liquid模板的介绍参考: https://github.com/shopify/liquid/wiki/liquid-for-designers

给文件取带有顺序规则的名字时，自己首先是实在vim中修改，觉得蛋疼，后来在文件管理器中修改，依然蛋疼，最后，还是写个脚本来的方便。
{% highlight ruby %}
# rename.rb - 用来排序重命名文件
# 功能:用来按照某一顺序(order字符串)排列文件名
# 知识点：在Ruby中调用shell命令，在shell命令中插入ruby变量。正则表达式。
# #{}中是可以进行运算的
order= "intro,minimum,object,name,class,gc,variable,security,spec,yacc,parser,contextual,syntree,evaluator,module,method,iterator,anyeval,load,thread,fin"
o = order.split(",")
f = `ls`
o.each_with_index do |x,idx|
  f.split("\n").grep(Regexp.new(x)) do |y| 
    p "#{y} include #{x}" 
    if idx >= 10
      system "mv #{y} #{idx}-#{y}"
    else
      system "mv #{y} 0#{idx}-#{y}"
    end
  end
end
{% endhighlight %}

备注：写脚本其实也不方便，想着要怎么写，还要调试查看功能是否正确。不过自己ruby了解不多，刚好学习一下。

将英文链接添加进去，修改了连接的文件名时使用了一个vim的全局替换: 
> g/\.html/s//\/index\.html/g

想要在Markdown中加入表格，搜了几个试了一下，发现自己被坑了，最后找到了一个，语法格式如下:

> First Header | Second Header | Third Header
> ------------ | ------------- | ------------
> Content Cell | Content Cell  | Content Cell
> Content Cell | Content Cell  | Content Cell

放置到远程github上时,出现了一些问题,获得了一些经验,首先:

- Github利用Jekyll生成静态页时，其使用的是gh-pages分支
- Github Pages分为用户相关和项目相关，前置的URL为http://name.github.io ，后者为http://name.github.io/projectname
- 如果已经存在name.github.io时，出现如下问题:
     *  项目相关的css会乱掉，需要设置_config.yml中的baseurl: /projectiname
     *  md中的html路径也需要重新设置

MarkDown语法相关的资料:

1. [Markdown 语法说明](http://wowubuntu.com/markdown/)
2. [MarkDown语法小结 ](http://www.myexception.cn/program/1629426.html)

# Jekyll错误: 
1. `Liquid Exception: Syntax Error in tag 'highlight' while parsing the following markup: Valid syntax: highlight <lang> [linenos] in zh/0-1-intro.md`
发现错误的起因: 自己在相关的页面编辑添加图片时，总是不成功，查看了生成的html中没有包含img的标签，尝试很几种方法，都没能解决，最后打算重启Jekyll时，看到了上述错误，修复后，发现图片可以引用了。
解决方法:就是将相关的错误的highlight全部删除掉。
副产品: 
- 在搜图片显示时，从Vex上看到一个不错的Jekyll的博客:<http://yansu.org>
- Jekyll编译出错后，将会影响剩余的页面内容的处理。
{% raw %}
2. `Liquid Exception: Tag '{%' was not properly terminated with regexp: /\%\}/ in zh/04-class.md` 
Jekyll报错都不给出解析错误的行号的，找起来相当的麻烦。
{% endraw %}
# 迷惑: 
自己写个jekyll的shell函数，居然把系统给崩溃了，我觉的这个函数很正常啊:
{% highlight ruby %}
function jekyll() {
   if [  $# ==  0  ] ; then
      jekyll serve -w
   else
      jekyll "$@"
   fi
 }
{% endhighlight %}
> 思：别名可以运行，而函数不可以运行，我想这和自己使用rvm安装的ruby环境有关。Jekyll这个命令行工具存在于rvm加载到当前shell进程的环境中。别名是在当前进程中运行，而函数则是另开一个子进程运行。问题在于，新开的子进程没有加rvm环境。但是，崩溃的行为就很奇怪。

Liquid模板中的for语句和if语句格式

    {% for page in site.pages %}
      {% if page.title %}<a class="page-link" href="{{ page.url | prepend: site.baseurl }}">{{ page.title }}</a>{% endif %}
    {% endfor %}

jekyll自己生成的文件的中的样式,具有借鉴意义的格式:

1. 取消Markdown元字符的解释含义的 `_post char* ` 符号 
2. 语法高亮格式
> {% highlight ruby %}...{% endhighlight %}

3. 新的超链接的写法 [Jekyll docs][jekyll]
[jekyll]:    http://jekyllrb.com

有了三个Jekyll的站点，远程的都在xiajian.github.io域名之下，突发奇想，想在本地将三个站点整合起来，尝试了一下，好想不太可以。webrick会霸占端口，不同的webricks进程不能共用端口。

9月6：自从8月30回家感冒并在家挂了几天水之后，来公司做事一直没有激情，干啥事都觉得有气无力的，烦躁倦怠，身体也变差了，时常觉的嘴里没有味道。翻译也停滞了很久，提不起精神来。想到是不是换件事情处理并回退到之前步行来公司，或许会改变自己倦怠的情绪和每况日下的身体。

9月6：中午睡了个很长时间的午觉，感觉睡了很久，具体的时间也没有仔细计算。下午，大概是5点钟，不想呆在公司了，一来灯光的问题，二来想回去锻炼身体跑步。回来之后，跑步+洗澡+吃饭，等到自己坐下来想看书时，发现看不下去，打开了自己很久没有使用的机器。继续翻译RHG。但是，自己机器上的环境没有搭建完成，就在那里搭环境，先是VIM的环境，然后是Jekyll。

- VIM的环境其实就是安装了一些插件：delimitMate和vim-markdown
- Jekyll的环境稍微复杂些，除了安装Jekyll，貌似好像还要安装其他两个Gems包(jemoji,jekyll-sitemap)。决定自己写个Gemfile。

markdown和textile之间的区别:
- h2之类的标签的表示，markdown通过##, textile通过h2.。就感觉而言，textile的表示更为简洁，不过其后缀名实在太繁琐了，不如markdown的md后缀简洁，这也是我不太喜欢它的原因。

突然的需求，在vim中对多个文件进行全局替换的方法：


## 后记
----
现在的我要比四年前的我更有耐心，在还没开始翻译之前，先是各种处理HTML到markdown格式的装换，这其实是一件相当繁琐的事情，我居然有耐心做了下去。看来自己确实是慢下来了，尽管之前也不快，但是特别急躁，什么事都赶着去似的。

多亏了看了介绍诸时健的相关文章，勾起了我对建立下一个十年的计划的想法，尽管不知道下一个十年后会变成什么样，我有预感，我以后会很NB，哈哈。

14年五月份时，最初看到RHG及其中文版翻译状况时，就想到将其翻译下来。不过，彼时既不会用git，也不会用Jekyll。等到了14八月时，两个工具都差不过会折腾了，出于深入学习Ruby的想法，就开始着手翻译的准备工作。

仔细想想，自己工作还是相当的轻松的，不然，也不会有时间来翻译。Ruby和Rails都学的不怎么样，工作做的事情也是少少的(由于自己是新手,磕磕伴伴的学习和试错，又是好几天纠结在某一点上)，希望以后会顺畅些。

自从上周末(14.8.24)在Github上鼓捣起了rhg-zh，这一周就一直没在干事，比如说现在，忙着自己Github的站点，工作都抛到脑后了。这样子是要被开的节奏，这样不好不好！！

VIM编辑，Jekyll本地查看效果，git推送部署。不要忍受别的博客空间提供的各种奇葩难用的编辑器，又可以学习新的东西markdown、jekyll之类的，这样也挺好的。


## 参考文献
----
1.[六种用ruby调用执行shell命令的方法](http://blackanger.blog.51cto.com/140924/43730/)

