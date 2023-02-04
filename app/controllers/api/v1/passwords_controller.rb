# frozen_string_literal: true

class Api::V1::PasswordsController < ApiController
  def create
    return error_required_field('email') unless create_password_params[:email]

    user = User.find_by(email: create_password_params[:email].downcase)
    return render_error_response('User not found', :not_found) unless user

    user.send_password_reset_email!
    render_response
  end

  def update
    user = User.find_signed(params[:id], purpose: :reset_password)
    return render_error_response('Invalid or expired token.', :not_found) unless user

    if user.update(update_password_params)
      render_response(expand: { message: 'Your password has been updated.' })
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def create_password_params
    password_params.slice(:email)
  end

  def update_password_params
    password_params.slice(:password, :password_confirmation)
  end

  def password_params
    params.require(:password).permit(:password, :password_confirmation, :email)
  end
end
