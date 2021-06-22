# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  Member.create!(
    name_sei: "太郎#{n}",
    name_mei: "てすと",
    name_kana_sei: "タロウ",
    name_kana_mei: "テスト",
    postal_code: "000#{n}",
    address: "テストデータ住所#{n}",
    tel: "0800000#{n}",
    email: "user#{n}@test.com",
    password: "000000"
  )
end

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

5.times do |n|
  Genre.create!(
    genre_name: "テストジャンル#{n}"
  )
end

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
