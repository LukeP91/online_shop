class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true }
end