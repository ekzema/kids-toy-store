# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone, :first_name, :last_name, :patronymic, :wishlists_count, :line_items

  def initialize(object, options = {})
    options[:except] = [] unless options[:except]
    super(object, options)
  end

  def attributes(*args)
    super.except(*instance_options[:except])
  end

  def line_items
    ActiveModelSerializers::SerializableResource.new(object.cart.line_items)
  end
end
