# frozen_string_literal: true

class Api::V1::Admin::LineItemsController < ApiController
  before_action :set_line_item, only: %i[destroy update]

  def update
    if @line_item.update(line_item_params)
      render_response
    else
      render json: @line_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    update_order_products if @line_item.destroy
  end

  private

  def update_order_products
    products_info = @line_item.cart.order.products_info
    product_id = @line_item.product_id

    @line_item.cart.order.update(products_info: products_info.reject { |item| item['id'] == product_id })
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:product_id, :quantity)
  end
end
