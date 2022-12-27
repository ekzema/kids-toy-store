# frozen_string_literal: true

class Products::DetailBuilder
  def perform
    build_response
  end

  private

  def build_response
    {
      age:        Product::AGE,
      genders:    Product.for_genders.keys.map { |key| { id: key, title: key.titleize.split.join('/') } },
      statuses:   prepare_enums('statuses'),
      countries:  prepare_enums('production_countries'),
      categories: prepare_categories
    }
  end

  def prepare_categories
    categories = Category.all
    ActiveModelSerializers::SerializableResource.new(categories, each_serializer: Admin::CategorySerializer)
  end

  def prepare_enums(enum)
    Product.send(enum).keys.map { |key| { id: key, title: key.humanize } }
  end
end
