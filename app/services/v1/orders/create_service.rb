# frozen_string_literal: true

class V1::Orders::CreateService < ApplicationService
  def call
    current_user ? build_order(current_user.cart) : create_without_user
  end

  private

  def create_without_user
    # TODO create_without_user
  end

  def build_order(cart)
    cart.build_order(params.except(:current_user))
  end
end
