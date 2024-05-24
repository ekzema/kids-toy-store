# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CategoriesController do
  describe 'routes' do
    it { should route(:get, '/api/v1/categories').to(action: :index, format: :json) }
  end

  describe 'GET#index' do
    let(:params) { nil }
    let(:send_request) { get :index, params: params, format: :json }

    before do
      Constants::CATEGORY_NAMES.each do |name|
        create(:category, name: name)
      end
    end

    context 'when index' do
      before do
        send_request
      end

      it { expect(response.parsed_body['data']&.count).to eq(3) }
    end
  end
end
