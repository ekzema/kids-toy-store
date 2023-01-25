# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductImage do
  describe 'associations' do
    it { should belong_to(:product) }
  end
end
