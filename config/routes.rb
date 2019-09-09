Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  resources :home

  resources :wallet
  resources :crypto
end
