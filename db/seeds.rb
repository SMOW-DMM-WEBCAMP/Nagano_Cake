# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Member.create(name_sei: '田中', name_mei: '太郎', name_kana_sei: 'タナカ', name_kana_mei: 'タロウ', postal_code: '1111111', address: '東京都新宿区1-1', tel: '11111111111', email: 'tanaka@test.com', password: '000000')
Member.create(name_sei: '山田', name_mei: '次郎', name_kana_sei: 'ヤマダ', name_kana_mei: 'ジロウ', postal_code: '2222222', address: '東京都新宿区2-2', tel: '22222222222', email: 'yamada@test.com', password: '000000')

#Admin.create!(
  #email: 'admin@admin.com',
  #password: '000000',
#)

# ShippingAddress.create(member_id: '1', address_name: '鈴木花子', postal_code: '3333333', address: '埼玉県さいたま市3-3')
# ShippingAddress.create(member_id: '1', address_name: '渡邊弘毅', postal_code: '4444444', address: '埼玉県さいたま市4-4')


Member.all.each do |member|
  rand(0..3).times do |n|
    ShippingAddress.create!(
      member_id: member.id,
      address_name: "#{member.name_sei}#{member.name_mei}#{n}",
      address: "#{member.address}-#{n}",
      postal_code: "0000#{member.id}#{n}"
    )
  end
end

# Genre.create(genre_name: 'ケーキ')
# Genre.create(genre_name: 'クッキー')
# Genre.create(genre_name: 'パン')

5.times do |n|
  Genre.create!(
    genre_name: "テストジャンル#{n}"
  )
end

# Product.create(genre_id: '1', address_name: '鈴木花子', postal_code: '3333333', address: '埼玉県さいたま市3-3')

Genre.all.each do |genre|
  rand(0..5).times do |n|
    Product.create!(
      genre_id: genre.id,
      product_name: "テスト商品#{genre.id}-#{n}",
      description: "テスト商品#{genre.id}-#{n}の説明",
      price: 100*rand(1..20),
      product_image: File.open("#{Rails.root}/app/assets/images/Product_image_sample.jpg")
    )
  end
end


CartItem.create(member_id: '1', product_id: '1', quantity: 2)
CartItem.create(member_id: '1', product_id: '2', quantity: 1)
CartItem.create(member_id: '1', product_id: '3', quantity: 3)
CartItem.create(member_id: '1', product_id: '4', quantity: 1)
CartItem.create(member_id: '1', product_id: '5', quantity: 5)

CartItem.create(member_id: '2', product_id: '5', quantity: 2)
CartItem.create(member_id: '2', product_id: '4', quantity: 2)
CartItem.create(member_id: '2', product_id: '3', quantity: 3)
CartItem.create(member_id: '2', product_id: '2', quantity: 3)
CartItem.create(member_id: '2', product_id: '1', quantity: 5)


# 3.times do |n|
#   CartItem.create!(
#     member_id: 1,
#     product_id: 1,
#     quantity: n + 1,
#   )
# end





