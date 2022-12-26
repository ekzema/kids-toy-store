class Admin::ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :price, :new, :visible, :code, :discount, :discount_price,
             :specifications, :logo, :for_age, :for_gender, :production_country

  has_many :product_images
  has_many :product_categories
  belongs_to :brand, serializer: Admin::BrandSerializer

  def status
    object.status
  end
end
