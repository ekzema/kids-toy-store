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
    limit    = 5
    products = Product.all
    products = products.search(params[:q]) if params[:q]
    prepare_extension = { show: limit, found: products.count }

    render_response(products.limit(limit), ProductsAutocompleteSerializer, expand: prepare_extension)
  end
end
