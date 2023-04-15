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

  def autocomplete
    products = Product.all
    products = products.search(params[:q]) if params[:q]

    render_response(products.limit(5), ProductsAutocompleteSerializer)
  end
end
