class Api::V1::Admin::ProductsController < AdminController
  before_action :set_product, only: [:destroy, :show, :update]

  def index
    render_response(products)
  end

  def show
    render_response(@product)
  end

  def create
    product = Product.new(product_params)

    if product.save
      render_response(status: :created)
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render_response(@product)
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.soft_delete!
  end

  private

  def products
    products = Product.where(deleted_at: nil)
    products = products.search(params[:q]) if params[:q]

    products
  end

  def set_product
    @product = products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :status,
      :price,
      :new,
      :visible,
      :code,
      :discount,
      :discount_price,
      specifications: [:title, :value]
    )
  end
end
