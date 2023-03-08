# frozen_string_literal: true

class Api::V1::SessionsController < ApiController
  before_action :authorize_by_access_header!, only: [:destroy]

  def create
    user = User.find_by(email: session_params[:email])
    return render_error_response('Cannot find user', :not_found) unless user&.authenticate(session_params[:password])

    payload = { user_id: user.id }
    session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
    tokens = session.login

    render_response({ access_token: tokens[:access], access_expires_at: tokens[:access_expires_at], admin: user.admin })
  end

  def destroy
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload

    render_response(status: :no_content)
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
