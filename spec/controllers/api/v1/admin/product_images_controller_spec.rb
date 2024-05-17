# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::ProductImagesController do
  let(:user) { create(:user, admin: true) }
  let(:headers) { { 'Authorization' => fetch_token(user) } }
  let(:product_image) { create(:product_image) }

  before { request.headers.merge! headers }

  describe 'routes' do
    it { should route(:delete, '/api/v1/admin/product_images/1').to(action: :destroy, id: 1, format: :json) }
  end

  describe 'DELETE#destroy' do
    let(:send_request) { delete :destroy, params: { id: product_image.id }, format: :json }

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
      before { product_image.destroy }

      it 'raises ActiveRecord::RecordNotFound when record is not found' do
        expect do
          delete :destroy, params: { id: product_image.id }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
