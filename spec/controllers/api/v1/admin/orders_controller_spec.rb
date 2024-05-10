# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Admin::OrdersController do
  let(:user) { create(:user, admin: true) }
  let(:headers) { { 'Authorization' => fetch_token(user) } }
  let(:order) { create(:order) }

  before { request.headers.merge! headers }

  describe 'routes' do
    it { should route(:get, '/api/v1/admin/orders').to(action: :index, format: :json) }
    it { should route(:get, '/api/v1/admin/orders/1').to(action: :show, id: 1, format: :json) }
    it { should route(:put, '/api/v1/admin/orders/1').to(action: :update, id: 1, format: :json) }
    it { should route(:get, '/api/v1/admin/orders/detail_constructor').to(action: :detail_constructor, format: :json) }
  end

  describe 'GET#index' do
    let(:send_request) { get :index, format: :json }
    let(:count_orders) { 3 }

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end

    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'when index' do
      before do
        count_orders.times { create(:order) }
        send_request
      end

      it { expect(response.parsed_body['data']&.count).to eq(count_orders) }
    end
  end

  describe 'GET#show' do
    let(:send_request) { get :show, params: { id: order.id }, format: :json }

    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end
  end

  describe 'PUT#update' do
    let(:send_request) { put :update, params: { id: order.id, order: { status: :completed } }, format: :json }

    context 'with token provided' do
      it_behaves_like 'with token provided'
    end

    context 'without token provided' do
      it_behaves_like 'without token provided'
    end

    context 'when updates' do
      before { send_request }

      it { expect(response.parsed_body['data'].try(:[], 'status')).to eq('completed') }
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
      %w[deliveries pay_types statuses].each do |detail|
        it { expect(response.parsed_body['data']&.key?(detail)).to be(true) }
      end
    end
  end
end
