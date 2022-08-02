class Category < ApplicationRecord
  validates :name, :parent_id, presence: true
end
