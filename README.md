Spree Bank Transfer [![Code Climate](https://codeclimate.com/github/vinsol/spree_bank_transfer.png)](https://codeclimate.com/github/vinsol/spree_bank_transfer) [![Build Status](https://travis-ci.org/vinsol/spree_bank_transfer.png?branch=master)](https://travis-ci.org/vinsol/spree_bank_transfer)
=================

Spree Bank Transfer is an extension which allows adding a new payment method “Bank Transfer” to existing spree e-commerce store. With the help of this payment method customer can place an order online and pay by transferring money directly into merchant’s  Bank account.  This extension allow merchants to provide their bank account(s) details which in turn is used by customers to order and pay using this method. This extension also facilitate admin to Activate/Deactivate attached Bank accounts. Admin can also filter orders on the basis of the available payment transaction reference numbers with this extension.



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
   
      ![Bank Transfer - Payment Method](https://s3.amazonaws.com/gems-and-extensions-screenshots/Bank+Transfer/Bank-Transfer-Payment-Method.png)

* Add bank account information from “Banks” link on “Configuration” page.
  
  - Provide Name of the bank
  - Provide Account number
  - Select “Status” check box 
  - Provide “Additional Details”, like “Branch Name”, “Bank code” etc.

    ![Listing Banks](http://vinsol.com/gems_screenshots/spree-bank-transfer/listing%20banks.png)
    
    **Bank Account will be visible on Checkout Page only if it is Active.**
* After adding the payment method and bank details (as stated above), this payment method will be visible on Checkout page while making payment against an order.

*  Active merchant **accounts number** will also be visible on Checkout page under this method.

       ![Checkout](https://s3.amazonaws.com/gems-and-extensions-screenshots/Bank+Transfer/Checkout.png)

**“How Bank  Transfer Works” link will open a pop-up window. It will list all steps to complete order with this method.**

* Customer will be able to order by completing the order with this method and can transfer money equal to total order   
  value directly into any one of the merchant’s bank account.

* After customer deposits money into merchant’s account, a payment transaction reference number is provided by the bank.   Customer needs to add this payment reference details with the respective order by going to order detail page.

     My Account -> Order no. -> Add details (Payment information column) -> Submit
     
     ![Payment Info](https://s3.amazonaws.com/gems-and-extensions-screenshots/Bank+Transfer/checkout-1.png)

* Admin will be able to see the payment reference details, added by customer, on the Order detail page.

       Orders -> Order no. ->  Payments
       
       ![Payments](https://s3.amazonaws.com/gems-and-extensions-screenshots/Bank+Transfer/admin-payment.png)

* The order will not be marked Completed  until admin captures the payment as mentioned in step above.

      Note: Admin needs to manually verify the transaction details from his bank account before capturing the payment

* Admin can filter orders which has payment transaction reference number by clicking the check box “only show orders with   bank transfer payment reference number” on “Orders” page.

      ![Orders](https://s3.amazonaws.com/gems-and-extensions-screenshots/Bank+Transfer/order-filter.png)





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
