class AddDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :deals do |t|
      t.text :name, null: false
      t.text :description
      t.boolean :deleted, default: false
      t.datetime :deleted_at
      t.boolean :tag_visible, default: false
      t.timestamps null: false
    end
  end
end
