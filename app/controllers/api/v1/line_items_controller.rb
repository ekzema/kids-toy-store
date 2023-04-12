# frozen_string_literal: true

class Api::V1::LineItemsController < ApiController
  before_action :authorize_by_access_header!

  def create
    cart = current_user.cart || current_user.build_cart
    line_item = cart.new_record? ? cart.line_items.new(line_item_params) : create_or_update_line_item(cart)
    return render_response(cart.line_items) if line_item.save

    render json: line_item.errors, status: :unprocessable_entity
  end

  def destroy
    line_item = line_items.find(params[:id])
    line_item.destroy
  end

  private

  def create_or_update_line_item(cart)
    line_item = cart.line_items.find_by(product_id: line_item_params[:product_id])
    if line_item
      line_item.quantity += line_item_params[:quantity]
    else
      line_item = cart.line_items.new(line_item_params)
    end

    line_item
  end

  def line_items
    current_user.cart.line_items
  end

  def line_item_params
    params.require(:line_item).permit(:product_id, :quantity)
  end
end
