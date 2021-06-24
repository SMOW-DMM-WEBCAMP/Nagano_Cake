class CartItem < ApplicationRecord

belongs_to :member
belongs_to :product

 def total_price
     product.price * quantity
 end

end
