# frozen_string_literal: true

class ProductSerializer < ApplicationSerializer
  attributes :id, :name, :status, :description, :price, :code, :discount, :discount_price, :logo, :specifications,
             :production_country, :slug, :wishlist, :product_categories

  has_many :product_images
  belongs_to :brand do
    object.brand ? object.brand.attributes.slice('id', 'name') : ''
  end

  def product_categories
    cat_ids = object.product_categories.pluck(:category_id)
    categories = Category.where(id: cat_ids).map { |category| category.slice('id', 'slug', 'name').merge(parent: parent(category)) }
    ActiveModelSerializers::SerializableResource.new(categories)
  end

  def wishlist
    return false unless current_user

    wishlist = object.wishlists.pluck(:user_id).include?(current_user.id)
    wishlist.present?
  end

  private

  def parent(category)
    return unless category.parent

    category.parent.slice('id', 'slug', 'name')
  end
end
