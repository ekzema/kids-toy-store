# frozen_string_literal: true

class User < ApplicationRecord
  CONFIRMATION_TOKEN_EXPIRATION = 30.minutes
  PASSWORD_RESET_TOKEN_EXPIRATION = 30.minutes

  has_secure_password

  attr_accessor :current_password

  has_many :wishlists, dependent: :destroy
  has_many :wish_products, source: :product, through: :wishlists

  has_one :cart, -> { where(deleted_at: nil) }, dependent: :destroy, inverse_of: :user

  before_save :downcase_email

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :email, 'valid_email_2/email': { mx: true, disposable: true, message: :bad_domain }, unless: :dev_or_test?
  validates :password_digest, length: { minimum: 6 }, if: :password_digest_changed?

  default_scope -> { where(deleted_at: nil).where.not(confirmed_at: nil) }

  class << self
    def email_is_valid?(email)
      address = ValidEmail2::Address.new(email)
      address.valid? && address.valid_mx? && !address.disposable?
    end
  end

  def confirm!
    update!(confirmed_at: Time.current)
  end

  def send_confirmation_email!
    confirmation_token = generate_confirmation_token
    UserMailer.confirmation(self, confirmation_token).deliver_now
  end

  def send_password_reset_email!
    password_reset_token = generate_password_reset_token
    UserMailer.password_reset(self, password_reset_token).deliver_now
  end

  def wishlists_count
    wish_products.visible.count
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def generate_confirmation_token
    signed_id(expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email)
  end

  def generate_password_reset_token
    signed_id(expires_in: PASSWORD_RESET_TOKEN_EXPIRATION, purpose: :reset_password)
  end

  def dev_or_test?
    Rails.env.development? || Rails.env.test?
  end
end
