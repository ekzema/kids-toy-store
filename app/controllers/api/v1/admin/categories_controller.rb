class Api::V1::Admin::CategoriesController < AdminController
  def index
    categories = Category.all
    render_response(categories)
  end

  def create
    category = Category.new(category_params)

    if category.save
      render_response(status: :created)
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  def parents
    categories = Category.where(parent_id: nil)
    render_response(categories, Admin::ParentCategorySerializer)
  end

  private

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
