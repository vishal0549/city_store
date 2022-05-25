class AddCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.text :name, null: false
      t.references :parent, index: true
      t.timestamps null: false
    end
  end
end
