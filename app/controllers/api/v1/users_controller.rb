# frozen_string_literal: true

class Api::V1::UsersController < ApiController
  before_action :authorize_by_access_header!

  def info
    fields = params[:except_fields]&.split(',')&.map(&:to_sym) || []
    render_response(current_user, UserSerializer, { except: fields })
  end

  def update_account
    current_user.update(account_params)
    render_response(current_user, UserSerializer, { except: %i[line_items wishlists_count] })
  end

  def change_password
    # return error_required_field('current_password') unless password_params[:current_password]

    puts '------START------'
    pp password_params
    # pp current_user.authenticate('qwerty')
    # puts '------END------'
    # render json: {dsd: 'dsd'}
  end

  private

  def account_params
    params.require(:user).permit(:email, :phone, :first_name, :last_name, :patronymic)
  end

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
