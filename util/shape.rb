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
		rebase.flag [:rb,:rebase]

		rebase.desc 'Specify the target branch'
		rebase.arg_name 'rebase to p4_path'
		rebase.default_value '//stubhub/domain/fulfillment/pb_fulfillment_revamp/'
		rebase.flag [:tgt,:target]

		rebase.action{|global_options,options,args|
			puts "global_options=#{global_options}"
			puts "options=#{options}"
			puts "args=#{args}"
		}

	}

	c.desc 'update the given branch verison to from version1 to verison2'
	c.long_desc 'update the give branch version to a new one ,this usuall apply before a rebase operation'
	c.command(:updatevers){|updatevers|
		updatevers.desc 'Specify the version one'
		updatevers.arg_name 'version1'
		updatevers.default_value 'default version1'
		updatevers.flag [:v1,:version1]

		updatevers.desc 'Specify the version two'
		updatevers.arg_name 'version2'
		updatevers.default_value 'default verison2'
		updatevers.flag [:v2,:version2]

		updatevers.action{|global_options,options,args|
			puts "global_options=#{global_options}"
			puts "options=#{options}"
			puts "args=#{args}"
		}

	}
}


 
exit run(ARGV)