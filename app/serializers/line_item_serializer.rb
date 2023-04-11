# frozen_string_literal: true

class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :product_id, :product

  def product
    object.product.attributes.slice('id', 'price', 'name', 'description').merge(logo: object.product.logo.small)
  end
end
