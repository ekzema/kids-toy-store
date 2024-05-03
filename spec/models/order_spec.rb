# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order do
  let(:order) { create(:order) }

  describe 'associations' do
    it { should belong_to(:cart) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:patronymic) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:pay_type) }
    it { should validate_presence_of(:delivery) }
    it { should validate_length_of(:first_name).is_at_least(3) }
    it { should validate_length_of(:last_name).is_at_least(3) }
    it { should validate_length_of(:patronymic).is_at_least(3) }
    it { should_not allow_value('invalid_email').for(:email) }
    it { should allow_value('valid@example.com').for(:email) }

    context 'when delivery method return false' do
      before do
        allow(order).to receive(:delivery_method?).and_return(false)
      end

      it 'validates presence of city' do
        expect(order).not_to validate_presence_of(:city)
      end

      it 'validates presence of department_number' do
        expect(order).not_to validate_presence_of(:department_number)
      end
    end

    context 'when delivery method return true' do
      before do
        allow(order).to receive(:delivery_method?).and_return(true)
      end

      it 'validates presence of city' do
        expect(order).to validate_presence_of(:city)
      end

      it 'validates presence of department_number' do
        expect(order).to validate_presence_of(:department_number)
      end
    end
  end

  describe 'enums' do
    %i[pay_type delivery status].each do |field|
      it { should define_enum_for(field) }
    end
  end
end
