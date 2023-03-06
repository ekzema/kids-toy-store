# frozen_string_literal: true

class AdminController < ApiController
  before_action :authorize_admin!
  before_action do
    self.namespace_for_serializer = Admin
  end

  private

  def prepare_serializer(data, class_serializer = nil, options = {})
    super { 'Admin' }
  end

  def authorize_admin!
    authorize_by_access_header!
    render_error_response('Access denied', :forbidden) unless current_user&.admin
  end
end
