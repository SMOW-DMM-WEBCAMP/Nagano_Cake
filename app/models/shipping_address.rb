class ShippingAddress < ApplicationRecord
  belongs_to :member

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :address_name, presence: true

  def select_address
    "〒" + postal_code + " " + address + " " + address_name
  end
end
