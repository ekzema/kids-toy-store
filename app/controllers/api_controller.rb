class ApiController < ActionController::API
  def prepare_serializer(data, class_serializer = nil, options = {})

    class_serializer ||= "#{fetch_object_class(data)}_serializer".camelize.constantize
    type_serialize = data.respond_to?(:each) ? :each_serializer : :serializer

    ActiveModelSerializers::SerializableResource.new(data, type_serialize => class_serializer, **options)
  end

  private

  def fetch_object_class(object)
    object_class = object.respond_to?(:klass) ? object.klass : object.class
    object_class.to_s.downcase
  end

  def render_response(data = {}, *options_serializer, expand: {}, status: :ok)
    response = { success: true }
    response.merge! expand if expand.present? && expand.instance_of?(Hash)
    prepare_data = (data.instance_of?(Hash) || data.instance_of?(Array) || data.nil?) ? data : prepare_serializer(data, *options_serializer)
    response.merge!(data: prepare_data)

    render json: response, status: status
  end

  def render_error_response(message = 'Bad Request', status = :bad_request)
    render json: { success: false, error: message }, status: status
  end
end
