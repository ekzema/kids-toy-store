require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'associations' do
    it { should belong_to(:user).optional }
    it { should have_many(:line_items).dependent(:destroy) }
    it { should have_one(:order).dependent(:destroy) }
  end
end
