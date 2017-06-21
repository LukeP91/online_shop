require "rails_helper"

describe "Admin order pages", :type => :feature do

  context "Admin is logged in" do
    before :each do
      Admin.create(email: "test@example.com", password: "password")
      Order.create(first_name: "Luke", last_name: "Pawlik", 
                   email: "email@email.com", street: "street", city: "city", 
                   country: "country", zip_code: "code")
    end

    scenario "Admin can see list of all orders" do
      visit "admins/sign_in"
      within("#new_admin") do
        fill_in 'inputEmail', with: 'test@example.com'
        fill_in 'admin_password', with: 'password'
        click_button 'Sign in'
      end      
      click_link 'Orders'
      expect(page).to have_css("h1", text: "List of all orders:")
    end

    scenario "Admin can see details of an order" do
      visit "admins/sign_in"
      within("#new_admin") do
        fill_in 'inputEmail', with: 'test@example.com'
        fill_in 'admin_password', with: 'password'
        click_button 'Sign in'
      end      
      click_link 'Orders'
      click_link 'Show'
      expect(page).to have_css("h1", text: "Order summary")
    end
  end

context "Admin is not logged in" do

    scenario "Not logged in user can't see list of all orders" do
      visit "admin/orders"
      expect(page).to have_content "Please sign in"
    end

    scenario "Not logged in user can't see details of an order" do
      visit "admin/orders/1"
      expect(page).to have_content "Please sign in"
    end
  end
end
