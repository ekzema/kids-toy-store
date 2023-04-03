# frozen_string_literal: true

class V1::Products::IndexService < ApplicationService
  def call
    products = Product.all
    products = filter_by_categories if params[:categories]
    products
  end

  private

  def filter_by_categories
    category_ids = params[:categories].split(',').map { |category| sanitize_sql(category).inspect }.join(',')
    Product.joins('INNER JOIN product_categories AS pc ON pc.product_id = products.id')
           .joins('INNER JOIN categories AS cat1 ON cat1.id = pc.category_id')
           .joins("INNER JOIN (SELECT * FROM categories WHERE slug IN (#{category_ids})) cat2 ON cat1.id = cat2.id
                   OR cat1.parent_id = cat2.id")
           .distinct
  end

  def sanitize_sql(input)
    ActiveRecord::Base.sanitize_sql(input)
  end
end
