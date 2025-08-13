FactoryBot.define do
  factory :item do
    name                   { Faker::Commerce.product_name }
    description            { Faker::Lorem.sentence }
    category_id            { rand(2..10) }
    condition_id           { rand(2..6) }
    shipping_fee_charge_id { rand(2..3) }
    state_id               { rand(2..48) }
    shipping_time_id       { rand(2..4) }
    price                  { rand(300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
