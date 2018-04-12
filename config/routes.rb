Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :friendships, only: [:create, :update]
      post "friendships/delete", to: "friendships#destroy"
      post "friendships/update", to: "friendships#update"
      resources :places, only: [:index, :create]
      resources :comments, only: [:create, :destroy]
      resources :spots, only: [:index, :create, :update, :destroy]
      resources :notifications, only: [:index, :update]
      resources :images, only: [:create]
    end
  end

  post "/login", to: "auth#login"
  get "/current_user", to: "auth#show"
  get "/api_keys", to: "auth#api_key"

end
