# frozen_string_literal: true

class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :parent, class_name: 'Category', optional: true
  has_many :product_categories, dependent: :restrict_with_exception
  has_many :subcategories, class_name: 'Category', foreign_key: :parent_id, inverse_of: :parent # rubocop:disable Rails/HasManyOrHasOneDependent

  validates :name, presence: true
  validates :name, uniqueness: true
  validate  :parent?, on: :update
  validate  :child?, on: :update
  validate  :child?, on: :create

  after_destroy :clean_dependence_child

  serialize :name, coder: JSON

  def normalize_friendly_id(value)
    return if name.blank?

    I18n.locale = :ru
    value = JSON.parse(value.gsub('=>', ':'))['ua']
    super
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

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
    errors.add(:category, 'The selected category is already a child!') if category.parent_id
  end

  def name_presence?
    errors.add(:category, 'Incorrect name format') if name.blank?
  end
end
