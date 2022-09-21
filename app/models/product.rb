class Product < ApplicationRecord
  validates :name, :description, :price, :specifications, presence: true

  enum status: { available: 1, not_available: 2 }

  serialize :specifications, JSON
end
