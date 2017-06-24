class Discount
  def self.buy_one_get_one_for_free(price:, quantity:)
    return (price * quantity) / 2 if quantity.even?
    (price * (quantity - 1)) / 2 + price
  end

  def self.bulk_purchase(original_price:, discounted_price:, quantity:, bulk_requirement:)
    return original_price * quantity if quantity < bulk_requirement
    discounted_price * quantity
  end
end
