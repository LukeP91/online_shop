class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :code, null: false, limit: 3, unique: true, index: true
      t.string :name, null: false
      t.decimal :price, null: false, default: 0

      t.timestamps
    end
  end
end
