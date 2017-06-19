class CartsController < ApplicationController
  def add_item
    cart = user_cart
    product = Product.find(params[:product_id])
    new_item = cart.add_product_to_cart(product.id)

    if new_item.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def remove_item
    cart = user_cart
    cart_item = cart.remove_item_from_cart(params[:cart_item_id])

    if cart_item.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
