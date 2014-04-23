require 'pusher'

class TwilioController < ApplicationController
  layout nil

  def initialize
	  Pusher.app_id = '28844'
	  Pusher.key = '60d86fcaa4f43f6b74ab'
	  Pusher.secret = '907bf2660af1d0922ec6'
    super
  end

  def index
  end

  def sms
    Pusher.trigger('test_channel', 'my_event', {:message => params[:Body]})
    render text: '<Response><Message>I am a text message. You can learn to send me. Just "gem install twilio-ruby". twilio.com/docs for more info!</Message></Response>', content_type: 'text/xml'
  end

end
