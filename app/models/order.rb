class Order < ApplicationRecord

  belongs_to :member
  has_many :orederd_products

  enum payment_method: [クレジットカード: 0, 銀行振込: 1]
  enum address: [ご自身の住所: 0, 登録済住所から選択: 1, 新しいお届け先: 2]

  def select_address
    "〒" + postal_code + " " + address + " " + address_name
  end
end
