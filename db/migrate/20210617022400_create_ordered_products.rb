class CreateOrderedProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :ordered_products do |t|

      t.timestamps
    end
  end
end
