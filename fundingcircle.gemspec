# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fundingcircle/version'

Gem::Specification.new do |gem|
  gem.name          = "FundingCircle"
  gem.version       = Fundingcircle::VERSION
  gem.authors       = %w(plcstevens)
  gem.email         = %w(philip@tauri-tec.com)
  gem.description   = %q{Program that prints out a multiplication table of the first 10 prime numbers.}
  gem.summary       = %q{The program runs on the command line and takes the first 10 prime numbers and prints them out
                          in a multiplication table, across the top and down the side. Every other table row and column
                          are the product of the two prime numbers.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec|spec|features)/})
  gem.require_paths = %w(lib)

  gem.add_dependency 'thor'
  gem.add_dependency 'terminal-table'

  gem.add_development_dependency "bundler"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rdoc", "~> 3.12"
  gem.add_development_dependency "jeweler", "~> 1.8.4"
end
