# frozen_string_literal: true

class Admin::BrandSerializer < ActiveModel::Serializer
  attributes :id, :name

  def name
    object.name.capitalize
  end
end
