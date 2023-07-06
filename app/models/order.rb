# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :cart

  validates :first_name, :last_name, :patronymic, :email, :phone, :city, :pay_type, :delivery, presence: true
  validates :first_name, :last_name, :patronymic, length: { minimum: 3 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates :phone, length: { is: 13 }
  validates :city, :department_number, presence: true, if: :delivery?
  validates :city, length: { minimum: 3 }, if: :delivery?

  enum pay_type: { privat_bank: 1, cash_on_delivery: 2, other_payment_method: 3 }
  enum delivery: { novaya_pochta: 1, ukrpochta: 2, self_delivery: 3 }
end
