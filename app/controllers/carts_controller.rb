class CartsController < ApplicationController

  def add_item
    begin
      AddItem.new.execute(user_cart, params[:product_id])
      flash[:notice] = 'Product added to cart'
      redirect_to root_path
    rescue AddItem::AddItemError
      flash[:alert] = 'There was some error. Please try again'
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
