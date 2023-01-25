# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::CategoriesController do
  describe 'routes' do
    it { should route(:get, '/api/v1/admin/categories').to(action: :index, format: :json) }
    it { should route(:get, '/api/v1/admin/categories/1').to(action: :show, id: 1, format: :json) }
    it { should route(:post, '/api/v1/admin/categories').to(action: :create, format: :json) }
    it { should route(:put, '/api/v1/admin/categories/1').to(action: :update, id: 1, format: :json) }
    it { should route(:get, '/api/v1/admin/categories/parents').to(action: :parents, format: :json) }
    it { should route(:delete, '/api/v1/admin/categories/1').to(action: :destroy, id: 1, format: :json) }
  end

  describe 'GET#index' do
    let(:send_request) { get :index, params: { q: 'books' }, format: :json }

    before do
      %w[books constructors puzzles].each do |name|
        create(:category, name: name)
      end
    end

    context 'with token provided' do
      it { expect(response.content_type).to include('application/json') }
      it { expect(response).to have_http_status(:success) }
    end

    context 'without token provided' do
      pending('waiting for user to be created')
    end


    context 'with search' do
      before do
        request.params[:q] = 'books'
        send_request
      end


    end


  end
end
