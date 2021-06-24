class ShippingAddress < ApplicationRecord
  belongs_to :member

  def select_address
    "〒" + postal_code + " " + address + " " + address_name
  end
end
