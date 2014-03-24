p %x{date}
p `date`
p `ls`

a,b=1,2
p a,b
a=1,2,3,4,5
p a
a,b=1,2,3,4
p a,b
a,*b=1,2,3
p b
a,b,c=1..3
p a,b,c

a,b,c=*1..3
p a,b,c