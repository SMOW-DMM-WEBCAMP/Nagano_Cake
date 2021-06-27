class CartItem < ApplicationRecord

belongs_to :member
belongs_to :product

 def total_price
     product.price * quantity
 end

 with_options presence: true do
   validates :product_id
   validates :member_id
   validates :quantity
  end
end
