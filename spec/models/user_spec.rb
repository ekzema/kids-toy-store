# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it { should have_many(:wishlists).dependent(:destroy) }
    it { should have_many(:wish_products).through(:wishlists).source(:product) }
    it { should have_one(:cart).dependent(:destroy).inverse_of(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should_not allow_value('invalid_email').for(:email) }
    it { should allow_value('valid@example.com').for(:email) }
    it { should validate_length_of(:password_digest).is_at_least(6) }

    it 'validates uniqueness of email' do
      create(:user, email: 'test@example.com')
      new_user = described_class.new(email: 'test@example.com')
      expect(new_user).not_to be_valid
      expect(new_user.errors.key?(:email)).to be(true)
    end
  end
end
