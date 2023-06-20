# frozen_string_literal: true

class V1::Orders::CreateService < ApplicationService
  def call
    current_user ? build_order(current_user.cart) : create_without_user
  end

  private

  def create_without_user
    ActiveRecord::Base.transaction do
      cart = Cart.create
      cart.line_items.create!(line_items)

      build_order(cart)
    end
  end

  def build_order(cart)
    cart.build_order(params.except(:current_user, :line_items))
  end

  def line_items
    params[:line_items]
  end
end
