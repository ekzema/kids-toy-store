# frozen_string_literal: true

class Api::V1::LineItemsController < ApiController
  before_action :authorize_by_access_header!

  def destroy
    line_item = line_items.find(params[:id])
    line_item.destroy
  end

  private

  def line_items
    current_user.cart.line_items
  end
end
