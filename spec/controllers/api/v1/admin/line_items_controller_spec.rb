# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::LineItemsController do
  let(:user) { create(:user, admin: true) }
  let(:headers) { { 'Authorization' => fetch_token(user) } }
  let(:line_item) { create(:line_item, quantity: 1) }

  before { request.headers.merge! headers }

  describe 'routes' do
    it { should route(:put, '/api/v1/admin/line_items/1').to(action: :update, id: 1, format: :json) }
    it { should route(:delete, '/api/v1/admin/line_items/1').to(action: :destroy, id: 1, format: :json) }
  end

  describe 'PUT#update' do
    let(:send_request) { put :update, params: { id: line_item.id, line_item: { quantity: 2 } }, format: :json }


    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end

    context 'when updates' do
      before { send_request }

      it { expect(line_item.reload.quantity).to be(2) }
    end
  end

  describe 'DELETE#destroy' do
    let(:send_request) { delete :destroy, params: { id: line_item.id }, format: :json }

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
      before { line_item.destroy }

      it 'raises ActiveRecord::RecordNotFound when record is not found' do
        expect do
          delete :destroy, params: { id: line_item.id }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
