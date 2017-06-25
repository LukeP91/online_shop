class CreateOrder
  class CreateOrderError < StandardError; end

  def execute(cart, order_params)
    order = Order.new(order_params)
    raise CreateOrderError.new unless order.save
    add_items_to_order(cart, order)
    Cart.destroy(cart.id)
    OrderMailer.order_summary_email(order).deliver_now
  end

  private

  def add_items_to_order(cart, order)
    cart.cart_items.each do |item|
      order.order_items.create(code: item.product.code,
                               name: item.product.name,
                               price: item.cost,
                               quantity: item.quantity)
    end
  end
end
