# frozen_string_literal: true

class ProductUploader < ApplicationUploader
  storage :file

  def default_url(*_args)
    "/#{[mounted_as, 'default.png'].compact.join('_')}"
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w[jpg jpeg gif png webp]
  end

  process resize_to_fit: [1300, 1300]

  version :medium do
    process resize_to_fit: [500, 500]
  end

  version :pre_medium do
    process resize_to_fit: [200, 200]
  end

  version :thumb do
    process resize_to_fill: [160, 80]
  end

  version :small do
    process resize_to_fill: [50, 50]
  end
end
