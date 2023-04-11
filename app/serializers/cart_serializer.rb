# frozen_string_literal: true

class CartSerializer < ActiveModel::Serializer
  attributes :id

  has_many :line_items
end
