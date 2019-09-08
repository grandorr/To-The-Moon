Rails.application.routes.draw do

  root to: 'home#index'


  resources :home

  resources :wallet
  resources :crypto
end
