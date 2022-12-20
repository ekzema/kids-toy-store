class Admin::ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :price, :new, :visible, :code, :discount, :discount_price,
             :specifications, :logo, :for_age, :for_gender, :production_country, :brand_id

  has_many :product_images
  has_many :product_categories

  def status
    object.status
  end
end
