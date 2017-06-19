Rails.application.routes.draw do
  root 'products#index'

  post '/carts/add', to: 'carts#add_item'
  post '/carts/remove', to: 'carts#remove_item'
end
