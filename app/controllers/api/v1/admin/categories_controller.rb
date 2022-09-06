class Api::V1::Admin::CategoriesController < AdminController
  before_action :set_category, only: [:destroy]
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

  def destroy
    @category.destroy
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
