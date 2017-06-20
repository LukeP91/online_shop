class Order < ActiveRecord::Base
  has_many :order_items

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :street, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
  validates :apartment_number, numericality: { only_integer: true }

  def add_items_to_order(cart)
    cart.cart_items.each do |item|
      order_items.create(code: item.product.code,
                         name: item.product.name,
                         price: item.cost,
                         quantity: item.quantity
                        )
    end
  end

  def total
    total = order_items.map{ |item| item.price }.reduce(0, :+)
  end
end