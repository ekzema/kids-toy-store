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
    @line_item.destroy
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:product_id, :quantity)
  end
end
