class Admin::CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :parent_name, :parent_id

  def parent_name
    object.parent&.name
  end
end
