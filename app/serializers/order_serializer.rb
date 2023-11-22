# frozen_string_literal: true

class OrderSerializer < ApplicationSerializer
  attributes :id, :status, :amount, :created_at
end
