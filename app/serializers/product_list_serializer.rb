# frozen_string_literal: true

class ProductListSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :code, :discount, :discount_price, :logo, :slug, :wishlist

  def wishlist
    puts '------------'
    pp current_user
    puts '------------'
    true
  end

  private

  def current_user
    scope
  end
end
