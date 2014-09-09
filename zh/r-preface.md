---
layout: post
title: 前言
---

 Ruby is the interpreted scripting language for quick and easy object-oriented programming. It has many features to process text files and to do system management tasks (as in Perl). It is simple, straight-forward, and extensible.

If you want a language for easy object-oriented programming, or you don't like the PERL ugliness, or you do like the concept of lisp, but don't like too much parentheses, Ruby may be the language of the choice.

Ruby's features are as follows:

    Interpretive
        Ruby is the interpreted language, so you don't have to recompile to execute the program written in Ruby. 
    Variables have no type (dynamic typing)
        Variables in Ruby can contain data of any type. You don't have to worry about variable typing. Consequently, it has weaker compile time check. 
    No declaration needed
        You can use variables in your Ruby programs without any declarations. Variable name itself denotes its scope (local, global, instance, etc.) 
    Simple syntax
        Ruby has simple syntax influenced slightly from Eiffel. 
    No user-level memory management
        Ruby has automatic memory management. Objects no longer referenced from anywhere are automatically collected by the garbage collector built in the interpreter. 
    Everything is object
        Ruby is the pure object-oriented language from the beginning. Even basic data like integers are treated uniformly as objects. 
    Class, inheritance, methods
        Of course, as a O-O language, Ruby has basic features like classes, inheritance, methods, etc. 
    Singleton methods
        Ruby has the feature to define methods for certain specified object. For example, you can define a press-button action for certain GUI button by defining a singleton method for the button. Or, you can make up your own prototype based object system using singleton methods (if you want to). 
    Mix-in by modules
        Ruby does not have the multiple inheritance intentionally. IMO, It is the source of confusion. Instead, Ruby has modules to share the implementation across the inheritance tree. It is often called the "Mix-in." 
    Iterators
        Ruby has iterators for loop abstraction. 
    Closures
        In Ruby, you can objectify the procedure. 
    Text processing and regular expression
        Ruby has bunch of text processing features like in Perl. 
    Bignums
        With built-in bignums, you can calculate factorial(400), for example. 
    Exception handling
        As in Java(tm). 
    Direct access to OS
        Ruby can call most of system calls on UNIX boxes. It can be used in system programming. 
    Dynamic loading
        You can load object files into Ruby interpreter on-the-fly, on most of UNIXes. 


