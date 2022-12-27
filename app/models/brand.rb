# frozen_string_literal: true

class Brand < ApplicationRecord
  has_many :products, dependent: :restrict_with_exception
  validates :name, presence: true
  before_save :downcase_name

  private

  def downcase_name
    name.downcase!
  end
end
