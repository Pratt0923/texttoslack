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
      account_sid = 'AC5729bb35494fe8b8c7d35b675d4209c0'
      auth_token = 'b32741da99c36ca100dc9235d1cb2aaa'
      @client = Twilio::REST::Client.new account_sid, auth_token
      @message = @client.account.messages.get("SM2fa324674ab64a02b432a4431705bbf3")
      puts @message.body
    end

    def post_message_to_slack
      @message = @client.account.messages.get("SM2fa324674ab64a02b432a4431705bbf3")
      data = {
        channel: "#general",
        username: "you did it!",
        text: "#{@message.body} I hope this doesn't post to the TIY channel but if it does then oh well sorry guys. :)",
        icon_emoji: ":aardwolf2:"
      }
      HTTParty.post "https://hooks.slack.com/services/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",
      body: {
        payload: data.to_json
      }
    end
  end
