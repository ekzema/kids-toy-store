# frozen_string_literal: true

RSpec.shared_examples 'with missing token' do
  subject { response }

  let(:message) { 'Token is missing.' }

  before { send_request }

  it { expect(response.content_type).to include('application/json') }
  it { should have_http_status(:unauthorized) }
  it { expect(subject.parsed_body['success']).to be false }
  it { expect(subject.parsed_body['error']).to be_instance_of(String) && eq(message) }
end

RSpec.shared_examples 'with raised error' do
  it { expect(response.content_type).to include('application/json') }
  it { should have_http_status(:unprocessable_entity) }
  it { expect(subject.parsed_body['success']).to be false }
  it { expect(subject.parsed_body['error']).to be_present && be_instance_of(String) }
end

