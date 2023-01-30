# frozen_string_literal: true

class ApiController < ActionController::API
  include Paginate
  include JWTSessions::RailsAuthorization

  EXCEPTIONS = %w[JWTSessions::Errors::Error
                  JWTSessions::Errors::Malconfigured
                  JWTSessions::Errors::InvalidPayload
                  JWTSessions::Errors::Unauthorized
                  JWTSessions::Errors::ClaimsVerification
                  JWTSessions::Errors::Expired].freeze

  rescue_from(*EXCEPTIONS, with: :exception_handler)

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

  def error_required_field(field)
    render json: { success: false, error: "Params :#{field} required" }, status: :bad_request
  end

  def current_user
    return unless request.headers['Authorization']

    @current_user ||= User.find(payload['user_id'])
  rescue StandardError
    nil
  end

  def exception_handler(exception)
    render_error_response(exception.message, :unauthorized)
  end
end
