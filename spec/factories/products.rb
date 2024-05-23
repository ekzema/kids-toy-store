# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { { ua: Faker::Commerce.product_name, ru: Faker::Commerce.product_name } }
    description { { ua: Faker::Lorem.paragraph, ru: Faker::Lorem.paragraph } }
    code { Faker::Number.number(digits: 4) }
    price { Faker::Number.number(digits: 3) }
    status { 1 }
    for_gender { 1 }
    for_age { 3 }
    production_country { 3 }
  end
end
