class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false, index: true
      t.string :code, null: false, index: true
      t.string :name, null: false
      t.integer :quantity, null: false
      t.decimal :price, null: false, precision: 7, scale: 2
    end
  end
end
