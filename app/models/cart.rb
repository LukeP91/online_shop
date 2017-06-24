class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy

  def total
    cart_items.map(&:cost).reduce(0, :+)
  end
end
