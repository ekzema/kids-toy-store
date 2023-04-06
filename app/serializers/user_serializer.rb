# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone, :first_name, :last_name, :patronymic, :wishlists_count
end
