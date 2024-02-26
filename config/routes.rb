Rails.application.routes.draw do
  get 'item/index'
  get 'item/new'

  root to: 'items#index'
  resources :items
end
