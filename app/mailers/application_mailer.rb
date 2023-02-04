# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@mira-shop.com.ua'
  layout 'mailer'
end
