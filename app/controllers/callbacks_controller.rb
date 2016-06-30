class CallbacksController < ApplicationController

  def failure
  end

  def slack
    data = request.env["omniauth.auth"]
    @user = User.where(slack_id: data.uid).first_or_create! do |u|
          u.email       = data.info.email
          u.password    = SecureRandom.hex 64
          u.slack_data  = data.to_h.to_json
          u.slack_id    = data.uid
    end
    sign_in @user
  end

  def update
    current_user.phone_number = params[:user][:phone_number]
    current_user.save
    raise
  end

end
