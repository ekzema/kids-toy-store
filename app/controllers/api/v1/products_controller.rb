# frozen_string_literal: true

class Api::V1::ProductsController < ApiController
  def index
    products = Product.all
    render_paginate(products, ProductListSerializer)
  end

  def show
    product = Product.friendly.find(params[:id])
    render_response(product)
  end
end
