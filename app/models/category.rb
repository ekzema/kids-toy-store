class Category < ApplicationRecord
  belongs_to :parent, :class_name => "Category", optional: true

  validates :name, presence: true
  validates :name, uniqueness: true
  validate  :is_parent, on: :update

  after_destroy :clean_dependence_child

  private

  def clean_dependence_child
    Category.where(parent_id: id).update_all(parent_id: nil)
  end

  def self.search(query)
    where('LOWER(name) LIKE ?', "%#{query&.downcase}%")
  end

  def is_parent
    categories_count =  Category.where(parent_id: id).count
    errors.add(:category, "This category is already a parent!") unless categories_count.zero?
  end
end
