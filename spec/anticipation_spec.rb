require 'webmock/rspec'
require 'asaas-ruby'

RSpec.describe Asaas::Api::ReceivableAnticipation do
  let(:asaas_client) { Asaas::Client.new }
  let(:headers) do 
    {
      'Access-Token' => Asaas::Configuration.token,
      'Content-Type' => 'application/json',
      'User-Agent' => 'Typhoeus - https://github.com/typhoeus/typhoeus'
    }
  end

  let(:list_example_response) { File.read('spec/fixtures/list_anticipations.json') }
  let(:simulate_example_response) { File.read('spec/fixtures/simulate_anticipation_success_response.json') }
  let(:sign_agreement_example_response) { File.read('spec/fixtures/sign_agreement_success_response.json') }
  let(:get_anticipation_example_response) { File.read('spec/fixtures/get_anticipation_success_response.json') }

  before do
    Asaas::Configuration.token = '544333290e93b9bbcd8107b3d9586e3bef774fb41584790a5ff061e4e0392ed5'
    Asaas::Configuration.api_version = 3
  end

  it 'gets anticipations' do
    params = {}

    stub_request(:get, "https://sandbox.asaas.com/api/v3/anticipations")
      .with(query: params, headers: headers)
      .to_return(status: 200, body: list_example_response)

    response = asaas_client.anticipations.list(params)

    expect(response).to be_a(Asaas::Entity::Meta)
    expect(response.data).to be_a(Array)
    expect(response.data.first).to be_a(Asaas::ReceivableAnticipation)
  end

  it 'gets anticipation' do
    stub_request(:get, "https://sandbox.asaas.com/api/v3/anticipations/id")
      .with(query: {id: 'id'}, headers: headers)
      .to_return(status: 200, body: get_anticipation_example_response)

    response = asaas_client.anticipations.get('id')

    expect(response).to be_a(Asaas::ReceivableAnticipation)
  end

  it 'simulates anticipation' do
    body = {payment: 'pay_626366773834'}

    stub_request(:post, "https://sandbox.asaas.com/api/v3/anticipations/simulate")
      .with(body: body, headers: headers)
      .to_return(status: 200, body: simulate_example_response)

    response = asaas_client.anticipations.simulate(body)

    expect(response).to be_a(Asaas::Entity::Base)
    expect(response.empty?).to be false
  end

  it 'signs agreement' do
    stub_request(:post, "https://sandbox.asaas.com/api/v3/anticipations/agreement/sign")
      .with(body: {agreed: true}.to_json, headers: headers)
      .to_return(status: 200, body: sign_agreement_example_response)

    response = asaas_client.anticipations.sign_agreement

    expect(response).to be_a(Asaas::Entity::Base)
    expect(response.empty?).to be false
    expect(response.agreed).to be true
  end
end
