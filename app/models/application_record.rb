# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  private

  def search(query)
    where('LOWER(name) LIKE ?', "%#{query&.downcase}%")
  end
end
