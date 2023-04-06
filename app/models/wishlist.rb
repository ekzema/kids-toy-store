# frozen_string_literal: true

class Wishlist < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :product
end
