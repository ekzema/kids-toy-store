class Api::V1::Admin::ProductsController < AdminController
  def index
    render json: {test: 'test'}
  end
end
