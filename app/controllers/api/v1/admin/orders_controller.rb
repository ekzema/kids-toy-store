# frozen_string_literal: true

class Api::V1::Admin::OrdersController < AdminController
  def index
    orders = Order.all
    render_paginate(orders, Admin::OrderListSerializer)
  end

  def show
    order = Order.find(params[:id])
    render_response(order, OrderSerializer)
  end
end
