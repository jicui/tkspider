opt="-l"
puts `ls #{opt}`

puts %x{ls #{opt}}