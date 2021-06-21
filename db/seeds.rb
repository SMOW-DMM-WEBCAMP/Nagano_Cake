# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Member.create!(
  id: 1,
  name_sei: 山田,
  name_mei: 孝之,
  name_kana_sei: やまだ,
  name_kana_mei: たかゆき,
  postal_code: "0000000",
  address: "東京都渋谷区代々木神園町0-0",
  tel: "00000000000",
  email: 'test@test.com',
  password: "takayuki"
)