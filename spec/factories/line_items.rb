# frozen_string_literal: true

FactoryBot.define do
  factory :line_item do
    cart
    product
  end
end
