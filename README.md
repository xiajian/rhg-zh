Ruby Hacking Guide 中文翻译
==============================
[阅读该翻译文档](http://xiajian.github.io/rhg-zh/)
备注: 原本是自己新建的版本库，初次建立，没有经验，README都是参考的英文版的RHG翻译的。需要注意的是，Githu生成静态页面的分支是gh-pages，为了避免麻烦，所有修改都在gh-pages分支上，master废弃不用。

本地运行
==========

```sh
$ git clone https://github.com/ruby-hacking-guide/ruby-hacking-guide.github.com
$ gem install jekyll jemoji jekyll-sitemap
$ gem install RedCloth
$ jekyll serve -w # this compiles files and starts a server on localhost:4000.
```


For Bundler users
```sh
$ git clone https://github.com/ruby-hacking-guide/ruby-hacking-guide.github.com
$ bundle install
$ jekyll serve -w  # this compiles files and starts a server on localhost:4000.
```


[Jekyll usage](https://github.com/mojombo/jekyll/wiki/usage)


英文版的EPUB格式
=========

Thanks to @avsej, we can read this book in EPUB.

To generate an EPUB file, you need to install eeepub additionally.

```sh
$ gem install rubyzip -v 0.9.9
$ gem install eeepub
$ ruby script/publish
```

You can convert a generated EPUB file into other formats by using Calibre.

The generated files in various formats are also available:

* http://files.avsej.net/rhg-2013-10-03_e5203a.epub
* http://files.avsej.net/rhg-2013-10-03_e5203a.mobi
* http://files.avsej.net/rhg-2013-10-03_e5203a.pdf


About the version of ruby explained
==========

The version of ruby used is ruby (1.7.3 2002-09-12).

It's almost a year before the release of Ruby 1.8.0,
so things explained in this book are basically the same in Ruby 1.8.

The details about this version are written in the
[Introduction](http://ruby-hacking-guide.github.io/intro.html)

You can download it from the official support site of the book.
* http://i.loveruby.net/ja/rhg/ar/ruby-rhg.tar.gz
* http://i.loveruby.net/ja/rhg/ar/ruby-rhg.zip

It's also available from this Organization's repo at
* https://github.com/ruby-hacking-guide/ruby-1.7.3


License
=======

Copyright (c) 2002-2004 Minero Aoki, All rights reserved.

该翻译使用[知识共享署名-非商业使用条约](http://creativecommons.org/licenses/by-nc-sa/2.5/)

想要翻译成其他语言，请联系原作者Minero Aoki <aamine@loveruby.net>。

