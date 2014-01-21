SpreeBankTransfer
=================

This extension allows admin to provide bank transfer payment method to its users.


Installation
------------

Add spree_bank_transfer to your Gemfile:

```ruby
gem 'spree-bank-transfer', require: 'spree_bank_transfer'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_bank_transfer:install
```

Use
-------------
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

Copyright (c) 2014 Vinsol, released under the New MIT License
