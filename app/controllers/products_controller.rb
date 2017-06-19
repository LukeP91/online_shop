class ProductsController < ApplicationController
  def index
    @cart = user_cart
    @products = Product.all
  end
end