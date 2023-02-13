# frozen_string_literal: true

class Api::V1::SessionsController < ApiController
  before_action :authorize_access_request!, only: [:destroy]

  def create
    user = User.find_by(email: session_params[:email])
    return render_error_response('Cannot find user') unless user&.authenticate(session_params[:password])

    payload = { user_id: user.id }
    session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
    tokens = session.login

    response.set_cookie(JWTSessions.access_cookie,
                        value: tokens[:access],
                        httponly: true,
                        secure: Rails.env.production?)

    render_response({ csrf: tokens[:csrf] })
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
