# frozen_string_literal: true

class Api::V1::RegistrationsController < ApiController
  def create
    user = User.unscoped.find_by(email: registration_params[:email], confirmed_at: nil)
    return confirmation_and_render(user) if user

    user = User.new(registration_params)
    return confirmation_and_render(user) if user.save

    render json: user.errors, status: :unprocessable_entity
  end

  def check_email
    return error_required_field('email') unless params[:email]

    user = User.find_by(email: params[:email])
    return render_response({ valid: false, type: 'unique' }) if user
    return render_response({ valid: false, type: 'bad_domain' }) unless User.email_is_valid?(params[:email])

    render_response({ valid: true })
  end

  private

  def confirmation_and_render(user)
    user.send_confirmation_email!
    render_response(status: :created)
  end

  def registration_params
    params.require(:registration).permit(:email, :password, :password_confirmation)
  end
end
