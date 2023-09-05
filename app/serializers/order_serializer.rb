# frozen_string_literal: true

class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status

  def products
    object.cart.line_items
  end
end
