class AddProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.text :name, null: false
      t.text :description, null: false
      t.integer :retail_price, null: false, default: 0
      t.integer :sale_price, null: false, default: 0
      t.references :category, foreign_key: true, index: true
      t.boolean :stock_available, default: true
      t.integer :quantity, null: false
      t.integer :discount_percent, null: false
      t.references :product_unit, foreign_key: true, index: true
      t.timestamps null: false
      t.references :deal, foreign_key: true, index: true
    end
  end
end
