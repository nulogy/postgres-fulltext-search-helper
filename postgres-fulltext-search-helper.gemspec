# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'postgres-fulltext-search-helper/version'

Gem::Specification.new do |gem|
  gem.name          = "postgres-fulltext-search-helper"
  gem.version       = Postgres::Fulltext::Search::Helper::VERSION
  gem.authors       = ["Justin Fitzsimmons", "Arturo Pie", "Shahriyar Nasir"]
  gem.email         = ["justinf@nulogy.com", "arturop@nulogy.com", "shahn@nulogy.com"]
  gem.description   = %q{Use postgres' fulltext search with ease}
  gem.summary       = ""
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec", "~> 3.0"
  gem.add_development_dependency "rake", "~> 10.0"
end
