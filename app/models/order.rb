class Order < ApplicationRecord

  belongs_to :member
  has_many :orederd_products

  enum payment_method: {クレジットカード:0, 銀行振込:1}
end
