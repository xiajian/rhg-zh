---
layout: post
title: 命令行选项
---

 Ruby interpreter accepts following command-line options (switches). Basically they are quite similar to those of Perl.

 Ruby解释器接受如下的命令行选项(开关)，内容基本和Perl相似。

-0digit  
    
    specifies the input record separator ($/) as an octal number. If no digits given, the null character is the separator. Other switches may follow the digits. -00 turns Ruby into paragraph mode. -0777 makes Ruby read whole file at once as a single string, since there is no legal character with that value.
    以八进制数指定输入记录符($/)。如果没有给定digits，默认使用null字符作为分隔符。其他的开关也会跟随该数字。 -00表明Ruby进入段落模式，-0777使得Ruby将整个文件看作单个字符串，这是因为没有值为777的非法字符

-a
    
    turns on auto-split mode when used with -n or -p. In auto-split mode, Ruby executes `$F = $_.split` at beginning of each loop.
    当指定-n或者-p选项时，打开自动分割模式。在自动分隔模式中，ruby在每个循环开始处执行$F = $_.split

-c

    causes Ruby to check the syntax of the script and exit without executing. If there is no syntax error, Ruby will print "Syntax OK" to the standard output. 
    仅检查脚本的语法而不执行脚本。如果没有语法错误，Ruby将向标准输出打印"Syntax OK"。

-Kc

    specifies KANJI (Japanese character) code-set. 
    指定KANJI(日本字符集)编码集。
-d
--debug

    turns on debug mode. $DEBUG will set true. 
    打开debug模式，设置$DEBUG为真。

-e script

    specifies script from command-line. if -e switch specified, Ruby will not look for a script filename in the arguments. 
    通过命令行指定脚本，如果设置-e选项，Ruby将不会在参数中寻找脚本的文件名。

-F regexp

    specifies input field separator ($;). 
    指定输入文件的分隔符($;).
-h
--help

    prints a summary of the options. 
    打印选项的综述。
-i extension

    specifies in-place-edit mode. The extension, if specified, is added to old filename to make a backup copy.
    指定参考编辑模式，如果指定该参数，将会对旧的文件制作相应后缀的备份文件。

    example:

    	% echo matz > /tmp/junk
    	% cat /tmp/junk
    	matz
    	% ruby -p -i.bak -e '$_.upcase!' /tmp/junk
    	% cat /tmp/junk
    	MATZ
    	% cat /tmp/junk.bak
    	matz

-I directory

    used to tell Ruby where to load the library scripts. Directory path will be added to the load-path variable (`$:'). 
    该选项告诉Ruby从哪里加载库脚本。目录参数将会被添加到加载路径变量(`$:`).
-l
    
    enables automatic line-ending processing, which means firstly set $\ to the value of $/, and secondly chops every line read using chop!, when used with -n or -p. 
    启动自动的行结束符处理，这意味着：在设置-n或者-p选项时，1.将$\设置为$/的值 2.使用chop!切割每行。
-n
    
    causes Ruby to assume the following loop around your script, which makes it iterate over filename arguments somewhat like sed -n or awk.
    设置Ruby假设脚本被如下的循环包围，使得其像sed -n或awk那样迭代文件名参数。

    	while gets
    	  ...
    	end

-p

    acts mostly same as -n switch, but print the value of variable $_ at the each end of the loop.
    同-n选项类似，但是，在循环的结束处打印变量$_的值。

    example:

    	% echo matz | ruby -p -e '$_.tr! "a-z", "A-Z"'
    	MATZ

> 以$开头的奇怪的变量名到底是个啥，看起来还相当的参见的。

-r filename

    causes Ruby to load the file using require. It is useful with switches -n or -p. 
    触发Ruby通过require加载文件。这在-n和-p选项打开时非常的有用。
-s
    enables some switch parsing for switches after script name but before any filename arguments (or before a --). Any switches found there is removed from ARGV and set the corresponding variable in the script.
    为开关启动一些转换解析。

    example:

    	#! /usr/local/bin/ruby -s
    	# prints "true" if invoked with `-xyz' switch.
    	print "true\n" if $xyz

-S

    makes Ruby uses the PATH environment variable to search for script, unless if its name begins with a slash. This is used to emulate #! on machines that don't support it, in the following manner:
    使得Ruby使用PATH环境变量搜索文件，

    	#!/bin/sh
    	exec ruby -S -x $0 "$@"
            #! ruby

    On some systems $0 does not always contain the full pathname, so you need -S switch to tell Ruby to search for the script if necessary.
-T [level]

    Forces "taint" checks to be turned on so you can test them. If level is specified, $SAFE to be set to that level. It's a good idea to turn them on explicitly for programs run on another's behalf, such as CGI programs. 
-v
--verbose

    enables verbose mode. Ruby will prints its version at the beginning, and set the variable `$VERBOSE' to true. Some methods prints extra messages if this variable is true. If this switch is given, and no other switches present, Ruby quits after printing its version. 
--version

    prints the version of Ruby executable. 
    打印Ruby执行文件的版本。`
-w

    enables verbose mode without printing version message at the beginning. It set the variable `$VERBOSE' to true. 
-x[directory]

    tells Ruby that the script is embedded in a message. Leading garbage will be discarded until the first that starts with "#!" and contains string "ruby". Any meaningful switches on that line will applied. The end of script must be specified with either EOF, ^D (control-D), ^Z (control-Z), or reserved word __END__.If the directory name is specified, Ruby will switch to that directory before executing script. 
-X directory

    causes Ruby to switch to the directory. 
    确保Ruby切换目录。
-y
--yydebug

    turns on compiler debug mode. Ruby will print bunch of internal state messages during compiling scripts. You don't have to specify this switch, unless you are going to debug the Ruby interpreter itself. 
    打开编译器的debug模式。Ruby在编译脚本时将打印内部状态信息。除非调用解释器自生，否则不需要打开该选项。
