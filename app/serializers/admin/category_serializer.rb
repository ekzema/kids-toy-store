# frozen_string_literal: true

class Admin::CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :parent_name, :parent_id, :is_parent

  def parent_name
    object.parent&.name
  end

  # rubocop:disable Naming/PredicateName
  def is_parent
    categories_count = Category.where(parent_id: object.id).count
    !categories_count.zero?
  end
  # rubocop:enable Naming/PredicateName
end
