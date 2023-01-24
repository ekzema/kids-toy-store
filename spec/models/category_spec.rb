# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category do
  let(:category) { create(:category) }

  describe 'associations' do
    it { should have_many(:product_categories).dependent(:restrict_with_exception) }
    it { should belong_to(:parent).class_name('Category').optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }

    context 'with validate parent before update' do
      let(:new_category) { create(:category, parent_id: category.id) }

      before do
        category.update(parent_id: new_category.id)
      end

      it { expect(category.valid?).to be(false) }
      it { expect(category.errors.messages[:category]).to include('This category is already a parent!') }
    end

    context 'with validate child before create' do
      let(:parent_category) { create(:category, parent_id: category.id) }
      let(:new_category) { build(:category, parent_id: parent_category.id) }

      before { new_category.save }

      it { expect(new_category.valid?).to be(false) }
      it { expect(new_category.errors.messages[:category]).to include('The selected category is already a child!') }
    end
  end
end
