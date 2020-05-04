# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spree_bank_transfer/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_bank_transfer'
  s.version     = '4.1.0'
  s.summary     = 'Spree extension to create bank transfer payment method.'
  s.description = 'This Spree extension allows admin to provide bank transfer payment method to its users.'
  s.required_ruby_version = '>= 2.1.0'

  s.author    = 'Mohit Bansal'
  s.email     = 'info@vinsol.com'
  s.homepage  = 'http://vinsol.com'
  s.license   = "MIT"

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version =  '>= 3.1.0', '< 5.0'
  s.add_dependency 'spree_core', spree_version
  s.add_dependency 'spree_backend', spree_version
  s.add_dependency 'spree_frontend', spree_version
  s.add_dependency 'spree_extension'
  s.add_dependency 'deface', '~> 1.0'
  s.add_dependency 'jquery-rails', ' ~> 4.3.5'
  s.add_dependency 'jquery-ui-rails', ' ~> 6.0.1'

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'pg'
end
