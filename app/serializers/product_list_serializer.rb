# frozen_string_literal: true

class ProductListSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :code, :discount, :discount_price, :logo, :slug, :wishlist

  def wishlist
    return false unless current_user

    wishlist = object.wishlists.pluck(:user_id).include?(current_user.id)
    wishlist.present?
  end

  private

  def current_user
    scope
  end
end
