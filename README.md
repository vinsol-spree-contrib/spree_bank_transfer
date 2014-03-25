SpreeBankTransfer [![Code Climate](https://codeclimate.com/github/vinsol/spree_bank_transfer.png)](https://codeclimate.com/github/vinsol/spree_bank_transfer) [![Build Status](https://travis-ci.org/vinsol/spree_bank_transfer.png?branch=master)](https://travis-ci.org/vinsol/spree_bank_transfer)
=================

This extension allows admin to provide bank transfer payment method to its users.


Installation
------------

Add spree_bank_transfer to your Gemfile:

```ruby
gem 'spree-bank-transfer'
```

For older versions of Spree.

```ruby
# Spree 2.1.0
gem 'spree-bank-transfer', '2.1.0'
```

```ruby
# Spree 2.0.x
gem 'spree-bank-transfer', '2.0.5'
```

```ruby
gem 'spree-bank-transfer', '2.0.5', require: 'spree_bank_transfer'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_bank_transfer:install
```

Use
---
Login as Admin and create a new payment method with Spree::PaymentMethod::BankTransfer as provider class.

Create bank details under configuration/banks.

Checkout and select bank transfer payment method. Here, user can see the list of bank details.

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_bank_transfer/factories'
```

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Varify build is green (`bundle exec rake test_app` && bundle exec rspec spec )
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

Credits
-------

[![vinsol.com: Ruby on Rails, iOS and Android developers](http://vinsol.com/vin_logo.png "Ruby on Rails, iOS and Android developers")](http://vinsol.com)

Copyright (c) 2014 [vinsol.com](http://vinsol.com "Ruby on Rails, iOS and Android developers"), released under the New MIT License
