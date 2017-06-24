class AddItem
  class AddItemError < StandardError; end

  def execute(cart, product_id)
    new_item = add_product_to_cart(cart, product_id)
    raise AddItemError.new unless new_item.save
  end

  private

  def add_product_to_cart(cart, product_id)
    current_item = cart.cart_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = cart.cart_items.build(product_id: product_id, quantity: 1)
    end
    current_item
  end
end
