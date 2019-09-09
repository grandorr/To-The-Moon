Rails.application.routes.draw do

  resources :friend_requests
  devise_for :users
  root to: 'home#index'


  resources :home

  resources :wallet
  resources :crypto
end
