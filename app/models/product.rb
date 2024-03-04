# frozen_string_literal: true

class Product < ApplicationRecord
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  mount_uploader :logo, ProductUploader

  has_many :product_images, dependent: :destroy
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :wishlists, dependent: :destroy
  has_many :line_items, dependent: :destroy
  belongs_to :brand, optional: true

  accepts_nested_attributes_for :product_images, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :product_categories, allow_destroy: true, reject_if: :all_blank

  validates :code, :price, :name, :description, :status, :for_gender, :for_age, :production_country, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 100 }
  validates :code, numericality: { only_integer: true, greater_than_or_equal_to: 1000 }

  default_scope -> { where(deleted_at: nil).order(id: :desc) }
  scope :visible, -> { where(visible: true) }

  enum status: { available: 1, not_available: 2, ends: 3, on_the_way: 4 }
  enum production_country: { china: 1, ukraine: 2, japan: 3, germany: 4, usa: 5, taiwan: 6, turkey: 7 }
  enum for_gender: { boy: 1, girl: 2, boy_girl: 3 }

  AGE = (0..14).to_a.freeze

  serialize :specifications, coder: JSON
  serialize :description, coder: JSON
  serialize :name, coder: JSON

  def slug_candidates
    I18n.locale = :ru
    increment_value = id || Product.auto_increment_value
    translated_name = name['ua']
    [
      translated_name,
      [increment_value, translated_name]
    ]
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
