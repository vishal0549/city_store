class CreateCustomerRequest < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_requests do |t|
      t.text :email, null: false
      t.text :subject, null: false
      t.text :message, null: false
      t.timestamps
    end
  end
end
