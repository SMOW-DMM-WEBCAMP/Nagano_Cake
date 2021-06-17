class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :genre_id,          null: false
      t.string :product_name,       null: false
      t.text :description,          null: false
      t.integer :price,             null: false
      t.boolean :sale_status,       null: false, default: "false"
      t.string :product_image_id,   null: false


      t.timestamps
    end
  end
end
