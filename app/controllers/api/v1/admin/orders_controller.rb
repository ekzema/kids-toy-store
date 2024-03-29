# frozen_string_literal: true

class Api::V1::Admin::OrdersController < AdminController
  before_action :set_order, only: %i[show update]

  def index
    orders = Order.includes(cart: :line_items).all
    render_paginate(orders, Admin::OrderListSerializer)
  end

  def show
    render_response(@order)
  end

  def update
    if @order.update(order_params)
      render_response(@order)
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
