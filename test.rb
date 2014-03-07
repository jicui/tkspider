# define array
a=[1,'cat',3.14]
puts "This first element is #{a[0]}"
a[2]=nil
puts "The array is now #{a.inspect}"
a=%w{ant,bee,tiger,bear}#a new way to define string array
puts "The new %w array is #{a.inspect}"

#define hash
inspect_section={
	'cello'=>'string',
	'clarine'=>'woodwind',
	'drum'=>'percussion',
	'oboe'=>'woodwind',
	'trumpet'=>'brass',
	'violin'=>'string'
}
p inspect_section['oboe']
p inspect_section['cello']
p inspect_section['bassoon']

histogram=Hash.new(0)
p histogram['ruby']
histogram['ruby']=histogram['ruby']+1
p  histogram['ruby']

#Symbol 
# symbol is just some constant names without value assigned
def walk(direction)
	if direction==:east
		p 'go to east'
	elsif direction==:soutth
		p 'go to sourth'
	elsif direction==:west
		p 'go to west'
	elsif direction==:north
		p 'go to north'
	end		
end

walk(:east)
walk(:north)

inst_sec={
	cello:'string',
	clarinet:'woodwind',
	drum:'percussion'
}
p "An clarinet is a #{inst_sec[:clarinet]} instrument"

def control tim
	puts "loop #{tim}" if tim>0
end
control 10

def loop square 
	square=square*square while square<100
	return square 
end

p loop 8

#block
def verbose_greet(name,phrase)
	yield
	puts "#{name},#{phrase}"
end
verbose_greet("Dave","loyal customer"){ puts "Hi"}

def who_says_what
	yield "Dave","hello"
end
who_says_what {|person,phrase| puts "#{person} says #{phrase}"}

('a'..'e').each{|e| print e}

puts "you gave #{ARGV.size} arguments"
puts ARGV
puts ARGF