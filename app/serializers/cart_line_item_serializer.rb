# frozen_string_literal: true

class CartLineItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :product

  def product
    ActiveModelSerializers::SerializableResource.new(object.product, serializer: ProductListSerializer)
  end
end
