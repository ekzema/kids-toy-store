# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :cart

  validates :first_name, :last_name, :patronymic, :phone, :city, :pay_type, :delivery, presence: true
end
