class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.integer :customer_id
      t.string :name
      t.string :address
      t.string :post_code

      t.timestamps
    end
  end
end
