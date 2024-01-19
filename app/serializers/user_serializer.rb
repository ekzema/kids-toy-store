# frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  attributes :id, :email, :phone, :first_name, :last_name, :patronymic, :wishlists_count, :line_items

  def line_items
    return [] unless object.cart

    line_items = object.cart.line_items.includes(:product).where('products.visible': true)
    ActiveModelSerializers::SerializableResource.new(line_items)
  end
end
