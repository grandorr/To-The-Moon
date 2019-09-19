Rails.application.routes.draw do

  resources :favorites, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  root to: 'home#index'

  devise_for :users

  resources :user_cryptos
  resources :crypto_currencies, only: [:show]
  resources :cryptolist, only: [:show]

  resources :friend_requests, only: [:create]
  resources :friendships, only: [:create, :destroy]
  resources :profiles, only: [:index, :show]
  resources :messages, only: [:new, :create]
  resources :conversations, only: [:show]
  resources :home, only: [:index]

  resources :news, only: [:index]
  resources :articles do
    resources :pictures, only: [:create]
  end
  resources :comments, only: [:create, :edit, :update, :destroy]

  resources :admin, only: [:index, :show]


  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/terms_and_conditions'
  get 'static_pages/privacy_policy'

end
