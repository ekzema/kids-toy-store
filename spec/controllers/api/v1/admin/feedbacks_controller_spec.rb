# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::FeedbacksController do
  let(:user) { create(:user, admin: true) }
  let(:headers) { { 'Authorization' => fetch_token(user) } }
  let(:feedback) { create(:feedback) }

  before { request.headers.merge! headers }

  describe 'routes' do
    it { should route(:get, '/api/v1/admin/feedbacks').to(action: :index, format: :json) }
    it { should route(:get, '/api/v1/admin/feedbacks/1').to(action: :show, id: 1, format: :json) }
    it { should route(:put, '/api/v1/admin/feedbacks/1').to(action: :update, id: 1, format: :json) }
    it { should route(:delete, '/api/v1/admin/feedbacks/1').to(action: :destroy, id: 1, format: :json) }
  end

  describe 'GET#index' do
    let(:send_request) { get :index, format: :json }
    let(:count_feedbacks) { 3 }

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end

    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'when index' do
      before do
        count_feedbacks.times { create(:feedback) }
        send_request
      end

      it { expect(response.parsed_body['data']&.count).to eq(count_feedbacks) }
    end
  end

  describe 'GET#show' do
    let(:send_request) { get :show, params: { id: feedback.id }, format: :json }

    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end
  end

  describe 'PUT#update' do
    let(:send_request) { put :update, params: { id: feedback.id, feedback: { moderation: true } }, format: :json }

    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end

    context 'when updates' do
      before { send_request }

      it { expect(response.parsed_body['data'].try(:[], 'moderation')).to be(true) }
    end
  end

  describe 'DELETE#destroy' do
    let(:send_request) { delete :destroy, params: { id: feedback.id }, format: :json }

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
      before { feedback.destroy }

      it 'raises ActiveRecord::RecordNotFound when record is not found' do
        expect do
          delete :destroy, params: { id: feedback.id }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
