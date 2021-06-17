class Order < ApplicationRecord

  belongs_to :member
  has_many :orederd_products
end
