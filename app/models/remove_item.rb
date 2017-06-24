class RemoveItem
  class RemoveItemError < StandardError; end

  def execute(cart, cart_item)
    cart_item = remove_item_from_cart(cart, cart_item)
    raise RemoveItemError.new unless cart_item.save
  end

  def remove_item_from_cart(cart, cart_item_id)
    current_item = cart.cart_items.find(cart_item_id)
    CartItem.delete(cart_item_id) if current_item.quantity == 1
    current_item.quantity -= 1
    current_item
  end
end
