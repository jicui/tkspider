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
long_desc 'Add a new task to the list.  The task name can be specified with or without quotes'
arg_name 'task name'
command :add do |c|
 c.desc 'Make the new task the highest priority task'
 c.action do |global_options,options,args|
   puts "global_options=#{global_options}"
   puts "options=#{options}"
   puts "args=#{args}"
  end
end

desc "Rebase the branch from main"
long_desc "Rebase the current branch from main to be ready from integration"
arg_name "'p4Path'"
command (:rebase) {|c|
	c.action {|global_options,options,args|
		puts "global_options=#{global_options}"
   		puts "options=#{options}"
   		puts "args=#{args}"
	}
}
 
exit run(ARGV)