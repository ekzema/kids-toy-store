class Admin::ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :price, :new, :visible, :code, :discount, :discount_price,
             :specifications, :logo, :category_ids

  has_many :product_images

  def status
    statuses = Product.statuses
    {
      items: statuses.map { |key, value| {id: value, title: key.humanize} },
      current: statuses[object.status]
    }
  end

  def category_ids
    object.categories.ids
  end
end
