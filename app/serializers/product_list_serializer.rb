# frozen_string_literal: true

class ProductListSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :code, :discount, :discount_price, :logo, :slug
end
