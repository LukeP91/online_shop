class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy

  def total
    cart_items.map(&:cost).reduce(0, :+)
  end

  def remove_item_from_cart(cart_item_id)
    current_item = cart_items.find(cart_item_id)
    CartItem.delete(cart_item_id) if current_item.quantity == 1
    current_item.quantity -= 1
    current_item
  end
end