# frozen_string_literal: true

class Api::V1::UsersController < ApiController
  before_action :authorize_by_access_header!

  def info
    fields = params[:except_fields]&.split(',')&.map(&:to_sym) || []
    render_response(current_user, UserSerializer, { except: fields })
  end

  def update_account
    current_user.update(user_params)
    render_response(current_user, UserSerializer, { except: %i[line_items wishlists_count] })
  end

  def change_password
    return error_required_field('current_password') if password_params[:current_password].blank?

    unless current_user.authenticate(password_params[:current_password])
      return render_error_response('Current password is incorrect', :forbidden)
    end

    current_user.update!(password_params)
    render_response(status: :no_content)
  end

  private

  def user_params
    params.require(:user).permit(:email, :phone, :first_name, :last_name, :patronymic)
  end

  def password_params
    params.require(:password).permit(:current_password, :password, :password_confirmation)
  end
end
