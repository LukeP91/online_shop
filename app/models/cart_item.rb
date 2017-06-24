class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true }

  def cost
    if product.code == "AP1"
      return Discount.bulk_purchase(original_price: product.price,
                                    discounted_price: 4.5,
                                    quantity: quantity,
                                    bulk_requirement: 3)
    end
    if product.code == "FR1"
      return Discount.buy_one_get_one_for_free(price: product.price,
                                               quantity: quantity)
    end
    product.price * quantity
  end
end
