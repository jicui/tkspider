def fib_up(max)
	i1,i2=1,1
	while(i1<max)
		yield i1
		i1,i2=i2,i1+i2
	end
end

fib_up(100) {|f| print f," " }
puts [1,3,4,5,6].find {|v| v%2==0}
puts ['E','B','A','Y'].collect{|e| e.succ}

f=File.open("testfile")
f.each{|line| puts "The line is #{line}"}
f.close

f1=File.open "testfile"
f1.each.with_index{|line,index| puts "this line #{index} is #{line}" }
f1.close

p `ruby --version`