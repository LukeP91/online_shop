class Product < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true, length: { is: 3 }
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end