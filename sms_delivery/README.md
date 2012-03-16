SpreeOrderConfirmationSms
=========================

Introduction goes here.

SMS delivery 
============

1. include gem in gemfile
   ======================
   
   gem 'sms_delivery'
   
2. Run command
   ===========
   
   bundle install

3.Create yml file in config directory (sms_delivery.yml) in this format
  =====================================================================
  
  environment:
    user: Infobip account User name
    password: Infobip account Password
    sender: sender name
    enabled: true
    
  Example
  =======
    
  development:
    user: InfobipUser_development
    password: InfobipPass
    sender: Staging_konga
    enabled: true

4.Call this function for sms delivery
  ===========================================================================
  
  SmsDelivery.sms_delivery(:sender => sender name, :GSM => phone no, :SMSText => text)
  
Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test app
    $ bundle exec rspec spec

Copyright (c) 2012 [name of extension creator], released under the New BSD License
