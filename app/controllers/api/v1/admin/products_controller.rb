# frozen_string_literal: true

class Api::V1::Admin::ProductsController < AdminController
  before_action :set_product, only: %i[destroy show update]
  before_action :set_brand, only: %i[create update]

  def index
    render_paginate(products, Admin::ProductListSerializer)
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
    products = Product.all
    products = Product.where(status: params[:status]) if params[:status]
    products = products.search(params[:q]) if params[:q]

    products
  end

  def set_brand
    return if product_params[:brand_id]
    return unless params[:brand]

    brand = params[:brand].empty? ? nil : Brand.find_or_create_by!(name: params[:brand].downcase)
    params[:product][:brand_id] = brand&.id
  end

  def set_product
    @product = products.find(params[:id])
  end

  # rubocop:disable Metrics/MethodLength
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
      :brand_id,
      :discount,
      :for_gender,
      :description,
      :discount_price,
      :specifications,
      :production_country,
      product_images_attributes: %i[id image _destroy],
      product_categories_attributes: %i[id category_id _destroy]
    ).tap do |product|
      product[:specifications] = JSON.parse(product[:specifications]) if product[:specifications]
      product[:description]    = JSON.parse(product[:description]) if product[:description]
      product[:name]           = JSON.parse(product[:name]) if product[:name]
    end
  end
  # rubocop:enable Metrics/MethodLength
end
