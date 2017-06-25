class OrdersController < ApplicationController
  def new
    @order = Order.new
    @cart = user_cart
  end

  def create
    begin
      CreateOrder.new.execute(user_cart, order_params)
      session[:cart_id] = nil
      redirect_to root_path
    rescue CreateOrder::CreateOrderError
      flash[:alert] = 'There was some error. Please try again'
      redirect_to root_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email,
                                  :street, :city, :country, :zip_code,
                                  :house_number, :apartment_number)
  end
end
