class Category < ApplicationRecord
  belongs_to :parent, :class_name => "Category", optional: true
  validates :name, presence: true
  after_destroy :clean_dependence_child

  private

  def clean_dependence_child
    Category.where(parent_id: id).update_all(parent_id: nil)
  end
end
