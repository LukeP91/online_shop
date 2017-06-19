class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy

  def add_product_to_cart(product_id)
    current_item = cart_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = cart_items.build(product_id: product_id, quantity: 1)
    end
    current_item
  end

  def remove_item_from_cart(cart_item_id)
    current_item = cart_items.find(cart_item_id)
    CartItem.delete(cart_item_id) if current_item.quantity == 1
    current_item.quantity -= 1
    current_item
  end
end