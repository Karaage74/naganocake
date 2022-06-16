class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping_cost
      t.integer :payment_method, null: false, default: 0
      t.integer :total_payment
      t.string :name
      t.string :address
      t.string :post_code
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
  end
end
