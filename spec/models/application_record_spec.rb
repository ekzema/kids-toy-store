# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationRecord do
  describe 'search' do
    before do
      %w[books constructors puzzles].each do |name|
        create(:category, name: name)
      end
    end

    it { expect(Category.search('books').first.name).to eq('books') }
  end
end
