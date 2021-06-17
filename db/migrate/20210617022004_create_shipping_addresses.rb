class CreateShippingAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_addresses do |t|

      t.integer :member_id, null: false
      t.string :address_name, null: false
      t.string :address, null: false
      t.string :postal_code, null: false

      t.timestamps
    end
  end
end
