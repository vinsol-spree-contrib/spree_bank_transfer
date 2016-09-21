source 'https://rubygems.org'

# Provides basic authentication functionality for testing parts of your engine
version = '3-1-stable'
gem 'spree', github: 'spree/spree', branch: version
gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: version

gem 'coffee-rails', ' ~> 4.0.1'
gem 'sass-rails', '~> 5.0.1'

group :test do
  gem 'minitest'
  gem 'rspec-rails', '~> 3.4.0'
  gem 'shoulda-matchers', '~> 3.1.1'
  gem 'rspec-activemodel-mocks', '~> 1.0.3'
  gem 'simplecov', require: false
  gem 'database_cleaner'
end
gemspec