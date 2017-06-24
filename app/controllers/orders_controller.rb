class OrdersController < ApplicationController
  def new
    @order = Order.new
    @cart = user_cart
  end

  def create
    cart = user_cart
    @order = Order.new(order_params)

    if @order.save
      session[:cart_id] = nil
      @order.add_items_to_order(cart)
      Cart.destroy(cart.id)
      OrderMailer.order_summary_email(@order).deliver_now
      redirect_to root_path
    else
      render 'new', notice: "Something went wrong"
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email,
                                  :street, :city, :country, :zip_code,
                                  :house_number, :apartment_number)
  end
end
