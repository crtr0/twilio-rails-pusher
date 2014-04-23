require 'pusher'

class TwilioController < ApplicationController
  layout nil

  def initialize
    Pusher.app_id = ENV['PUSHER_APP']
    Pusher.key = ENV['PUSHER_KEY']
    Pusher.secret = ENV['PUSHER_SECRET']
    super
  end

  def index
    @key = ENV['PUSHER_KEY'];
  end

  def sms
    Pusher.trigger('test_channel', 'my_event', {:message => params[:Body]})
    render text: '<Response><Message>I am a text message. You can learn to send me. Just "gem install twilio-ruby". twilio.com/docs for more info!</Message></Response>', content_type: 'text/xml'
  end

end
