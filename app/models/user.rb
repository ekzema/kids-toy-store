# frozen_string_literal: true

class User < ApplicationRecord
  CONFIRMATION_TOKEN_EXPIRATION = 30.minutes
  PASSWORD_RESET_TOKEN_EXPIRATION = 30.minutes

  has_secure_password
  before_save :downcase_email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex

  # def generate_password_token!
  #   update!(reset_password_token: generate_token, reset_password_sent_at: Time.zone.now)
  # end

  # def password_token_valid?
  #   (reset_password_sent_at + 4.hours) > Time.zone.now
  # end

  # def reset_password!(password)
  #   update!(reset_password_token: nil, password: password)
  # end

  def confirm!
    update!(confirmed_at: Time.current)
  end

  def send_password_reset_email!
    password_reset_token = generate_password_reset_token
    # UserMailer.password_reset(self, password_reset_token).deliver_now
  end

  private

  # def generate_token
  #   SecureRandom.hex(10)
  # end

  def downcase_email
    self.email = email.downcase
  end

  def generate_confirmation_token
    signed_id(expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email)
  end

  def generate_password_reset_token
    signed_id(expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :reset_password)
  end
end
