Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users
  resources :friend_requests
  resources :home
  resources :user_cryptos
  resources :crypto
  resources :cryptolist 



  resources :articles
  resources :profiles
  resources :news
end
