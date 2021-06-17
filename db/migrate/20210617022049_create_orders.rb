class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|

      t.integer :member_id, null: false
      t.integer :shipping, null: false
      t.integer :purchase_price, null: false
      t.integer :payment_method, null: false, default: "0"
      t.string :address_name, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.integer :order_status, null: false, default: "0"
      t.timestamps
    end
  end
end