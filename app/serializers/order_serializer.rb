# frozen_string_literal: true

class OrderSerializer < ApplicationSerializer
  attributes :id, :status, :amount, :created_at, :delivery, :department_number, :pay_type, :city, :note, :products
end
