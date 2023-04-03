# frozen_string_literal: true

class Api::V1::ProductsController < ApiController
  def index
    result = ::V1::Products::IndexService.perform(params)
    render_paginate(result, ProductListSerializer)
  end

  def show
    product = Product.friendly.find(params[:id])
    render_response(product)
  end
end
