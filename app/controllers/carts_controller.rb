class CartsController < ApplicationController
  def add_item
    begin
      AddItem.new.execute(user_cart, params[:product_id])
      redirect_to root_path
    rescue AddItem::AddItemError
      flash[:alert] = 'There was some error. Please try again'
      redirect_to root_path
    end
  end

  def remove_item
    begin
      RemoveItem.new.execute(user_cart, params[:cart_item_id])
      redirect_to root_path
    rescue RemoveItem::RemoveItemError
      flash[:alert] = 'There was some error. Please try again'
      redirect_to root_path
    end
  end
end
