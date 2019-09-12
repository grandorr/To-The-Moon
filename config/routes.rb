Rails.application.routes.draw do

  resources :favorites
  resources :likes
  root to: 'home#index'

  devise_for :users

  resources :user_cryptos
  resources :crypto
  resources :cryptolist

  resources :friend_requests
  resources :friendships
  resources :profiles
  resources :messages
  resources :conversations
  resources :home

  resources :news
  resources :articles do
    resources :pictures, only: [:create]
  end
  resources :comments

  resources :admin


  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/terms_and_conditions'
  get 'static_pages/privacy_policy'

end
