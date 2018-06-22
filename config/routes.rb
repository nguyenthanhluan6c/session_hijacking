Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "auth/sessions"}

  get "/", to: "front#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
