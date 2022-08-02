class Api::V1::ProductsController < ApiController
  def index
    render json: {test: 'test'}
  end
end
