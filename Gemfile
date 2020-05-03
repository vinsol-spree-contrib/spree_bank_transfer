source 'https://rubygems.org'

# Provides basic authentication functionality for testing parts of your engine
spree_version = 'master'
gem 'spree', github: 'spree/spree', branch: spree_version
gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: spree_version

gem 'coffee-rails', '~> 5.0.0'
gem "sass-rails", '~> 6.0.0'

group :test do
  gem 'minitest'
  gem 'rspec-rails', '~> 4.0.0'
  gem 'shoulda-matchers', '~> 4.3.0'
  gem 'rspec-activemodel-mocks', '~> 1.1.0'
  gem 'simplecov', require: false
  gem 'database_cleaner'
end
gemspec
