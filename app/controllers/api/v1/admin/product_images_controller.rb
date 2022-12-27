# frozen_string_literal: true

class Api::V1::Admin::ProductImagesController < AdminController
  before_action :set_product_image, only: [:destroy]

  def destroy
    @product_image.destroy
  end

  private

  def set_product_image
    @product_image = ProductImage.find(params[:id])
  end
end
