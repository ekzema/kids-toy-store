# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Brand do
  describe 'associations' do
    it { should have_many(:products).dependent(:restrict_with_exception) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'downcase name' do
    let(:name) { Faker::Commerce.brand }
    let(:brand) { build(:brand, name: name) }

    before { brand.save }

    it { expect(brand.name).not_to eq(name) }
  end
end
