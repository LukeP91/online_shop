require "rails_helper"

describe "Customer actions", :type => :feature do

  before :each do
    Product.create(code: "AP1", name: "Apple", price: 5)
  end

  scenario "customer can add product to cart" do
    visit "/"
    click_link "Add"
    within_table("cart_items_table") do
      expect(page).to have_css("th", text: "Apple")
      expect(page).to have_css("th", text: 1)
    end
  end

  scenario "Customer can remove item from cart" do
    visit "/"
    click_link "Add"
    within_table("cart_items_table") do
      click_link "remove_item"
    end
    expect(page).to have_css("p", text: "There are no items in your cart.")
  end
end