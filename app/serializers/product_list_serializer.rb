# frozen_string_literal: true

class ProductListSerializer < ApplicationSerializer
  attributes :id, :name, :price, :code, :discount, :discount_price, :logo, :slug, :status, :wishlist

  def wishlist
    return false unless current_user

    wishlist = object.wishlists.pluck(:user_id).include?(current_user.id)
    wishlist.present?
  end
end
