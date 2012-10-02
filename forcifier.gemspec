# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "forcifier/version"

Gem::Specification.new do |s|
  s.name        = "forcifier"
  s.version     = Forcifier::VERSION
  s.authors     = ["Jeff Douglas"]
  s.email       = ["jeff@jeffdouglas.com"]
  s.homepage    = ""
  s.summary     = %q{Makes 'stuff' coming from Force.com pretty}
  s.description = %q{Provides utility methods to make Force.com fields nicer such as removing '__c', lowercasing fields names, etc.}

  s.rubyforge_project = "forcifier"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
