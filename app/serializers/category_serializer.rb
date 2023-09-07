# frozen_string_literal: true

class CategorySerializer < ApplicationSerializer
  attributes :id, :name, :slug

  has_many :subcategories
end
