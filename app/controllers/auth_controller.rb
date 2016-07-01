class AuthController < ApplicationController::Base
  require 'rubygems'
  require 'twilio-ruby'

  def index
  end

  def postmessage
    account_sid = ''
    auth_token = ''
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
      :from => '+',
      :to => '+',
      :body => 'this is a test!'
      })
    end

    def getmessage
      account_sid = ''
      auth_token = ''
      @client = Twilio::REST::Client.new account_sid, auth_token
      @message = @client.account.messages.get("")
      puts @message.body
    end

    def post_message_to_slack
      @message = @client.account.messages.get("")
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
