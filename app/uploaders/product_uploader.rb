class ProductUploader < ApplicationUploader
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  process resize_to_fit: [500, 500]

  version :thumb do
    process resize_to_fit: [150, 150]
  end
end
