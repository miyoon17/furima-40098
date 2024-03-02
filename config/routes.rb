Rails.application.routes.draw do
  devise_for :users
  get 'item/index'
  get 'item/new'

  root to: 'items#index'
  resources :items
end
