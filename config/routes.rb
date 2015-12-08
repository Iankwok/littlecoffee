Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root 'static_pages#index'

  # namespace :api do
  #   resources :users, only:[:index, :show, :create], defaults: {:format => 'json'}
  # end

  # resources :users

end
