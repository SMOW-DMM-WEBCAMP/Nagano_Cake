class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy

  validates :name_sei, :name_mei, :name_kana_sei, :name_kana_mei, :postal_code, :address, :tel, presence: true
  validates :name_kana_sei, :name_kana_mei, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "カタカナで入力して下さい。" }

  validates :tel, format: {with: /\A[0-9]{3}[0-9]{4}[0-9]{4}\z/}

  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }, format: { with: VALID_POSTAL_CODE_REGEX }

  # 退会機能
  def active_for_authentication?
    super && (self.taikai_status == false)
  end

end