# frozen_string_literal: true

class V1::Products::IndexService < ApplicationService
  FILTERS = %i[price categories].freeze

  def call
    products = Product.includes(:wishlists)
    products = products.search(params[:q]) if params[:q]
    FILTERS.each { |filter| products = send("filter_by_#{filter}", products) if params[filter] }

    products
  end

  private

  def filter_by_categories(products)
    category_ids = params[:categories].split(',').map { |category| sanitize_sql(category).inspect }.join(',')
    products.joins('INNER JOIN product_categories AS pc ON pc.product_id = products.id')
           .joins('INNER JOIN categories AS cat1 ON cat1.id = pc.category_id')
           .joins("INNER JOIN (SELECT * FROM categories WHERE slug IN (#{category_ids})) cat2 ON cat1.id = cat2.id
                   OR cat1.parent_id = cat2.id")
           .distinct
  end

  def filter_by_price(products)
    min_price, max_price = params[:price].split('-').map(&:to_i)
    products.where(price: min_price..max_price)
  end

  def sanitize_sql(input)
    ActiveRecord::Base.sanitize_sql(input)
  end
end
