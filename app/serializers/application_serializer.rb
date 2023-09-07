# frozen_string_literal: true

class ApplicationSerializer < ActiveModel::Serializer
  def initialize(object, options = {})
    options[:except] = [] unless options[:except]
    super(object, options)
  end

  def attributes(*args)
    super.except(*instance_options[:except])
  end

  private

  def current_user
    scope
  end
end
