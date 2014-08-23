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

jekyll自己生成的文件的中的样式,具有借鉴意义:

You'll find this post in your `_posts` directory - edit this post and re-build (or run with the `-w` switch) to see your changes!
To add new posts, simply add a file in the `_posts` directory that follows the convention: YYYY-MM-DD-name-of-post.ext.

Jekyll also offers powerful support for code snippets:

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

Check out the [Jekyll docs][jekyll] for more info on how to get the most out of Jekyll. File all bugs/feature requests at [Jekyll's GitHub repo][jekyll-gh].

[jekyll-gh]: https://github.com/jekyll/jekyll
[jekyll]:    http://jekyllrb.com

## 参考文献
1.[六种用ruby调用执行shell命令的方法](http://blackanger.blog.51cto.com/140924/43730/)

