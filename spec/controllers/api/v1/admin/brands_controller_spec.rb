# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::BrandsController do
  let(:user) { create(:user, admin: true) }
  let(:headers) { { 'Authorization' => fetch_token(user) } }
  let(:brand_name) { Constants::BRAND_NAMES.first }

  before { request.headers.merge! headers }

  describe 'routes' do
    it { should route(:get, '/api/v1/admin/brands').to(action: :index, format: :json) }
  end

  describe 'GET#index' do
    let(:params) { nil }
    let(:send_request) { get :index, params: params, format: :json }

    before do
      Constants::BRAND_NAMES.each do |name|
        create(:brand, name: name)
      end
    end

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end

    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'with search' do
      let(:params) { { 'q' => brand_name } }

      before { send_request }

      it { expect(response.parsed_body['data']&.count).to eq(1) }
      it { expect(response.parsed_body['data']&.first.try(:[], 'name')&.downcase).to eq(brand_name) }
    end

    context 'without search' do
      before do
        send_request
      end

      it { expect(response.parsed_body['data']&.count).to eq(2) }
    end
  end
end
