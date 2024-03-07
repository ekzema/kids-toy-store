# frozen_string_literal: true

class Api::V1::OrdersController < ApiController
  before_action :authorize_by_access_header!, except: [:create]
  before_action :set_order, only: %i[show]

  def index
    render_paginate(orders, OrderListSerializer)
  end

  def show
    render_response(@order)
  end

  def create
    order = ::V1::Orders::CreateService.perform(order_params.merge(current_user: current_user))
    if order.save
      order.cart.soft_delete!
      render_response(status: :created)
    else
      order.cart.destroy
      render json: order.errors, status: :unprocessable_entity
    end
  end

  def detail_constructor
    detail = Orders::DetailBuilder.new.perform
    render_response(detail)
  end

  private

  def set_order
    @order = orders.find(params[:id])
  end

  def orders
    # Order.includes(:cart).where('carts.user_id': current_user.id).where.not('carts.deleted_at': nil)
    # Order.joins('INNER JOIN carts ON carts.id = orders.cart_id').where('carts.user_id': current_user.id)
    Order.includes(:cart).where('carts.user_id': current_user.id)
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :patronymic, :email, :phone, :city, :pay_type, :delivery,
                                  :department_number, :note, line_items: %i[product_id quantity])
  end
end
