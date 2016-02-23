# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree-bank-transfer'
  s.version     = '3.0.0'
  s.summary     = 'Spree extension to create bank transfer payment method.'
  s.description = 'This Spree extension allows admin to provide bank transfer payment method to its users.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Mohit Bansal'
  s.email     = 'info@vinsol.com'
  s.homepage  = 'http://vinsol.com'
  s.license   = "MIT"
  s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

<<<<<<< HEAD
  s.add_dependency 'spree_core', '~> 2.4.0'
=======
  s.add_dependency 'spree_core', '~> 3.0.0.rc2'
>>>>>>> 234d9fad5df03b8b96765a1d5958bb9795226a8d

end
