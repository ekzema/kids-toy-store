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

    # current_products = Product.select(:id, :price).includes(:line_items).where('line_items.cart_id' => cart.id)

    current_products = Product.select(:id, 'CASE WHEN discount = true THEN discount_price ELSE price END AS price')
                              .includes(:line_items)
                              .where('line_items.cart_id' => cart.id)
    cart.build_order(params.merge({ products_info: current_products }).except(:current_user, :line_items))
  end

  def line_items
    ids = params[:line_items].pluck(:product_id)
    existing_ids = Product.where(id: ids).pluck(:id)

    params[:line_items].select { |hash| existing_ids.include?(hash[:product_id]) }
  end
end
