class Api::V1::Admin::ProductsController < AdminController
  before_action :set_product, only: [:destroy, :show, :update]

  def index
    render_response(products, Admin::ProductListSerializer)
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

  def detail_constructor
    detail = Products::DetailBuilder.new.perform
    render_response(detail)
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
      :new,
      :logo,
      :name,
      :code,
      :price,
      :status,
      :visible,
      :for_age,
      :discount,
      :for_gender,
      :description,
      :discount_price,
      :specifications,
      product_images_attributes: [:id, :image, :_destroy],
      product_categories_attributes: [:id, :category_id, :_destroy]
    ).tap do |product|
      product[:specifications] = JSON.parse(product[:specifications]) if product[:specifications]
      product[:description] = JSON.parse(product[:description]) if product[:description]
      product[:name] = JSON.parse(product[:name]) if product[:name]
    end
  end
end
