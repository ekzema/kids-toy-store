class Product < ApplicationRecord
  mount_uploader :logo, ProductUploader

  has_many :project_images, dependent: :destroy
  accepts_nested_attributes_for :project_images, allow_destroy: true, reject_if: :all_blank

  # validates :name, :description, presence: true

  enum status: { available: 1, not_available: 2 }

  serialize :specifications, JSON

  def soft_delete!
    update(deleted_at: Time.now)
  end
end
