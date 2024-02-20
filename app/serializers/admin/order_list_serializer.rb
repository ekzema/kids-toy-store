# frozen_string_literal: true

class Admin::OrderListSerializer < ActiveModel::Serializer
  attributes :id, :status, :amount, :created_at, :full_name
end
