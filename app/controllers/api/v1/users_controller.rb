# frozen_string_literal: true

class Api::V1::UsersController < ApiController
  before_action :authorize_by_access_header!

  def info
    fields = params[:except_fields]&.split(',')&.map(&:to_sym) || []
    render_response(current_user, UserSerializer, { except: fields })
  end
end
