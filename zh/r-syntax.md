---
layout: post
title: Ruby语法
---

## Lexical structure
----

The character set used in the Ruby source files for the current implementation is based on ASCII. The case of characters in source files is significant. All syntactic constructs except identifiers and certain literals may be separated by an arbitrary number of whitespace characters and comments. The whitespace characters are space, tab, vertical tab, backspace, carriage return, and form feed. Newlines works as whitespace only when expressions obviously continues to the next line.

在Ruby源程序文件的字符集的当前实现是基于ASCII。在源文件中的字符是显著的。除了标识符和某些字面值，所有的句法结构都可被任意数目的空白符和注释所分隔。空白符可以是空格，水平和垂直制表符，退格符，回车和换页符。仅当表达式明显延续到下一行时，新行被看作是空白符。

### Identifiers

Examples:

	foobar
	ruby_is_simple

Ruby identifiers are consist of alphabets, decimal digits, and the underscore character, and begin with a alphabets(including underscore). There are no restrictions on the lengths of Ruby identifiers.

Ruby的标识符由字母，数字和下划线构成，并且以字母(包括下划线)。Ruby标识符的长度没有限制。

### Comment

Examples:

	# this is a comment line

Ruby comments start with "#" outside of a string or character literal (?#) and all following text until the end of the line.

Ruby中的注释是以"#"开头的字符串。

### Embedded Documentation

Example:

	=begin
	the everything between a line beginning with '=begin' and
	that with '=end' will be skipped by the interpreter.
	=end

If the Ruby interpreter encounters a line beginning with =begin, it skips that line and all remaining lines through and including a line that begins with =end.

如果Ruby解释器遇到以=begin开头的行，它将跳过所有剩下的行，直到遇到以=end为开头的行。

### Reserved words

The reserved words are:
保留关键字是:

	BEGIN	 class	  ensure   nil	    self     when
	END	 def	  false    not	    super    while
	alias	 defined  for	   or	    then     yield
	and	 do	  if	   redo     true
	begin	 else	  in	   rescue   undef
	break	 elsif	  module   retry    unless
	case	 end	  next	   return   until

## Program
----

Example:

	print "hello world!\n"

Ruby programs are sequence of expressions. Each expression are delimited by semicolons(;) or newlines. Backslashes at the end of line does not terminate expression.

Ruby程序就是一系列的表达式。每个表达式通过';'或者换行符(newline)进行分隔。行末的反斜杠用来延续表达式，这一点跟C类似。

## Expression
----

Examples:

	true
	(1+2)*3
	foo()
	if test then ok else ng end

Ruby expressions can be grouped by parentheses.
Ruby表达式可通过括号分组。

### String literals

Examples:

	"this is a string expression\n"
	"concat#{foobar}"
	'concat#{foobar}'
	%q!I said, "You said, 'She said it.'"!
	%!I said, "You said, 'She said it.'"!
	%Q('This is it.'\n)

String expressions begin and end with double or single quote marks. Double-quoted string expressions are subject to backslash escape and expression substitution. Single-quoted strings are not (except for \' and \\).

字符串通过单双引号应用。双引用字符串表示接受反斜杠的转义符以及字符串替换，单引号字符串仅接受转义\'和\\。

The string expressions begin with % are the special form to avoid putting too many backslashes into quoted strings. The %q/STRING/ expression is the generalized single quote. The %Q/STRING/ (or %/STRING/) expression is the generalized double quote. Any non-alphanumeric delimiter can be used in place of /, including newline. If the delimiter is an opening bracket or parenthesis, the final delimiter will be the corresponding closing bracket or parenthesis. (Embedded occurrences of the closing bracket need to be backslashed as usual.)

以%开头的字符串表达式是一种特殊的形式，用来避免在引用字符串中放置太多的反斜杠。%q/STRING/是广义单引号字符串表达式，%Q/STRING/(或者%/STRING/)是双引号字符串的通用形式。任何非字母数字符可用来代替/，包括换行符。注意分隔符前后一致，{对}、(对)。

### 反斜杠记号(Backslash notation)

    \t       tab(0x09)                            制表符
    \n       newline(0x0a)                        换行 
    \r       carriage return(0x0d)                回车
    \f       form feed(0x0c)                      分页符
    \b       backspace(0x08)                      退格符
    \a       bell(0x07)           
    \e       escape(0x1b)                         转义符
    \s       whitespace(0x20)                     空白符
    \nnn     character in octal value nnn         十进制字符
    \xnn     character in hexadecimal value nn    十六进制字符
    \cx      control x                            control + x
    \C-x     control x                            control + x
    \M-x     meta x (c | 0x80)                    meta键就是alt
    \M-\C-x  meta control x 
    \x       character x itself 

The string literal expression yields new string object each time it evaluated.

字符串表达式在每次求值时，都获取新的字符串对象。

### Command output

Examples:

	`date`
	%x{ date }

Strings delimited by backquotes are performed by a subshell after escape sequences interpretation and expression substitution. The standard output from the commands are taken as the value. Commands performed each time they evaluated.

以反引号分隔的字符串在转义序列解析和表达式替换后，由子shell执行。命令的标准输出将作为字符串的值。命名在每次求值时被执行。

The %x/STRING/ is the another form of the command output expression.

%x/STRING/是命令输出表达式的另一种形式。

### Regular expression

Examples:

	/^Ruby the OOPL/
	/Ruby/i
	/my name is #{myname}/o
	%r|^/usr/local/.*|

Strings delimited by slashes are regular expressions. The characters right after latter slash denotes the option to the regular expression. Option i means that regular expression is case insensitive. Option i means that regular expression does expression substitution only once at the first time it evaluated. Option x means extended regular expression, which means whitespaces and commens are allowd in the expression. Option p denotes POSIX mode, in which newlines are treated as normal character (matches with dots).

由反斜杠分隔的字符串是正则表达式，右侧的符号意味着正则表达式的选项。选项i表明正则表达式是大小写不敏感的，选项x表明使用扩展正则表达式(可以使用空格和注释)，选项p意味着POSIX模式(换行被看作常规字符，可被.匹配)。

The %r/STRING/ is the another form of the regular expression.

 %r/STRING/是正则表达式的另一种形式。

    ^          beginning of a line or string  行或字符串的开始
    $          end of a line or string  行或字符串的结束
    .          any character except newline 除了换行符的任何字符
    \w         word character[0-9A-Za-z_] 
    \W         non-word character 
    \s         whitespace character[ \t\n\r\f] 空格字符
    \S         non-whitespace character 非空格字符
    \d         digit, same as[0-9] 数字
    \D         non-digit 非数字
    \A         beginning of a string 字符串的开头
    \Z         end of a string, or before newline at the end 字符串的结尾，在换行符之前
    \z         end of a string 字符串的结尾
    \b         word boundary(outside[]only) 词的边界(在[]之外)
    \B         non-word boundary  非词的边界
    \b         backspace(0x08)(inside[]only) 
    [ ]        any single character of set 
    *          0 or more previous regular expression 0个或多个先前的正则表达式
    *?         0 or more previous regular expression(non greedy) 0个或多个先前的正则表达式(非贪婪模式)
    +          1 or more previous regular expression 1个或多个先前的正则表达式
    +?         1 or more previous regular expression(non greedy) 0个或多个先前的正则表达式(非贪婪模式)
    {m,n}      at least m but most n previous regular expression 至少m，至多n个先前正则表达式
    {m,n}?     at least m but most n previous regular expression(non greedy) 至少m，至多n个先前正则表达式(非贪婪模式)
    ?          0 or 1 previous regular expression 0个或多个先前的正则表达式
    |          alternation 可选符
    ( )        grouping regular expressions 分组的正则表达式
    (?# )      comment  注释
    (?: )      grouping without backreferences 不带反向引用的分组
    (?= )      zero-width positive look-ahead assertion 0宽度的正向查询断言
    (?! )      zero-width negative look-ahead assertion 0宽度的方向查询断言
    (?ix-ix)   turns on (or off) 'i' and 'x' options within regular expression. These modifiers are localized inside an enclosing group (if any). 
    (?ix-ix: ) turns on (or off) 'i' and 'x' options within this non-capturing group. 

Backslash notation and expression substitution available in regular expressions.

反斜杠记号和表达式替换可在正则表达式中使用。

### 字符串中的表达式替换(Expression substitution in strings)

Examples:

	"my name is #{$ruby}"

In double-quoted strings, regular expressions, and command output expressions, the form like "#{expression}" extended to the evaluated result of that expression. If the expressions are the variables which names begin with the character either '$','@', expressions are not needed to be surrounded by braces. The character '#' is interpreted literally if it it not followed by characters '{','$','@'.

在双引号字符串中，正则表达式、命令输出表达式以及形如"#{expression}"的表达式，将会被扩展为表达式求值的结果。如果表达式是以$或@开头的字符，不需要使用括号包围。如果#之后没有后接{,$或@，就被看作为简单的字符。

### 行导向的字符串字面值-line-oriented string literals (Here document)

There's a line-oriente form of the string literals that is usually called as 'here document'. Following a << you can specify a string or an identifier to terminate the string literal, and all lines following the current line up to the terminator are the value of the string. If the terminator is quoted, the type of quotes determines the type of the line-oriented string literal. Notice there must be no space between << and the terminator.

行导向的字符串字面值通常被称为`here文档`。在<<之后，可以指定一个字符串或者标识符作为字符串的字符串的终结符。在终结符之间的所有行都是字符串的值。如果终结符是引用，引用类型决定了面向行的字符串字面值。注意：<<和终结符之间不能包含空格。

If the - placed before the delimiter, then all leading whitespcae characters (tabs or spaces) are stripped from input lines and the line containing delimiter. This allows here-documents within scripts to be indented in a natural fashion.

如果-放置在分隔符前，输入行中所有的领导的空白字符(tabs或空格)都将被遗弃。这允许here文档内嵌脚本时，可以使用自然的样式。

	  print <<EOF
	The price is #{$Price}.
	EOF

	  print <<"EOF";			# same as above
	The price is #{$Price}.
	EOF

	  print <<`EOC`			# execute commands
	echo hi there
	echo lo there
	EOC

	  print <<"foo", <<"bar"	# you can stack them
	I said foo.
	foo
	I said bar.
	bar

	  myfunc(<<"THIS", 23, <<'THAT')
	Here's a line
	or two.
	THIS
	and here's another.
	THAT

	  if need_define_foo
	    eval <<-EOS			# delimiters can be indented
              def foo
                print "foo\n"
	      end
	    EOS
          end

### 数值字面值(Numeric literals)

    123       integer-整数 
    -123      integer(signed) - 带符号整数
    1_234     integer(underscore within decimal numbers ignored) - 整数(整数中的下划线将被忽略)
    123.45    floating point number 
    1.2e-3    floating point number 
    0xffff    hexadecimal integer - 十六进制数
    0b01011   binary integer - 二进制数
    0377      octal integer - 八进制数
    ?a        ASCII code for character 'a'(97) - 字符a的ASCII码
    ?\C-a     Control-a(1) 
    ?\M-a     Meta-a(225) 
    ?\M-\C-a  Meta-Control-a(129) 
    :symbol   Integer corresponding identifiers, variable names, and operators. - 整数对应的标识符，变量名和操作符

In ?-representation all backslash notations are available.

在?-表示中，所有反斜杠符号都可用。

### Variables and constants

The variable in Ruby programs can be distinguished by the first character of its name. They are either global variables, instance variables, local variables, and class constants. There are no restriction for variable name length (except heap size).

Ruby程序中的变量可通过名字的第一个字符加以区分。变量可以是全局变量，实例变量，局部变量和类常量。除了堆大小，对变量名的长度并没有限制。

### Global variables

Examples:

	$foobar
	$/

The variable which name begins with the character '$', has global scope, and can be accessed from any location of the program. Global variables are available as long as the program lives. Non-initialized global variables has value nil.

以$开头的变量，拥有全局的作用域，并且可以从程序的任意地方访问。全局变量同程序存活时间相当。未初始化的全局变量值为nil。

### Instance variables

Examples:

	@foobar

The variable which name begins which the character '@', is an instance variable of self. Instance variables are belong to the certain object. Non-initialized instance variables has value nil.

以@开头的变量是自生的实例变量。实例变量属于某些对象，未初始化时值为nil。

### Constants

Examples:

	FOOBAR

The identifier which name begins with upper case letters ([A-Z]) is an constant. The constant definitions are done by assignment in the class definition body. Assignment to the constants must be done once. Changing the constant value or accessing to the non-initialized constants raises a NameError exception.

以大写字母[A-Z]开头的标识符表示常量。常量的定义通过在类的定义中赋值，赋值必须一次完成。改变常量的值或者访问未初始化的常量将引发NameError异常。

The constants can be accessed from:

常量可通过如下三种情况中被访问:

-  the class or module body in which the constant is defined, including the method body and the nested module/class definition body.
-  常量所定义的类或模块体，包括方法体，嵌套的模块/类定义体。
-  the class which inherit the constant defining class.
-  继承了定义常量的类
-  the class or module which includes the constant defining module. 
-  通过include方法包含常量所定义的类或模块

Class definition defines the constant automatically, all class names are constants.

类型定义自动定义常量，所有的类名都是常量。

To access constants defined in certain class/module, operator :: can be used.

可通过::来访问某些类/模块中定义的常量。

To access constants defined in the Object class, operator :: without the left hand side operand can be used.

通过::可以直接访问Object类中定义的常量。

Examples:

	Foo::Bar
	::Bar

No assignment using operator '::' is permitted.

任何赋值都不可以使用::操作符。

### Local variables

Examples:

	foobar

The identifier which name begins with lower case character or underscore, is a local variable or a method invocation. The first assignment in the local scope (bodies of class, module, method definition) to such identifiers are declarations of the local variables. Non-declared identifiers are method invocation without arguments.

以小写字符或下划线开头的标识符是局部变量或者方法调用。在局部作用域中(类、模块或方法定义体)中，对标识符的第一次赋值就是局部变量的声明。未定义的标识符看作为没有参数的方法调用。

The local variables assigned first time in the blocks are only valid in that block. They are called 'dynamic variables'. For example:

在代码块中第一次赋值的局部变量仅在块中有效。这被称为`动态类型`。例如: 

	i0 = 1
	loop {
	  i1 = 2
	  print defined?(i0), "\n"	# true
	  print defined?(i1), "\n"	# true
	  break
	}
	print defined?(i0), "\n"	# true
	print defined?(i1), "\n"	# false

### 伪变量(Pseudo variables)

There are special variables called 'pseudo variables'.

存在一些称为伪变量的特殊变量:

    self      the receiver of the current method 当前方法的接收器
    nil       the sole instance of the Class NilClass(represents false) NilClass类的唯一实例
    true      the sole instance of the Class TrueClass(typical true value) TrueClass类的唯一实例
    false     the sole instance of the Class FalseClass(represents false) FalseClass类的唯一实例
    __FILE__  the current source file name. 当前程序的文件名
    __LINE__  the current line number in the source file. 当前源文件的当前行

The values of the pseudo variables cannot be changed. Assignment to these variables causes exceptions.

伪变量的值不可改变，赋值给这样的变量将会引发异常。

### Array expression

Examples:

	[1, 2, 3]

Syntax:

	'[ expr,...]'

Returns an array, which contains result of each expressions. Arrays are instances of the class Array.

'[ expr,...]'返回包含每个表达式结果的数组，数组是类Array的实例。

%w expressions make creation of the arrays of strings easier. They are equivalent to the single quoted strings split by the whitespaces. For example:

%w(foo bar baz)

is equivalent to ["foo", "bar", "baz"]. Note that parenthesis right after %s is the quote delimiter, not usual parenthesis.

%w表达式使得数组字符串的创建更加容易，其等价于有空格分隔的单引号字符串。例如:	%w(foo bar baz) 等价于["foo", "bar", "baz"]。注意，%w之后的括号是引用分隔符而不是通常的括号。

### Hash expression

Examples:

	{1=>2, 2=>4, 3=>6}

Syntax:

	{ expr => expr...}

Returns a new Hash object, which maps each key to corresponding value. Hashes are instances of the class Hash.

{ expr => expr...}返回Hash对象，其中将每个键映射到对应的值。Hash对象是类Hash的实例。


### 方法调用(Method invocation)

Examples:

	foo.bar()
	foo.bar
	bar()
	print "hello world\n"
	print

Syntax:

[expr '.'] identifier ['(' expr...['*' [expr]],['&' ] expr')']
[expr '::'] identifier ['(' expr...['*' [expr]],['&' expr] ')']

Method invocation expression invokes the method of the receiver (right hand side expression of the dot) specified by the identifier. If no receiver specified, self is used as a receiver.

方法调用表达式调用接收器的方法(点号右侧的表达式)，如果没有指定接收器，则使用self作为接收器。

Identifier names are normal identifiers and identifier suffixed by character ? or !. As a convention, identifier? are used as predicate names, and identifier! are used for the more destructive (or more dangerous) methods than the method which have same name without !.

标识符名是常规的标识符，且其后缀可以是?或者!。作为惯例，identifier?用作谓词方法，而identifier!则是比不带！更具破坏性(或危险)的方法

If the last argument expression preceded by *, the value of the expression expanded to arguments, that means

	foo(*[1,2,3])

equals

	foo(1,2,3)

如果方法调用中的最后的参数以* 开头，则表达式的值将会被扩展为参数，比如`foo(*[1,2,3])` 等价于foo(1,2,3)。

If the last argument expression preceded by &, the value of the expression, which must be a Proc object, is set as the block for the calling method.

如果最后的参数以&作为前缀，则表达式的值必须是Proc对象，从而为调用方法设置块。

Some methods are private, and can be called from function form invocations (the forms that omits receiver).

某些私有的方法，可以通过函数形式(即忽略接受者的方法)来调用

### super

Examples:

	super
	super(1,2,3)

Syntax:

	super
	super(expr,...)

the super invokes the method which the current method overrides. If no arguments given, arguments to the current method passed to the method.

super调用当前方法所覆盖的父类的方法。如果给定了参数，则参数将会传递给父类的方法。

### Assignment

Examples:

	foo = bar
	foo[0] = bar
	foo.bar = baz

Syntax:

	variable '=' expr
	constant '=' expr
	expr'['expr..']' '=' expr
	expr'.'identifier '=' expr

Assignment expression are used to assign objects to the variables or such. Assignments sometimes work as declarations for local variables or class constants. The left hand side of the assignment expressions can be either:

赋值表达式用来给变量赋值对象。赋值有时用作局部变量或类常量的申明。赋值表达式的左值可以是如下这些类型:

- variables 变量
      
        variables '=' expression  
        If the left hand side is a variables, then assignment is directly performed.
        如果左边是变量，赋值将直接执行。

- array reference 数组引用

    	   expr1'[' expr2...']' '=' exprN
         This from is evaluated to the invocation of the method named []=, with expr1 as the receiver, and values expr2 to exprN as arguments.
         这种形式将对expr1调用[]=方法，并expr2至exprN用作参数。

- attribute reference 属性引用

    	   expr '.' identifier '=' expr
         This from is evaluated to the invocation of the method named identifier= with the right hand side expression as a argument.
         这种格式是通过调用expr的identifier=方法，并将右边的表达式用作参数。

### 自赋值(self assignment)

Examples:

	foo += 12

Syntax:

	expr op= expr     # left hand side must be assignable.

This form evaluated as expr = expr op expr. But right hand side expression evaluated once. op can be one of:

上述赋值形式为expr = expr op expr。但是右边的表达式近被求值一次。op可以为如下的这些: 

	+, -, *, /, %, **, &, |, ^, <<, >>, &&, ||

There may be no space between operators and =.

注意在操作符和=之间没有空格。

### 多重赋值(Multiple assignment)

Examples:

	foo, bar, baz = 1, 2, 3
	foo, = list()
	foo, *rest = list2()

Syntax:

	expr ',' [expr ','...] ['*' expr] = expr [, expr...]['*' [expr]]
	'*' expr = expr [, expr...]['*' expr]

Multiple assignment form performs multiple assignment from expressions or an array. Each left hand side expression must be assignable. If single right hand side expression given, the value of the expression converted into an array, then each element in array assigned one by one to the left hand side expressions. If number of elements in the array is greater than left hand sides, they are just ignored. If left hand sides are longer than the array, nil will be added to the locations.

多重赋值形式从表达式或数组中执行多重赋值。每个左值都应该是可赋值的。如果近给定了单个右值，表达式的值将会被装换为数组，然后数组中的每一个值都一一对应的对左边值进行赋值。如果数组的元素个数大于左值的个数，多余的将会被忽略掉; 如果左边值大于数组个数，多余的部分将赋值为nil。

Multiple assignment acts like this:

多重赋值的格式如下:

	foo, bar = [1, 2]	# foo = 1; bar = 2
	foo, bar = 1, 2		# foo = 1; bar = 2
	foo, bar = 1		# foo = 1; bar = nil

	foo, bar, baz = 1, 2	# foo = 1; bar = 2; baz = nil
	foo, bar = 1, 2, 3	# foo = 1; bar = 2
	foo,*bar = 1, 2, 3	# foo = 1; bar = [2, 3]

The value of the multiple assignment expressions are the array used to assign.

多重赋值的表达式的值是用来赋值的数组。

### 操作符表达式(Operator expressions)

Examples:

	1+2*3/4

As a syntax sugar, several methods and control structures has operator form. Ruby has operators show below:

作为语法糖，一些方法和控制结构拥有操作符形式。Ruby拥有如下的操作符：

	high   ::
	       []
	       **
	       -(unary)  +(unary)  !  ~
	       *  /  %
	       +  -
	       <<  >>
	       &
	       |  ^
	       >  >=  <  <=
	       <=> ==  === !=  =~  !~
	       &&
	       ||
	       .. ...
	       =(+=, -=...)
	       not
	low    and or

Most of operators are just method invocation in special form. But some operators are not methods, but built in to the syntax:

大多数的操作符是方法调用的特殊形式，但是一些操作符不是方法，而是内建到语法系统中的:

	=, .., ..., !, not, &&, and, ||, or, !=, !~ 

In addition, assignment operators(+= etc.) are not user-definable.

此外，赋值操作符(+=)不是用户可定义的。

### Control structure

Control structures in Ruby are expressions, and have some value. Ruby has the loop abstraction feature called iterators. Iterators are user-definable loop structure.

在Ruby中的控制结构是表达式，并拥有一些值。Ruby拥有称为迭代器的循环抽象，迭代器是用户可定义的循环结构。

**if**

Examples:

	if age >= 12 then
	  print "adult fee\n"
	else
	  print "child fee\n"
	end
	gender = if foo.gender == "male" then "male" else "female" end

Syntax:

	if expr [then]
	  expr...
	[elsif expr [then]
	  expr...]...
	[else
	  expr...]
	end

if expressions are used for conditional execution. The values false and nil are false, and everything else are true. Notice Ruby uses elsif, not else if nor elif.

if表达式用作条件执行。false和nil的值被看作false，其他所有的表达式均被看作是true。注意，Ruby使用elsif，而不是else if或者elif。

If conditional part of if is the regular expression literal, then it evaluated like:

如果if的条件部分是正则表达式，其求值形式如下：

	$_ =~ /re/

**if modifier**

Examples:

	print "debug\n" if $debug

Syntax:

	expr if expr

executes left hand side expression, if right hand side expression is true.

如果右边的表达式为true，则执行左边的表达式。

**unless**

Examples:

	unless $baby
	  feed_meat
	else
	  feed_milk
	end

Syntax:

	unless expr [then]
	  expr...
	[else
	  expr...]
	end

unless expressions are used for reverse conditional execution. It is equivalent to:

unless表达式用来反转条件执行，其等价于如下的形式：

	if !(cond)
	  ...
	else
	  ...
	end

**unless modifier**

Examples:

	print "stop\n" unless valid($passwd)

Syntax:

	expr unless expr

executes left hand side expression, if right hand side expression is false.

如果右边的表达式为false，就执行左边的表达式。

**case**

Examples:

	case $age
	when 0 .. 2
	  "baby"
	when 3 .. 6
	  "little child"
	when 7 .. 12
	  "child"
	when 12 .. 18
	  # Note: 12 already matched by "child"
	  "youth"
	else
	  "adult"
	end

Syntax:

	case expr
	[when expr [, expr]...[then]
	  expr..]..
	[else
	  expr..]
	end

the case expressions are also for conditional execution. Comparisons are done by operator ===. Thus:

case表达式也是条件执行。通过===进行比较。所以: 

	case expr0
	when expr1, expr2
	  stmt1
	when expr3, expr4
	  stmt2
	else
	  stmt3
	end

is basically same to below:

	_tmp = expr0
	if expr1 === _tmp || expr2 === _tmp
	  stmt1
	elsif expr3 === _tmp || expr4 === _tmp
	  stmt2
	else
	  stmt3
	end

Behavior of the === method varies for each Object. See docutmentation for each class.

每个对象的===方法都是变化的，所以需要参考每个类的文档。

**and**

Examples:

	test && set
	test and set

Syntax:

	expr '&&' expr
	expr 'and' expr

Evaluates left hand side, then if the result is true, evaluates right hand side. and is lower precedence alias.

对左边表达式求值，如果左边的值为真，则对右边的部分进行求值，and是的优先级比&&低。

**or**

Examples:

	demo || die
	demo or die

Syntax:

	expr '||' expr
	expr or expr

Evaluates left hand side, then if the result is false, evaluates right hand side. or is lower precedence alias.

对左边表达式求值，如果结果为false，则继续对右边的进行求值。or是||的低优先级别名。

**not**

Examples:

	! me
	not me
	i != you

Syntax:

	'!' expr
	not expr

Returns true if false, false if true.

	expr '!=' expr

Syntax sugar for !(expr == expr).

	expr '!~' expr

Syntax sugar for !(expr =~ expr).

expr '!=' expr是!(expr == expr)的语法糖表示，expr '!~' expr是!(expr =~ expr)的语法糖表示。

### 区间表达式(Range expressions)

Examples:

	1 .. 20
	/first/ ... /second/

Syntax:

	expr '..' expr
	expr '...' expr

If range expression appears in any other place than conditional expression, it returns range object from left hand side to right hand side.

区间表达式可以出现在任何位置，而不仅仅是条件表达式，其返回从左到右的区间对象。

If range expression appears in conditional expression, it gives false until left hand side returns true, it stays true until right hand side is true. .. acts like awk, ... acts like sed.

如果区间表达式出现在条件表达式中，左边的值返回为true时，为false，右边值返回为true时，返回为false。其行为类似awk和sed。

**while**

Examples:

	while sunshine
	  work()
	end

Syntax:

	while expr [do]
	  ...
	end

Executes body while condition expression returns true.

但条件表达式为true是执行循环体。

**while modifier**

Examples:

	sleep while idle

Syntax:

	expr while expr

Repeats evaluation of left hand side expression, while right hand side is true. If left hand side is begin expression, while evaluates that expression at lease once.

对左边的值重复求值，直到右边的值为真。如果左边的是begin表达式，则while表达式至少求值一次。

**until**

Examples:

	until sunrise
	  sleep
	end

Syntax:

	until expr [do]
	  ...
	end

Executes body until condition expression returns true.

知道条件返回为真是执行循环体。

**until modifier**

Examples:

	work until tired

Syntax:

	expr until expr

Repeats evaluation of left hand side expression, until right hand side is true. If left hand side is begin expression, until evaluates that expression at lease once.

重复对左边进行求值，直到右边表达式为空。如果左边为begin表达式，至少求值一次。

### 迭代器(Iterators)

Examples:

	[1,2,3].each do |i| print i*2, "\n" end
	[1,2,3].each{|i| print i*2, "\n"}

Syntax:

	method_call do ['|' expr...'|'] expr...end
	method_call '{' ['|' expr...'|'] expr...'}'

The method may be invoked with the block (do .. end or {..}). The method may be evaluate back that block from inside of the invocation. The methods that calls back the blocks are sometimes called as iterators. The evaluation of the block from iterator is done by yield.

方法中可以传递块(do .. end 或 {..})。方法可以对块进行求值并在内部调用块。调用块的方法有时称之为迭代器。从迭代器中对块进行求值通过yield。

The difference between do and braces are:

do和花括号之间的区别是: 

    Braces has stronger precedence. For example:
    花括号有很强的过程性。例如:

    	foobar a, b do .. end	# foobar will be called with the block.
    	foobar a, b { .. }	# b will be called with the block.

    Braces introduce the nested local scopes, that is newly declared local variables in the braces are valid only in the blocks. For example:
    花括号引入嵌套局部域，即在花括号中声明的局部变量只在块中有效。例如:

    	foobar {
    	  i = 20		# local variable 'i' declared in the block.
    	  ...
    	}
    	print defined? i	# 'i' is not defined here.     
    	foobar a, b { .. }	# it is not valid outside of the block


**for**

Examples:

	for i in [1, 2, 3]
	  print i*2, "\n"
	end

Syntax:

	for lhs... in expr [do]
	  expr..
	end

Executes body for each element in the result of expression. for is the syntax sugar for:

为表达式中每个元素执行程序体。如下就是for循环的语法糖: 

	(expr).each '{' '|' lhs..'|' expr.. '}'

**yield**

Examples:

	yield data

Syntax:

	yield '(' [expr [',' expr...]])
	yield [expr [',' expr...]]

Evaluates the block given to the current method with arguments, if no argument is given, nil is used as an argument. The argument assignment to the block prameter is done just like multiple assignment. If the block is not supplied for the current method, the exception is raised.

根据传递给当前方法的参数执行块，如果没有给定参数，使用nil作为参数。块的参数的赋值可以通过多赋值。如果当前方法不支持块，则抛出异常。

**raise**

Examples:

	raise "you lose"  # raise RuntimeError
	# both raises SyntaxError
	raise SyntaxError, "invalid syntax"
	raise SyntaxError.new("invalid syntax")
	raise		  # re-raise last exception

Syntax:

	raise
	raise message_or_exception
	raise error_type, message
	raise error_type, message, traceback

Raises a exception. In the first form, re-raises last exception. In second form, if the argument is the string, creates a new RuntimeError exception, and raises it. If the argument is the exception, raise raises it. In the third form, raise creates a new exception of type error_type, and raises it. In the last form, the third argument is the traceback information for the raising exception in the format given by variable $@ or caller function.

抛出一个异常。在第一种形式中，re-raise最新的异常。在第二种形式中，如果参数是字符串，则创建新的RuntimeError异常，然后抛出。如果参数是异常，再一次抛出。在第三种形式中，传见error_type类型的新异常，并抛出它。最后一种形式中，第三个参数是抛出异常的追踪信息，并以$@变量或者调用函数给定的格式显示。

The exception is assigned to the variable $!, and the position in the source file is assigned to the $@.

异常赋值给变量$!，源代码的位置信息放在$@中。

The word 'raise' is not the reserved word in Ruby. raise is the method of the Kernel module. There is an alias named fail. 

raise并不是Ruby的保留字，而是Kernel模块的方法。该方法存在一个别名为fail。

**begin**

Examples:

	begin
	  do_something
	rescue
	  recover
	ensure
	  must_to_do
	end

Syntax:

	begin
	  expr..
	[rescue [error_type,..]
	  expr..]..
	[else
	  expr..]
	[ensure
	  expr..]
	end

begin expression executes its body and returns the value of the last evaluated expression.

begin表达式执行代码体并返回最后一个求值的表达式。

If an exception occurs in the begin body, the rescue clause with the matching exception type is executed (if any). The match is done by the kind_of?. The default value of the rescue clause argument is the StandardError, which is the superclass of most built-in exceptions. Non-local jumps like SystemExit or Interrupt are not subclass of the StandardError.

如果在begin代码体中发生了异常，rescue表达式匹配的异常将会被执行。

The begin statement has an optional else clause, which must follow all rescue clauses. It is executed if the begin body does not raise any exception.

For the rescue clauses, the `error_type` is evaluated just like the arguments to the method call, and the clause matches if the value of the variable $! is the instance of any one of the `error_type` of its subclass. If error_type is not class nor module, the rescue clause raises TypeError exception.

If ensure clause given, its clause body executed whenever beginbody exits.

如果给定了ensure表达式，无论何时，其代码体都会被执行。

**retry**

Examples:

	retry

Syntax:

	retry

If retry appears in rescue clause of begin expression, restart from the beginning of the begin body.

如果retry语句出现在begin表达式的rescue语句中，将从begin的代码体开始处重新执行。

	begin
	  do_something # exception raised
	rescue
	  # handles error
	  retry  # restart from beginning
	end

If retry appears in the iterator, the block, or the body of the for expression, restarts the invocation of the iterator call. Arguments to the iterator is re-evaluated.

如果retry出现在迭代器，代码块，或for语句的代码体中，重新调用迭代器，并对其参数重新求值。

	for i in 1..5
	  retry if some_condition # restart from i == 1
	end

	# user defined "until loop"
	def UNTIL(cond)
	  yield
	  retry if not cond
	end

retry out of rescue clause or iterators raises exception.

在迭代器或recuse之外的retry语句将抛出异常。

======

**return**

Examples:

	return
	return 12
	return 1,2,3

Syntax:

	return [expr[',' expr...]]

Exits from method with the return value. If more than two expressions are given, the array contains these values will be the return value. If no expression given, nil will be the return value.

**break**

Examples:

	i=0
	while i<3
	  print i, "\n"
	  break
	end

Syntax:

	break

Exits from the most internal loop. Notice break does not exit from case expression like C.

**next**

Examples:

	next

Syntax:

	next

Jumps to next iteration of the most internal loop.

**redo**

Examples:

	redo

Syntax:

	redo

Restarts this iteration of the most internal loop, without checking loop condition.

### BEGIN

Examples:

	BEGIN {
	  ...
	}

Syntax:

	BEGIN '{'
	  expr..
	'}'

Registers the initialize routine. The block followed after BEGIN is evaluated before any other statement in that file (or string). If multiple BEGIN blocks are given, they are evaluated in the appearing order.

注册初始化子程序。在BEGIN之后的代码块将会文件中的任何语句之前执行。

The BEGIN block introduce new local-variable scope. They don't share local variables with outer statements.

The BEGIN statement can only appear at the toplevel.

### END

Examples:

	END {
	  ...
	}

Syntax:

	END '{' expr.. '}'

Registers finalize routine. The block followed after END is evaluated just before the interpreter termination. Unlike BEGIN, END blocks shares their local variables, just like blocks.

The END statement registers its block only once at the first execution. If you want to register finalize routines many times, use at_exit.

The END statement can only appear at the toplevel. Also you cannot cancel finalize routine registered by END.

### Class definitions

Examples:

	class Foo < Super
	  def test
	     :
	  end
	     :
	end

Syntax:

	class identifier ['<' superclass ]
	  expr..
	end

Defines the new class. The class names are identifiers begin with uppercase character.

### Singleton-class definitions

Examples:

	class << obj
	  def test
	     :
	  end
	     :
	end

Syntax:

	class '<<' expr
	  expr..
	end

Defines the class attribute for certain object. The definitions within this syntax only affect the specified object.

### Module definitions

Examples:

	module Foo
	  def test
	     :
	  end
	     :
	end

Syntax:

	module identifier
	  expr..
	end

Defines the new module The module names are identifiers begin with uppercase character.

### Method definitions

Examples:

	def fact(n)
	  if n == 1 then
	     1 
	  else
	    n * fact(n-1)
	  end
	end

Syntax:

	def method_name ['(' [arg ['=' default]]...[',' '*' arg ]')']
	  expr..
	end

Defines the new method. Method_name should be either identifier or re-definable operators (e.g. ==, +, -, etc.). Notice the method is not available before the definition. For example:

	foo
	def foo
	  print "foo\n"
	end

will raise an exception for undefined method invoking.

The argument with default expression is optional. The evaluation of the default expression is done at the method invocation time. If the last argument preceded by *, actual parameters which don't have corresponding formal arguments are assigned in this argument as an array.
If the last argument preceded by &, the block given to the method is converted into the Proc object, and assigned in this argument. In case both * and & are present in the argument list, & should come later.

The method definitions can not be nested.

The return value of the method is the value given to the return, or that of the last evaluated expression.

Some methods are marked as 'private', and must be called in the function form.

When the method is defined outside of the class definition, the method is marked as private by default. On the other hand, the methods defined in the class definition are marked as public by default. The default visibility and the 'private' mark of the methods can be changed by public or private of the Module.

In addition, the methods named initialize are always defined as private methods.

### Singleton-method definitions

Examples:

	def foo.test
	  print "this is foo\n"
	end

Syntax:

	def expr '.' identifier ['(' [arg ['=' default]]...[',' '*' arg ]')']
	  expr..
	end

The singleton-method is the method which belongs to certain object. The singleton-method definitions can be nested.

The singleton-methods of classes inherited to its subclasses. The singleton-methods of classes are acts like class methods in other object-oriented languages.

**alias**

Examples:

	alias foo bar
	alias $MATCH $&

Syntax:

	alias method-name method-name
	alias global-variable-name global-variable-name

Gives alias to methods or global variables. Aliases can not be defined within the method body.

The aliase of the method keep the current definition of the method, even when methods are overridden.

Making aliases for the numbered global variables ($1, $2,...) is prohibited. Overriding the builtin global variables may cause serious problems.

**undef**

Examples:

	undef bar

Syntax:

	undef method-name

Cancels the method definition. Undef can not appear in the method body. By using undef and alias, the interface of the class can be modified independently from the superclass, but notice it may be broke programs by the internal method call to self.

**defined?**

Examples:

	defined? print
	defined? File.print
	defined?(foobar)
	defined?($foobar)
	defined?(@foobar)
	defined?(Foobar)

Syntax:

	defined? expr

Returns false if the expression is not defined. Returns the string that describes a kind of the expression. 

