class Admin::ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :price, :new, :visible, :code, :discount, :discount_price,
             :specifications, :logo, :for_age

  has_many :product_images
  has_many :product_categories

  def status
    Product.statuses[object.status]
  end
end
