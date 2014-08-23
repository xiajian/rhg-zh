# rename.rb - 用完就扔的脚本
# 功能:用来按照某一顺序排列文件名
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
