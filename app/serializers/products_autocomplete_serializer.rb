# frozen_string_literal: true

class ProductsAutocompleteSerializer < ApplicationSerializer
  attributes :id, :logo, :name, :price, :slug

  def logo
    object.logo.small
  end
end
