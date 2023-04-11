# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.search(query)
    where('LOWER(name) LIKE ?', "%#{query&.downcase}%")
  end

  def soft_delete!
    update(deleted_at: Time.zone.now)
  end
end
