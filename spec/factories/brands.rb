# frozen_string_literal: true

FactoryBot.define do
  factory :brand do
    name { Faker::Commerce.brand }
  end
end
