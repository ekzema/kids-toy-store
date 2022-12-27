# frozen_string_literal: true

class Api::V1::Admin::BrandsController < AdminController
  def index
    brands = Brand.all
    brands = brands.search(params[:q]) if params[:q]

    render_response(brands)
  end
end
