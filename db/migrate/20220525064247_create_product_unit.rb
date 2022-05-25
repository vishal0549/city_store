class CreateProductUnit < ActiveRecord::Migration[7.0]
  def change
    create_table :product_units do |t|
      t.text :name, null: false
      t.text :nice_name, null: false
      t.timestamps
    end
  end
end
