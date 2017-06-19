class AddOrderInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :first_name, :string, null: false
    add_column :orders, :last_name, :string, null: false
    add_column :orders, :email, :string, null: false, index: true
    add_column :orders, :street, :string, null: false
    add_column :orders, :city, :string, null: false
    add_column :orders, :country, :string, null: false
    add_column :orders, :zip_code, :string, null: false
    add_column :orders, :house_number, :string
    add_column :orders, :apartment_number, :integer
  end
end
