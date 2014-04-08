#!/usr/bin/env ruby
require 'gli'
require_relative "version_manager.rb"

include GLI::App
 
program_desc 'Shape utility command line tool'

version '0.0.1'

desc 'Specify the p4 path for target shape project'
arg_name 'path'
default_value '//stubhub/domain/fulfillment/pb_fulfillment_revamp/'
flag [:p,:p4_path]

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
arg_name "[rebase from p4 path]"

command (:rebase) {|c|
	c.action {|global_options,options,args|
		branch=global_options[:target_branch_path]
		puts "target branch #{branch}"
		to=args[0]
		sp=ShapeBranch.new(branch)
		sp.integrate(branch,to)
	}
}


desc "Update the shape branch version"
long_desc "Update the shape branch version,this should be done before rebase"
arg_name "[old vesion name] [new version name]"

command (:update_version) {|c|
	c.action {|global_options,options,args|
		#sp=ShapeBranch.new(args[0])

	}
}

 
exit run(ARGV)