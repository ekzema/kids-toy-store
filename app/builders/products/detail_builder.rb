class Products::DetailBuilder
  def perform
    build_response
  end

  private

  def build_response
    {
      statuses: Product.statuses.map { |key, value| {id: value, title: key.humanize} },
      categories: prepare_categories
    }
  end

  def prepare_categories
    categories = Category.all
    ActiveModelSerializers::SerializableResource.new(categories,  each_serializer: Admin::CategorySerializer)
  end

end
