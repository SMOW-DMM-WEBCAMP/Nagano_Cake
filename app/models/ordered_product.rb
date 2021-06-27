class OrderedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :product_id, presence: true
  validates :order_id, presence: true
  validates :quantity, presence: true
  validates :price, presence: true

  enum production_status: {着手不可:0, 製作待ち:1,  製作中:2, 製作完了:3}
end
