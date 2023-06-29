# frozen_string_literal: true

class V1::Orders::CreateService < ApplicationService
  class EmptyLineItemsError < StandardError
    def initialize
      super 'Line items cannot be empty'
    end
  end

  def call
    current_user ? build_order(current_user.cart) : create_without_user
  end

  private

  def create_without_user
    raise EmptyLineItemsError if line_items.blank?

    ActiveRecord::Base.transaction do
      cart = Cart.create
      cart.line_items.create!(line_items)

      build_order(cart)
    end
  end

  def build_order(cart)
    raise EmptyLineItemsError if cart&.line_items.blank?

    cart.build_order(params.except(:current_user, :line_items))
  end

  def line_items
    params[:line_items]
  end
end
