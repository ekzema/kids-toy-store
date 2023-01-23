# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category do
  let(:category) { create(:category) }

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
  end
end
