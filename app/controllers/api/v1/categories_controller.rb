class Api::V1::CategoriesController < ApiController
  def index
    categories = Category.all
    render_response(categories)
  end

  def create
    category = Category.new(category_params)

    if category.save
      render_response(category, status: :created)
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
