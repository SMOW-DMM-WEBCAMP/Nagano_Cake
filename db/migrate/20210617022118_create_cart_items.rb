class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|

      t.integer :product_id, null: false
      t.integer :member_id, null: false
      t.integer :quantity, null: false
  
      t.timestamps
    end
  end
end
