# frozen_string_literal: true

class Api::V1::CategoriesController < ApiController
  def index
    categories = Category.where(parent_id: nil)
    render_response(categories)
  end
end
