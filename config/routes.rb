Rails.application.routes.draw do

  resources :callbacks
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  post 'twilio/message' => 'twilio#message'
  root 'callbacks#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
