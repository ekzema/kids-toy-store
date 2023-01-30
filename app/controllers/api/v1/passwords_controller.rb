# frozen_string_literal: true

class Api::V1::PasswordsController < ApiController
  def create
    return error_required_field('email') unless create_password_params[:email]

    user = User.find_by(email: create_password_params[:email].downcase)
    return render_error_response('User not found', :not_found) unless user

    user.generate_password_token!
    # TODO: SEND EMAIL HERE

    render_response(status: :no_content)
  end

  def update
    user = User.find_by(reset_password_token: params[:id])
    return render_error_response('Token not found or expired.', :not_found) unless user&.password_token_valid?

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
    params.require(:category).permit(:password, :password_confirmation, :email)
  end
end
