class Api::V1::ProductsController < ApplicationController
  def index
    render json: {test: 'test'}
  end
end
