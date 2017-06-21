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

  scenario "Customer can make an order" do
    visit "/"
    click_link "Add"
    click_link "checkout_button"
    within("#new_order") do
      fill_in 'order_first_name', with: 'Test'
      fill_in 'order_last_name', with: 'User'
      fill_in 'order_email', with: 'user@test.com'
      fill_in 'order_street', with: 'Street'
      fill_in 'order_city', with: 'City'
      fill_in 'order_country', with: 'Country'
      fill_in 'order_zip_code', with: '00-000'
      fill_in 'order_house_number', with: '1'
      fill_in 'order_apartment_number', with: '1'
      click_button 'Checkout'
    end  
    expect(page).to have_css("p", text: "There are no items in your cart.")
    expect(Order.count).to eq 1
    expect(Order.first).to have_attributes(first_name: "Test", 
                                           last_name: "User",
                                           email: "user@test.com",
                                           street: "Street",
                                           city: "City", 
                                           country: "Country",
                                           zip_code: "00-000",
                                           house_number: "1",
                                           apartment_number: 1)
  end 
end