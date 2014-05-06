#!/usr/bin/env ruby
require 'gli'
require_relative "version_manager.rb"

include GLI::App
 
program_desc 'Shape utility command line tool'

version '0.0.1'


desc 'Be verbose'
switch 'verbose'

desc "branch operatoins"
long_desc "contains all the sub commands related to the branch operations"
command (:branch) {|c|
	
	c.desc 'rebase the target branch with given branch'
	c.command(:rebase){|rebase|
		rebase.desc 'Specify the rebase from branch'
		rebase.arg_name 'rebased from p4_path'
		rebase.default_value '//stubhub/domain/fulfillment/main/'
		rebase.flag [:from]

		rebase.desc 'Specify the rebase to branch'
		rebase.arg_name 'rebase to p4_path'
		rebase.flag [:to]

		rebase.action{|global_options,options,args|
			puts "rebase branch from=#{options[:from]} to=#{options[:to]}"
		}

	}

	c.desc 'update the given branch verison to from version1 to verison2'
	c.long_desc 'update the give branch version to a new one ,this usuall apply before a rebase operation'
	c.command(:updatevers){|updatevers|
		updatevers.desc 'Specify the target branch path'
		updatevers.arg_name 'branchName'
		updatevers.default_value '//stubhub/domain/fulfillment/pb_fulfillment_revamp/'
		updatevers.flag [:path]

		updatevers.action{|global_options,options,args|
			puts "update version for branch=#{options[:path]} from version=#{args[0]} to version=#{args[1]}"	
		}

	}
}


 
exit run(ARGV)