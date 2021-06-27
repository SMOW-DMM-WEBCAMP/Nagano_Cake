class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy

  validates :name_sei, :name_mei, :name_kana_sei, :name_kana_mei, presence: true
  validates :name_kana_sei, :name_kana_mei, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "カタカナで入力して下さい。" }
  validates :tel, format: {with: /\A[0-9]{3}[0-9]{4}[0-9]{4}\z/, message: 'は半角数字10桁または11桁で入力してください' }
  validates :postal_code, length: {is: 7, message: 'は7桁で入力してください' }, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }

end