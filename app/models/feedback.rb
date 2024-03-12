# frozen_string_literal: true

class Feedback < ApplicationRecord
  validates :name, :message, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
