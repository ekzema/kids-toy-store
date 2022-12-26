class Brand < ApplicationRecord
  has_many :products
  validates :name, presence: true
  before_save :downcase_name

  private

  def downcase_name
    self.name.downcase!
  end
end
