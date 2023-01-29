# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  def generate_password_token!
    update!(reset_password_token: generate_token, reset_password_sent_at: Time.zone.now)
  end

  def password_token_valid?
    (reset_password_sent_at + 4.hours) > Time.zone.now
  end

  def reset_password!(password)
    update!(reset_password_token: nil, password: password)
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end
end
