# frozen_string_literal: true

class Api::V1::UsersController < ApiController
  before_action :authorize_by_access_header!

  def info
    render_response(current_user)
  end

  def cart
    render_response(current_user.cart)
  end
end
