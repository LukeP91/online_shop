require "rails_helper"

RSpec.describe Cart, :type => :model do
  describe "#total" do
    before :each do 
      @cart = Cart.create
      @tea = Product.create(code: "FR1", name: "Fruit tea", price: 3.11)
      @apple = Product.create(code: "AP1", name: "Apple", price: 5)
      @coffee = Product.create(code: "CF1", name: "Coffee", price: 11.23)
    end
    
    context "user has Apple, 2 Fruit teas and Coffee" do
      it "should return correct sum for it" do
        CartItem.create(cart_id: @cart.id, product_id: @tea.id, quantity: 2)
        CartItem.create(cart_id: @cart.id, product_id: @apple.id, quantity: 1)
        CartItem.create(cart_id: @cart.id, product_id: @coffee.id, quantity: 1)
        expect(@cart.total).to eq 19.34
      end
    end
        context "user has 2 fruit teas" do
      it "should return correct sum for it" do
        CartItem.create(cart_id: @cart.id, product_id: @tea.id, quantity: 2)
        expect(@cart.total).to eq 3.11
      end
    end
        context "user has 3 Apples and fruit tea" do
      it "should return correct sum for it" do
        CartItem.create(cart_id: @cart.id, product_id: @tea.id, quantity: 1)
        CartItem.create(cart_id: @cart.id, product_id: @apple.id, quantity: 3)
        expect(@cart.total).to eq 16.61
      end
    end
  end
end