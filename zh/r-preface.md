---
layout: post
title: 前言
---

Ruby is the interpreted scripting language for quick and easy object-oriented programming. It has many features to process text files and to do system management tasks (as in Perl). It is simple, straight-forward, and extensible.

Ruby是一门快速上手且容易学习的解释型脚本语言。其拥有很多文本处理以及系统任务的特性。Ruby简单，直接并且可扩展。

If you want a language for easy object-oriented programming, or you don't like the PERL ugliness, or you do like the concept of lisp, but don't like too much parentheses, Ruby may be the language of the choice.

如果你想要简单的面向对象的编程语言，但又嫌Perl过于丑陋; 或者爱好Lisp提倡的概念，但有不想要太多括号; Ruby或许是个不错的选择。

Ruby's features are as follows:
Ruby的特性如下:

- **Interpretive** 
        Ruby is the interpreted language, so you don't have to recompile to execute the program written in Ruby. 
        Ruby是解释性的语言，所以，不需要重编译以Ruby编写的程序。
- **Variables have no type (dynamic typing)**
        Variables in Ruby can contain data of any type. You don't have to worry about variable typing. Consequently, it has weaker compile time check. 
        Ruby中的变量可以包含任意类型。不需要担心类型检查。最终，其编译时检查很弱。
- **No declaration needed**
        You can use variables in your Ruby programs without any declarations. Variable name itself denotes its scope (local, global, instance, etc.) 
        使用变量不需要申明，变量名本身决定了其作用域(局部的，全局的，实例的等等)
- **Simple syntax**
        Ruby has simple syntax influenced slightly from Eiffel. 
        Ruby简洁的语法受Eiffel的影响。
- **No user-level memory management**
        Ruby has automatic memory management. Objects no longer referenced from anywhere are automatically collected by the garbage collector built in the interpreter. 
        Ruby拥有自动内存管理。不再引用的对象将自动的被处理器内建的垃圾回收器回收。
- **Everything is object**
        Ruby is the pure object-oriented language from the beginning. Even basic data like integers are treated uniformly as objects. 
        Ruby是一个彻头彻尾的面向对象语言，甚至像整数这样的基本的类型也被看作为对象。
- **Class, inheritance, methods**
        Of course, as a O-O language, Ruby has basic features like classes, inheritance, methods, etc. 
        当然，作为一个面向对象的语言。Ruby拥有诸如类、继承、方法之类的基本特性。
- **Singleton methods**
        Ruby has the feature to define methods for certain specified object. For example, you can define a press-button action for certain GUI button by defining a singleton method for the button. Or, you can make up your own prototype based object system using singleton methods (if you want to). 
        Ruby拥有为某些特定的对象定义方法的特征。例如，可以通过为某些GUI的按钮定义一个press-button动作。或者，可以通过单件方法组成自己的基于原型的面向对象系统。
-  **Mix-in by modules**
        Ruby does not have the multiple inheritance intentionally. IMO, It is the source of confusion. Instead, Ruby has modules to share the implementation across the inheritance tree. It is often called the "Mix-in." 
        Ruby没有多重继承。某种程度而言，多重继承是冲突之源。取而代之的是，Ruby有可在继承树之间共享实现的模块，通常称之为Mix-in。
-  **Iterators**
        Ruby has iterators for loop abstraction. 
        Ruby拥有循环抽象的迭代器。
-  **Closures**
        In Ruby, you can objectify the procedure. 
        在Ruby中可以对象化过程。
-  **Text processing and regular expression**
        Ruby has bunch of text processing features like in Perl. 
        Ruby拥有类似Perl的成打的文本处理特性。
-  **Bignums**
        With built-in bignums, you can calculate factorial(400), for example. 
        通过内建的大数类型，可以计算factorial(400)。
-  **Exception handling**
        As in Java(tm). 同Java类似。
-  **Direct access to OS**
        Ruby can call most of system calls on UNIX boxes. It can be used in system programming. 
        Ruby可以调用大多数的UNIX系统调用，这通常用作系统调用。
-  **Dynamic loading**
        You can load object files into Ruby interpreter on-the-fly, on most of UNIXes. 
        可以在Ruby解析器中即刻加载类文件。
