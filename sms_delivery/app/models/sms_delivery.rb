class SmsDelivery < ActiveRecord::Base
  require 'net/http'
  require 'uri'
  
  def self.sms_delivery content
    if !INFOBIP_CREDENTIALS || !INFOBIP_CREDENTIALS[Rails.env]
      logger.info 'Credentials are not present'
    elsif !INFOBIP_CREDENTIALS[Rails.env]['enabled']
      logger.info 'SMS delivery is not enabled'
    else
      # get the url that we need to post to
      url = URI.parse('http://api.infobip.com/api/sendsms/plain')
      # build the params string

      post_args1 = { :user => INFOBIP_CREDENTIALS[Rails.env]['user'], :password => INFOBIP_CREDENTIALS[Rails.env]['password'], :sender => content[:sender], :GSM => content[:GSM], :SMSText => content[:SMSText] }
      # send the request
      response = Net::HTTP.post_form(url, post_args1)
      
      if response.try(:body).to_i > 0
        logger.info 'order message has sent'
      else
        logger.info 'Error in processing your request'
      end
    end

  end
end