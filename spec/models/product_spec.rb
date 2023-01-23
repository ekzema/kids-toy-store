# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:description) }
    it { should validate_numericality_of(:code).only_integer.is_greater_than_or_equal_to(1000) }
    it { should validate_numericality_of(:price).only_integer.is_greater_than_or_equal_to(100) }
  end

  describe 'associations' do
    it { should have_many(:product_images).dependent(:destroy) }
  end
end
