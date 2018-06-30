$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "my_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "my_engine"
  s.authors     = ["Alexander Huber"]
  s.version     = MyEngine::VERSION
  s.summary     = "Summary of MyEngine."
  s.description = "Description of MyEngine."

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile"]

  s.add_dependency "railties"
  s.add_dependency "cells-rails"
end
