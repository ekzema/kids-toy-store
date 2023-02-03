# frozen_string_literal: true

class Api::V1::RegistrationsController < ApiController
  def create
    user = User.new(registration_params)

    if user.save
      user.send_confirmation_email!
      render_response(expand: { message: 'Please check your email for confirmation instructions.' }, status: :created)
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:email, :password, :password_confirmation)
  end
end
