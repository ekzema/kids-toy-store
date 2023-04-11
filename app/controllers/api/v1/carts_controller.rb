# frozen_string_literal: true

class Api::V1::CartsController < ApiController
  before_action :authorize_by_access_header!

  def create
    cart = current_user.cart || current_user.build_cart
    line_item = cart.new_record? ? cart.line_items.new(cart_params) : create_or_update_line_item(cart)
    return render_response(cart) if line_item.save

    render json: line_item.errors, status: :unprocessable_entity
  end

  private

  def create_or_update_line_item(cart)
    line_item = cart.line_items.find_by(product_id: cart_params[:product_id])
    if line_item
      line_item.quantity += cart_params[:quantity]
    else
      line_item = cart.line_items.new(cart_params)
    end

    line_item
  end

  def cart_params
    params.require(:cart).permit(:product_id, :quantity)
  end
end
