# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :product_categories, dependent: :restrict_with_exception

  validates :name, presence: true
  validates :name, uniqueness: true
  validate  :parent?, on: :update
  validate  :child?, on: :update
  validate  :child?, on: :create

  after_destroy :clean_dependence_child

  serialize :name, JSON

  private

  def clean_dependence_child
    Category.where(parent_id: id).update_all(parent_id: nil) # rubocop:disable Rails/SkipsModelValidations
  end

  def parent?
    return unless parent_id

    categories_count = Category.where(parent_id: id).count
    errors.add(:category, 'This category is already a parent!') unless categories_count.zero?
  end

  def child?
    return unless parent_id

    category = Category.find(parent_id)
    errors.add(:category, "The #{category.name} category is already a child!") if category.parent_id
  end
end
