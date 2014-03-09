a=[1,3,5,7]
puts a
p a[1,3]
a[1,3]=[2,4,6]
p a[1..3]
p a[1...3]
stack=[]
stack.push "tom"
stack.push "jim"
p stack
p stack.pop
p stack.pop

queue=[]
queue.unshift "dick"
queue.unshift "mary"
p queue
p queue[-1]
p queue.shift
p queue.shift

#define the hash
h={
"dog"=>"canine",
"cat"=>"feline"
}
p h

h1={
	dog:'canine',
	cat:'feline'
}

p h1
h3=Hash.new("test")# default to "test"
p h3["abc"]
p h3[:dog]
[1,3,4,5,6].each{|e| p e}