# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feedback do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should_not allow_value('invalid_email').for(:email) }
    it { should allow_value('valid@example.com').for(:email) }
  end
end
