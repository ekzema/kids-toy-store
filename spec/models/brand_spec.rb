require 'rails_helper'

RSpec.describe Brand do
  it { should validate_presence_of(:name) }
end
