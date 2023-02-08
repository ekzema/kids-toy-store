# frozen_string_literal: true

module JwtSessions
  def fetch_token(user)
    payload = { user_id: user.id }
    session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
    session.login[:access]
  end
end

RSpec.configure do |config|
  config.include JwtSessions
end
