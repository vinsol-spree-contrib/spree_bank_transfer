# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_bank_transfer'
  s.version     = '2.0.5'
  s.summary     = 'Creates bank transfer payment method'
  s.description = 'This extension allows admin to provide bank transfer payment method to its users.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Mohit Bansal'
  s.email     = 'info@vinsol.com'
  s.homepage  = 'http://vinsol.com'
  s.license   = "MIT"
  s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.0.3'

end
