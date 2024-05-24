# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::FeedbacksController do
  describe 'routes' do
    it { should route(:post, '/api/v1/feedbacks').to(action: :create, format: :json) }
  end

  describe 'POST#create' do
    let(:params) do
      {
        name:    Faker::Superhero.name,
        email:   Faker::Internet.email,
        message: Faker::Lorem.paragraph
      }
    end
    let(:send_request) { post :create, params: { feedback: params }, format: :json }

    context 'when created' do
      before { send_request }

      it { expect(response).to have_http_status(:success) }
      it { expect(response.parsed_body['success']).to be(true) }
    end
  end
end
