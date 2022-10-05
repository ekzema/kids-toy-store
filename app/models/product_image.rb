class ProductImage < ApplicationRecord
  mount_uploader :image, ProductUploader

  belongs_to :product
end
