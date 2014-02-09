# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "manaraga/version"

Gem::Specification.new do |s|
  s.name        = "manaraga"
  s.version     = Manaraga::VERSION
  s.authors     = ["Andrew Kozlov"]
  s.email       = ["demerest@gmail.com"]
  s.homepage    = "http://github.com/rocsci/manaraga"
  s.summary     = ""
  s.description = ""
  s.license     = "MIT"

  #s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'rails', '>= 3.0'
  s.add_dependency 'inherited_resources'
  s.add_dependency 'draper'
  s.add_dependency 'kaminari'
  s.add_dependency 'simple_form'

  s.add_development_dependency 'rake', '>= 0.9.2'
  s.add_development_dependency 'rspec', '~> 2.12'
  s.add_development_dependency 'rspec-rails', '~> 2.12'
end
