FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    code { Faker::Number.number(digits: 4) }
    price { Faker::Number.number(digits: 3) }
  end
end
