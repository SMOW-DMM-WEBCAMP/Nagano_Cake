class CartItem < ApplicationRecord
  belongs_to :member
  belongs_to :product

  def subtotal
    product.tax_included_price * quantity
  end
end
