# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category do
  let!(:category) { create(:category) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }

    it 'validate parent before update' do
      new_category = described_class.create(name: Faker::Superhero.name, parent_id: category.id)
      category.update(parent_id: new_category.id)
      expect(category.valid?).to be(false)
      expect(category.errors.messages[:category]).to include('This category is already a parent!')
    end
  end
end
