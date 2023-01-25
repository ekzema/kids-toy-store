# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product do
  describe 'associations' do
    it { should have_many(:product_images).dependent(:destroy) }
  end

  describe 'validations' do
    %i[name code description].each do |field|
      it { should validate_presence_of(field) }
    end

    it { should validate_numericality_of(:code).only_integer.is_greater_than_or_equal_to(1000) }
    it { should validate_numericality_of(:price).only_integer.is_greater_than_or_equal_to(100) }
  end

  describe 'enums' do
    %i[status production_country for_gender].each do |field|
      it { should define_enum_for(field) }
    end
  end

  describe 'soft delete' do
    let(:product) { create(:product) }

    before { product.soft_delete! }

    it { expect(product.deleted_at).to be_an_instance_of(ActiveSupport::TimeWithZone) }
  end
end
