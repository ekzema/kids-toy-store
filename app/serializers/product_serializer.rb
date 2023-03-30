# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :description, :price, :code, :discount, :discount_price, :logo, :specifications,
             :slug

  has_many :product_images
  has_many :product_categories
  belongs_to :brand do
    object.brand.attributes.slice('id', 'name')
  end
end
