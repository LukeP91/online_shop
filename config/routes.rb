Rails.application.routes.draw do
  root 'products#index'

  post '/carts/add', to: 'carts#add_item'
end
