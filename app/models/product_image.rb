# frozen_string_literal: true

class ProductImage < ApplicationRecord
  mount_uploader :image, ProductUploader

  belongs_to :product
end
