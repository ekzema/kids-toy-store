# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { { ua: Faker::Superhero.name, ru: Faker::Superhero.name } }
  end
end
