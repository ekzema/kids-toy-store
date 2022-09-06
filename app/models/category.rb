class Category < ApplicationRecord
  belongs_to :parent, :class_name => "Category", optional: true

  validates :name, presence: true
end
