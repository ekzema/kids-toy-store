# frozen_string_literal: true

class Api::V1::WishlistsController < ApiController
  before_action :authorize_by_access_header!

  def index
    products = current_user.wish_products
    render_paginate(products, ProductListSerializer)
  end

  def create
    wishlist = current_user.wishlists.find_by(wishlist_params)
    wishlist&.destroy! || current_user.wishlists.create!(wishlist_params)
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:product_id)
  end
end
