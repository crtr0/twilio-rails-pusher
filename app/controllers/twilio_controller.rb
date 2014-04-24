require 'twilio-ruby'
require 'pusher'

class TwilioController < ApplicationController
  
  include Webhookable

  layout nil

  skip_before_action :verify_authenticity_token
  
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
    response = Twilio::TwiML::Response.new do |r|
      r.Message 'I am a text message. You can learn to send me. Just "gem install twilio-ruby". twilio.com/docs for more info!' 
    end
  
    render_twiml response
  end

end
