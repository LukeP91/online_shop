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
end
