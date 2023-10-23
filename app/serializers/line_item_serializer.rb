# frozen_string_literal: true

class LineItemSerializer < ApplicationSerializer
  attributes :id, :quantity, :product_id
end
