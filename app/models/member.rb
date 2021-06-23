class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :orders
  has_many :shipping_addresses

  validates :name_sei, :name_mei, :name_kana_sei, :name_kana_mei, :postal_code, :address, :tel, presence: true
  validates :name_kana_sei, :name_kana_mei, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "カタカナで入力して下さい。" }

  VALID_TEL_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
  validates :tel, numericality: { only_integer: true }, format: { with: VALID_TEL_REGEX }

  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }, format: { with: VALID_POSTAL_CODE_REGEX }

  # 退会機能
  def active_for_authentication?
    super && (self.is_valid == false)
  end

end
