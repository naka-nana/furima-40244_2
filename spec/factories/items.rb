FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    item_info { Faker::Lorem.sentence }
    region_id { Faker::Number.between(from: 2, to: Region.data.size) }
    category_id { Faker::Number.between(from: 2, to: Category.data.size) }
    condition_id { Faker::Number.between(from: 2, to: Condition.data.size) }
    shipping_id { Faker::Number.between(from: 2, to: Shipping.data.size) }
    shipping_day_id { Faker::Number.between(from: 2, to: ShippingDay.data.size) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
