$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sql_separate/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sql_separate"
  s.version     = SqlSeparate::VERSION
  s.authors     = ["Phil Monroe", "Identified"]
  s.email       = ["phil@identified.com"]
  s.homepage    = ""
  s.summary     = "Allows developers to separate custom SQL into separate files in Rails."
  s.description = "Allows developers to separate custom SQL into separate files in Rails."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.0"

end
