# frozen_string_literal: true

class Admin::OrderSerializer < ApplicationSerializer
  attributes :id, :status, :created_at, :delivery, :department_number, :pay_type, :city, :note, :products, :statuses

  def statuses
    Order.statuses.keys.map { |key| { id: key, title: key.humanize } }
  end
end
