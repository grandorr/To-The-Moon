Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users

  resources :user_cryptos
  resources :crypto
  resources :cryptolist

  resources :friend_requests
  resources :friendships
  resources :profiles
  resources :messages
  resources :home

  resources :news
  resources :articles

end
