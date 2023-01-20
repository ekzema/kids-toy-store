# frozen_string_literal: true

class Product < ApplicationRecord
  mount_uploader :logo, ProductUploader

  has_many :product_images, dependent: :destroy
  has_many :product_categories, dependent: :restrict_with_exception
  has_many :categories, through: :product_categories, dependent: :destroy
  belongs_to :brand, optional: true

  accepts_nested_attributes_for :product_images, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :product_categories, allow_destroy: true, reject_if: :all_blank

  validates :code, :name, :description, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 100 }
  validates :code, numericality: { only_integer: true, greater_than_or_equal_to: 1000 }

  enum status: { available: 1, not_available: 2, ends: 3, on_the_way: 4 }
  enum production_country: { china: 1, ukraine: 2, japan: 3, germany: 4, usa: 5, taiwan: 6, turkey: 7 }
  enum for_gender: { boy: 1, girl: 2, boy_girl: 3 }

  AGE = (0..7).to_a.freeze

  serialize :specifications, JSON
  serialize :description, JSON
  serialize :name, JSON

  def soft_delete!
    update(deleted_at: Time.zone.now)
  end
end
