# frozen_string_literal: true

class Api::V1::CategoriesController < ApiController
  def index
    categories = Category.all
    render_response(categories)
  end
end
