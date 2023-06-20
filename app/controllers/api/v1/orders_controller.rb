# frozen_string_literal: true

class Api::V1::OrdersController < ApiController
  def create
    order = ::V1::Orders::CreateService.perform(order_params.merge(current_user: current_user))
    if order.save
      render_response(status: :created)
    else
      order.cart.destroy
      render json: order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :patronymic, :email, :phone, :city, :pay_type, :delivery,
                                  :department_number, :note, line_items: %i[product_id quantity])
  end
end
