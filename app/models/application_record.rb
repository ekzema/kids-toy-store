class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  private

  def self.search(query)
    where('LOWER(name) LIKE ?', "%#{query&.downcase}%")
  end
end
