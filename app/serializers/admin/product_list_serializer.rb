# frozen_string_literal: true

class Admin::ProductListSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :price, :new, :visible, :code, :discount, :discount_price, :logo

  def status
    object.status.humanize
  end
end
