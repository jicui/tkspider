#!/usr/bin/env ruby
require 'gli'
require_relative "version_manager.rb"

include GLI::App
 
program_desc 'Shape utility command line tool'

version '0.0.1'


desc 'Be verbose'
switch 'verbose'

desc "branch operatoins"
long_desc "contains all the sub commands related to the branch operations,\n 
		   Note:make sure the current location is under the p4 client path"
command (:branch) {|c|
	
	c.desc 'rebase the target branch with given branch'
	c.command(:rebase){|rebase|
		rebase.desc 'Specify the rebase from branch'
		rebase.arg_name 'rebased from p4_path'
		rebase.flag [:from]

		rebase.desc 'Specify the rebase to branch'
		rebase.arg_name 'rebase to p4_path'
		rebase.flag [:to]

		rebase.action{|global_options,options,args|
			_from=options[:from]
			_to=options[:to]
			shapeBranch=ShapeBranch.new
			shapeBranch.integrate(_from,_to)
		}

	}

	c.desc 'update the given branch verison to from version1 to verison2'
	c.long_desc 'update the give branch version to a new one ,this usuall apply before a rebase operation'
	c.command(:updatevers){|updatevers|
		updatevers.desc 'Specify the target local p4 path'
		updatevers.arg_name 'branchName'
		updatevers.flag [:path]

		updatevers.action{|global_options,options,args|
			_path=options[:path]
			_v1=args[0]
			_v2=args[1]
			shapeBranch=ShapeBranch.new
			shapeBranch.updateVersion(_path,_v1,_v2)
		}

	}
}


 
exit run(ARGV)