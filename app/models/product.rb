class Product < ApplicationRecord
  mount_uploader :logo, ProductLogoUploader

  # validates :name, :description, presence: true

  enum status: { available: 1, not_available: 2 }

  serialize :specifications, JSON

  def soft_delete!
    update(deleted_at: Time.now)
  end
end
