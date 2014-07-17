Spree Bank Transfer [![Code Climate](https://codeclimate.com/github/vinsol/spree_bank_transfer.png)](https://codeclimate.com/github/vinsol/spree_bank_transfer) [![Build Status](https://travis-ci.org/vinsol/spree_bank_transfer.png?branch=master)](https://travis-ci.org/vinsol/spree_bank_transfer)
=================

Spree Bank Transfer extension creates a new payment method in Spree. This payment method allows customers to pay by transferring money directly into merchant’s  bank account.  It also allows admin to provide their Bank account's (Merchant Bank Account) details which will be displayed to customers while checkout, and they can use this information to make payment for their orders. This extension also facilitate admin to Activate/Deactivate Bank accounts.


Installation
------------

Add spree_bank_transfer to your Gemfile:
```ruby
gem 'spree-bank-transfer', require: 'spree_bank_transfer'
```

For older versions of Spree.
```ruby
# Spree 2.1.0
gem 'spree-bank-transfer', '2.1.0', require: 'spree_bank_transfer'
```

```ruby
# Spree 2.0.x
gem 'spree-bank-transfer', '2.0.5', require: 'spree_bank_transfer'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_bank_transfer:install
```

How it works: 
---

* To add Bank Transfer feature, Admin needs to add “Bank Transfer” payment method:

   Configuration -> Payment Methods -> New payment Method
   
   You need to select “Spree::PaymentMethod::BankTransfer” as the Provider

* Add bank account information from “Banks” link on “Configuration” page.
  
  - Provide Name of the bank
  - Provide Account number
  - Select “Status” check box 

    ![Listing Banks](http://vinsol.com/gems_screenshots/spree-bank-transfer/list%20banks.png)
    
    **Bank Account will be visible on Checkout Page only if it is Active.**
* After adding the payment method and bank details (as stated above), this payment method will be visible on Checkout page while making payment against an order.

*  Active merchant **accounts number** will also be visible on Checkout page under this method.

    ![Checkout](http://vinsol.com/gems_screenshots/spree-bank-transfer/checkout%20page.png)

* Customer will be able to order by completing the order with this method and can transfer money equal to total order value directly into any one of the merchant’s bank account.

* After receiving amount into his account, admin can update order by following the steps: 

    - On ‘Orders’ tab, click on order number to go to the order’s details page..
    - Select “Payments” link.
    - Mark the payment “Capture”
    ![Order Page](http://vinsol.com/gems_screenshots/spree-bank-transfer/order%20page.png)

* The order will not be marked Completed  until admin captures the payment as mentioned in step above.




Contributing
------------

1. Fork the repo.
2. Clone your repo.
3. Run `bundle install`.
4. Run `bundle exec rake test_app` to create the test application in `spec/test_app`.
5. Make your changes.
6. Ensure specs pass by running `bundle exec rspec spec`.
7. Submit your pull request.

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


Credits
-------

[![vinsol.com: Ruby on Rails, iOS and Android developers](http://vinsol.com/vin_logo.png "Ruby on Rails, iOS and Android developers")](http://vinsol.com)

Copyright (c) 2014 [vinsol.com](http://vinsol.com "Ruby on Rails, iOS and Android developers"), released under the New MIT License
