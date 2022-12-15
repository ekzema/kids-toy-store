class Api::V1::Admin::CategoriesController < AdminController
  before_action :set_category, only: [:destroy, :show, :update]

  def index
    categories = Category.includes(:parent).all
    categories = categories.search(params[:q]) if params[:q]

    render_response(categories)
  end

  def show
    render_response(@category)
  end

  def create
    category = Category.new(category_params)

    if category.save
      render_response(status: :created)
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      render_response(@category)
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def parents
    categories = Category.where(parent_id: nil)
    categories = categories.where.not(id: params[:id]) if params[:id]

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
    params.require(:category).permit(:parent_id, name: {})
  end
end
