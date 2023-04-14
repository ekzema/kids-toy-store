# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :description, :price, :code, :discount, :discount_price, :logo, :specifications,
             :production_country, :slug, :wishlist

  has_many :product_images
  has_many :product_categories
  belongs_to :brand do
    object.brand.attributes.slice('id', 'name')
  end

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
