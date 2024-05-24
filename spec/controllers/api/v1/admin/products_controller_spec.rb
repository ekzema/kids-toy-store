# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::ProductsController do
  let(:user) { create(:user, admin: true) }
  let(:headers) { { 'Authorization' => fetch_token(user) } }
  let(:constructors) { Constants::PRODUCT_NAMES.first.transform_keys(&:to_s) }

  before { request.headers.merge! headers }

  describe 'routes' do
    it { should route(:get, '/api/v1/admin/products').to(action: :index, format: :json) }
    it { should route(:get, '/api/v1/admin/products/1').to(action: :show, id: 1, format: :json) }
    it { should route(:post, '/api/v1/admin/products').to(action: :create, format: :json) }
    it { should route(:put, '/api/v1/admin/products/1').to(action: :update, id: 1, format: :json) }
    it { should route(:delete, '/api/v1/admin/products/1').to(action: :destroy, id: 1, format: :json) }
    it { should route(:get, '/api/v1/admin/products/detail_constructor').to(action: :detail_constructor, format: :json) }
  end

  describe 'GET#index' do
    let(:params) { nil }
    let(:send_request) { get :index, params: params, format: :json }

    before do
      Constants::PRODUCT_NAMES.each do |name|
        create(:product, name: name)
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
    let(:product) { create(:product) }
    let(:send_request) { get :show, params: { id: product.id }, format: :json }

    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end
  end

  describe 'POST#create' do
    let(:params) do
      {
        name:               { ua: Faker::Commerce.product_name, ru: Faker::Commerce.product_name }.to_json,
        description:        { ua: Faker::Lorem.paragraph, ru: Faker::Lorem.paragraph }.to_json,
        code:               Faker::Number.number(digits: 4),
        price:              Faker::Number.number(digits: 3),
        status:             :available,
        for_gender:         :boy,
        for_age:            3,
        production_country: :china
      }
    end
    let(:send_request) { post :create, params: { product: params }, format: :json }

    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end
  end

  describe 'PUT#update' do
    let(:product) { create(:product) }
    let(:send_request) { put :update, params: { id: product.id, product: { name: constructors.to_json } }, format: :json }

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
    let(:product) { create(:product) }
    let(:send_request) { delete :destroy, params: { id: product.id }, format: :json }

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
      before { product.destroy }

      it 'raises ActiveRecord::RecordNotFound when record is not found' do
        expect do
          delete :destroy, params: { id: product.id }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'GET#detail_constructor' do
    let(:send_request) { get :detail_constructor, format: :json }

    before { send_request }

    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end

    context 'when detail_constructor' do
      %w[age genders statuses countries categories].each do |detail|
        it { expect(response.parsed_body['data']&.key?(detail)).to be(true) }
      end
    end
  end
end
