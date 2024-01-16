# frozen_string_literal: true

class Admin::ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :price, :new, :visible, :code, :discount, :discount_price,
             :specifications, :logo, :for_age, :for_gender, :production_country, :status

  has_many :product_images
  has_many :product_categories
  belongs_to :brand do
    object.brand ? object.brand.attributes.slice('id', 'name') : ''
  end
end
