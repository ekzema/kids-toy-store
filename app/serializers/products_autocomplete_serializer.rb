# frozen_string_literal: true

class ProductsAutocompleteSerializer < ActiveModel::Serializer
  attributes :id, :logo, :name, :price, :slug

  def logo
    object.logo.small
  end
end
