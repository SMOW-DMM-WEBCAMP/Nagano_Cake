class Order < ApplicationRecord

  belongs_to :member
  has_many :ordered_products

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :address_name, presence: true

  enum payment_method: {クレジットカード:0, 銀行振込:1}
  enum order_status: {入金待ち:0, 入金確認:1, 制作中:2, 発送準備中:3, 発送済み:4}

  def total_price(member)
    total = 0
    member.cart_items.each do |cart_item|
      total += (cart_item.product.price * 1.1).floor * cart_item.quantity
    end
    return total
  end
end
