# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'example@test.com' }
    password_digest { '123456789' }
    confirmed_at { Time.zone.now }
  end
end
