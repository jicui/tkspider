#!/usr/bin/env ruby
require 'gli'

include GLI::App
 
program_desc 'Shape utility command line tool'

version '0.0.1'


desc 'Specify the file where the tasklist lives'
arg_name 'path'
default_value 'abc'
flag [:t,:tasklist]

desc 'Be verbose'
switch 'verbose'

desc 'Add a new task to do'
long_desc <<EOS
Add a new task to the list.  The task name can be specified with or without quotes
EOS
arg_name 'task name'
command :add do |c|
 c.desc 'Make the new task the highest priority task'
 c.action do |global_options,options,args|
   puts "print out params",global_options,options,args
  end
end
 
exit run(ARGV)