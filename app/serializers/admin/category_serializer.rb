class Admin::CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :parent_name

  def parent_name
    object.parent&.name
  end
end
