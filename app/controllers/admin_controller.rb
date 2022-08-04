class AdminController < ApiController
  before_action do
    self.namespace_for_serializer = Admin
  end

  def prepare_serializer(data, class_serializer = nil, options = {})
    super { 'Admin' }
  end
end
