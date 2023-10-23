# frozen_string_literal: true

class OrderListSerializer < ApplicationSerializer
  attributes :id, :status, :amount, :created_at
end
