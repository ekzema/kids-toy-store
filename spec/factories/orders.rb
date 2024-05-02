# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    cart
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    patronymic { Faker::Name.male_first_name }
    email { Faker::Internet.email }
    phone { '+380956036734' }
    pay_type { :privat_bank }
    delivery { :novaya_pochta }
    city { Faker::Address.city }
    department_number { 20 }
  end
end
