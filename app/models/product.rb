class Product < ApplicationRecord
  mount_uploader :logo, ProductUploader

  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true, reject_if: :all_blank

  validates :name, :description, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 100 }

  enum status: { available: 1, not_available: 2, ends: 3, on_the_way: 4 }

  serialize :specifications, JSON

  def soft_delete!
    update(deleted_at: Time.now)
  end
end
