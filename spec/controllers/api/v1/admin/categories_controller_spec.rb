# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::CategoriesController do
  let(:user) { create(:user, admin: true) }
  let(:headers) { { 'Authorization' => fetch_token(user) } }
  let(:constructors) { Constants::CATEGORY_NAMES.first.transform_keys(&:to_s) }

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
    let(:send_request) { get :index, params: params, format: :json }

    before do
      Constants::CATEGORY_NAMES.each do |name|
        create(:category, name: name)
      end
    end

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end

    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'with search' do
      let(:params) { { 'q' => constructors['ua'] } }

      before { send_request }

      it { expect(response.parsed_body['data']&.count).to eq(1) }
      it { expect(response.parsed_body['data']&.first.try(:[], 'name')).to eq(constructors) }
    end

    context 'without search' do
      before do
        send_request
      end

      it { expect(response.parsed_body['data']&.count).to eq(3) }
    end
  end

  describe 'GET#show' do
    let(:category) { create(:category) }
    let(:send_request) { get :show, params: { id: category.id }, format: :json }

    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end
  end

  describe 'POST#create' do
    let(:send_request) { post :create, params: { category: { name: constructors } }, format: :json }

    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end
  end

  describe 'PUT#update' do
    let(:category) { create(:category) }
    let(:send_request) { put :update, params: { id: category.id, category: { name: constructors } }, format: :json }

    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end

    context 'when updates' do
      before { send_request }

      it { expect(response.parsed_body['data'].try(:[], 'name')).to eq(constructors) }
    end
  end

  describe 'DELETE#destroy' do
    let(:category) { create(:category) }
    let(:send_request) { delete :destroy, params: { id: category.id }, format: :json }

    context 'with token provided' do
      before { send_request }

      it { expect(response).to have_http_status(:no_content) }
    end

    context 'without token provided' do
      let(:headers) { {} }

      before { send_request }

      it { expect(response).to have_http_status(:unauthorized) }
    end

    context 'when deleted' do
      before { category.destroy }

      it 'raises ActiveRecord::RecordNotFound when record is not found' do
        expect do
          delete :destroy, params: { id: category.id }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'GET#parents' do
    let(:send_request) { get :parents, format: :json }
    let(:parent_category) { create(:category) }

    before do
      create(:category, parent_id: parent_category.id)
      send_request
    end

    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end

    it { expect(response.parsed_body['data']&.count).to eq(1) }
  end
end
