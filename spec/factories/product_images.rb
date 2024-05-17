# frozen_string_literal: true

FactoryBot.define do
  factory :product_image do
    product
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/RSpec.png'), 'image/png') }
  end
end
