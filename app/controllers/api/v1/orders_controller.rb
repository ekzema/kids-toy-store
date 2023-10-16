# frozen_string_literal: true

class Api::V1::OrdersController < ApiController
  before_action :authorize_by_access_header!

  def index
    render_paginate(orders, OrderListSerializer)
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

  private

  def orders
    # Order.includes(:cart).where('carts.user_id': current_user.id).where.not('carts.deleted_at': nil)
    # Order.joins('INNER JOIN carts ON carts.id = orders.cart_id').where('carts.user_id': current_user.id)
    Order.includes(:cart).where('carts.user_id': current_user.id).where.not('carts.deleted_at': nil)
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :patronymic, :email, :phone, :city, :pay_type, :delivery,
                                  :department_number, :note, line_items: %i[product_id quantity])
  end
end
