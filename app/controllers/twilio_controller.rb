class TwilioController < ApplicationController

  def message
    current_user = User.where(phone_number: params[:From])
    HTTParty.post "https://slack.com/api/chat.postMessage",
    header: {
      "Authorization" => "token #{current_user.first.token}",
      "user-agent" => "something here"
    },
    query: {
      "token" => "#{current_user.first.token}",
      "channel" => '#general',
      "text" => params["Body"],
      "as_user" => true
      }
  end
end
