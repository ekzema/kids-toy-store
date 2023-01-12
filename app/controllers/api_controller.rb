# frozen_string_literal: true

class ApiController < ActionController::API
  include Paginate

  private

  def prepare_serializer(data, class_serializer = nil, options = {})
    object_class = "#{fetch_object_class(data)}_serializer".camelize
    object_class = "#{yield}::" + object_class if block_given?

    class_serializer ||= object_class.constantize
    type_serialize = data.respond_to?(:each) ? :each_serializer : :serializer

    ActiveModelSerializers::SerializableResource.new(data, type_serialize => class_serializer, **options)
  end

  def fetch_object_class(object)
    object_class = object.respond_to?(:klass) ? object.klass : object.class
    object_class.to_s.downcase
  end

  # rubocop:disable Layout/LineLength
  def render_response(data = nil, *options_serializer, expand: {}, status: :ok)
    response = { success: true }
    response.merge! expand if expand.present? && expand.instance_of?(Hash)
    prepare_data = data.instance_of?(Hash) || data.instance_of?(Array) || data.nil? ? data : prepare_serializer(data, *options_serializer)
    response[:data] = prepare_data

    render json: response, status: status
  end
  # rubocop:enable Layout/LineLength

  def render_error_response(message = 'Bad Request', status = :bad_request)
    render json: { success: false, error: message }, status: status
  end
end
