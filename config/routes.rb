Rails.application.routes.draw do
  devise_for :admins
  root 'products#index'

  post '/carts/add', to: 'carts#add_item'
  post '/carts/remove', to: 'carts#remove_item'
  resources :orders, only: [:new, :create]
end
