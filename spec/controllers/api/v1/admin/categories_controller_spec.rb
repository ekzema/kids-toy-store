# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::CategoriesController do
  let(:user) { create(:user, admin: true) }
  let(:headers) { { 'Authorization' => fetch_token(user) } }

  before { request.headers.merge! headers }

  describe 'routes' do
    it { should route(:get, '/api/v1/admin/categories').to(action: :index, format: :json) }
    it { should route(:get, '/api/v1/admin/categories/1').to(action: :show, id: 1, format: :json) }
    it { should route(:post, '/api/v1/admin/categories').to(action: :create, format: :json) }
    it { should route(:put, '/api/v1/admin/categories/1').to(action: :update, id: 1, format: :json) }
    it { should route(:get, '/api/v1/admin/categories/parents').to(action: :parents, format: :json) }
    it { should route(:delete, '/api/v1/admin/categories/1').to(action: :destroy, id: 1, format: :json) }
  end

  describe 'GET#index' do
    let(:params) { nil }
    let(:constructors) { Constants::CATEGORY_NAMES.first.transform_keys(&:to_s) }
    let(:send_request) { get :index, params: params, format: :json }

    before do
      Constants::CATEGORY_NAMES.each do |name|
        create(:category, name: name)
      end
    end

    context 'without token provided' do
      pending('waiting for user to be created')
    end

    context 'with token provided' do
      before { send_request }

      it { expect(response.content_type).to include('application/json') }
      it { expect(response).to have_http_status(:success) }
    end

    context 'with search' do
      let(:params) { { 'q' => constructors['ua'] } }

      before { send_request }

      it { expect(response.parsed_body['data'].count).to eq(1) }
      it { expect(response.parsed_body['data'].first['name']).to eq(constructors) }
    end

    context 'without search' do
      before do
        send_request
      end

      it { expect(response.parsed_body['data'].count).to eq(3) }
    end
  end
end
