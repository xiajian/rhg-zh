---
layout: post
title: 命令行选项
---

 Ruby interpreter accepts following command-line options (switches). Basically they are quite similar to those of Perl.

-0digit
    specifies the input record separator ($/) as an octal number. If no digits given, the null character is the separator. Other switches may follow the digits. -00 turns Ruby into paragraph mode. -0777 makes Ruby read whole file at once as a single string, since there is no legal character with that value. 
-a
    turns on auto-split mode when used with -n or -p. In auto-split mode, Ruby executes

    	$F = $_.split

    at beginning of each loop. 
-c
    causes Ruby to check the syntax of the script and exit without executing. If there is no syntax error, Ruby will print "Syntax OK" to the standard output. 
-Kc
    specifies KANJI (Japanese character) code-set. 
-d
--debug
    turns on debug mode. $DEBUG will set true. 
-e script
    specifies script from command-line. if -e switch specified, Ruby will not look for a script filename in the arguments. 
-F regexp
    specifies input field separator ($;). 
-h
--help
    prints a summary of the options. 
-i extension
    specifies in-place-edit mode. The extension, if specified, is added to old filename to make a backup copy.

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
-l
    enables automatic line-ending processing, which means firstly set $\ to the value of $/, and secondly chops every line read using chop!, when used with -n or -p. 
-n
    causes Ruby to assume the following loop around your script, which makes it iterate over filename arguments somewhat like sed -n or awk.

    	while gets
    	  ...
    	end

-p
    acts mostly same as -n switch, but print the value of variable $_ at the each end of the loop.

    example:

    	% echo matz | ruby -p -e '$_.tr! "a-z", "A-Z"'
    	MATZ

-r filename
    causes Ruby to load the file using require. It is useful with switches -n or -p. 
-s
    enables some switch parsing for switches after script name but before any filename arguments (or before a --). Any switches found there is removed from ARGV and set the corresponding variable in the script.

    example:

    	#! /usr/local/bin/ruby -s
    	# prints "true" if invoked with `-xyz' switch.
    	print "true\n" if $xyz

-S
    makes Ruby uses the PATH environment variable to search for script, unless if its name begins with a slash. This is used to emulate #! on machines that don't support it, in the following manner:

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
-w
    enables verbose mode without printing version message at the beginning. It set the variable `$VERBOSE' to true. 
-x[directory]
    tells Ruby that the script is embedded in a message. Leading garbage will be discarded until the first that starts with "#!" and contains string "ruby". Any meaningful switches on that line will applied. The end of script must be specified with either EOF, ^D (control-D), ^Z (control-Z), or reserved word __END__.If the directory name is specified, Ruby will switch to that directory before executing script. 
-X directory
    causes Ruby to switch to the directory. 
-y
--yydebug
    turns on compiler debug mode. Ruby will print bunch of internal state messages during compiling scripts. You don't have to specify this switch, unless you are going to debug the Ruby interpreter itself. 
