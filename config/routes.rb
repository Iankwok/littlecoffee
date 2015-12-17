Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root 'static_pages#index'

  namespace :api do
    resources :beans, only:[:index], defaults: {:format => 'json'}
    resources :orders, only:[:index, :show, :create, :update, :destroy], defaults: {:format => 'json'}
    resources :myorders, only:[:index], defaults: {:format => 'json'}
  end

  post '/charge', to: "api/charge#create"
end
