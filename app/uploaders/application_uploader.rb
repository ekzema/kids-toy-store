# frozen_string_literal: true

class ApplicationUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file unless Rails.env.production?
end
