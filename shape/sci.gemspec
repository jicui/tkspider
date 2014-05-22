# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','sci','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'sci'
  s.version = Sci::VERSION
  s.author = 'CUIJIAJUN'
  s.email = 'jicui@ebay.com'
  s.homepage = 'http://jicui.github.io'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Shape Command Line Interface'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','sci.rdoc']
  s.rdoc_options << '--title' << 'sci' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'sci'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.9.0')
end
