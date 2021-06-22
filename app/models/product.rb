class Product < ApplicationRecord

  belongs_to :genre
  has_many :cart_items
  has_many :ordered_products
  attachment :product_image

  with_options presence: true do
    validates :genre_id
    validates :product_name
    validates :description
    validates :price
    validates :product_image
  end

  def tax_included_price
    (price * 1.1).floor
  end
end
