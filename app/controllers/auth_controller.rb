class AuthController < ApplicationController::Base
  require 'rubygems'
  require 'twilio-ruby'

  def index
  end

  def postmessage
    account_sid = 'AC5729bb35494fe8b8c7d35b675d4209c0'
    auth_token = 'b32741da99c36ca100dc9235d1cb2aaa'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
      :from => '+19195903795',
      :to => '+19195903795',
      :body => 'Hey Jenny! Good luck on the bar exam!'
    })
  end

  def getmessage
    @client = Twilio::REST::Client.new account_sid, auth_token


    @message = @client.account.messages.get("")
    puts @message.body
  end
end
