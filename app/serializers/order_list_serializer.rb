# frozen_string_literal: true

class OrderListSerializer < ApplicationSerializer
  attributes :id, :status, :code, :amount, :created_at
end
