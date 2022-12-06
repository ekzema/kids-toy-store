class Admin::ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :price, :new, :visible, :code, :discount, :discount_price,
             :specifications, :logo

  has_many :product_images
  has_many :product_categories

  def status
    statuses = Product.statuses
    {
      items: statuses.map { |key, value| {id: value, title: key.humanize} },
      current: statuses[object.status]
    }
  end
end
