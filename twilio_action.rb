require 'rubygems' # not necessary with ruby 1.9 but included for completeness 
require 'twilio-ruby' 

class TwilioAction

    def call(tel)

        tel.delete!('-')
        tel.slice!(0) if (tel.length == 11 || tel.length == 10) && tel[0] == "0"

        account_sid = ENV['SID'] 
        auth_token = ENV['TOKEN']
         
        # set up a client to talk to the Twilio REST API 
        @client = Twilio::REST::Client.new account_sid, auth_token 
        @call = @client.account.calls.create({
            :to => "+81#{tel}", 
            :from => ENV['FROM'],
            :url => ENV['RESPONSE_XML_URL'],
            :method => 'GET',  
            :fallback_method => 'GET',  
            :status_callback_method => 'GET', 
            :status_callback => ENV['CALLBACK_URL']   
            :record => 'false'
        })
    end

end
