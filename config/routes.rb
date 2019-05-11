Rails.application.routes.draw do
  devise_for :users

  resources :blogs, only: :show, param: :url

  namespace :users do
    resources :blogs, except: %(index show)
  end

  resources :stories

  resources :stories do
    resources :likes
  end

  # resource :favourites
  get '/favourites', to: 'favourites#index'

  resources :stories do
    resources :favourites
  end

  authenticated :user do
    root to: "user_dashboard#show"
  end

  root to: "guest_dashboard#show"
end
