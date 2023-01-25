# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductCategory do
  describe 'associations' do
    it { should belong_to(:product) }
    it { should belong_to(:category) }
  end
end
