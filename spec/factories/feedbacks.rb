# frozen_string_literal: true

FactoryBot.define do
  factory :feedback do
    name { Faker::Superhero.name }
    email { Faker::Internet.email }
    message { Faker::Lorem.paragraph }
  end
end
