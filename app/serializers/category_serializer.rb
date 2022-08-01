class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :parent_id, :name
end
