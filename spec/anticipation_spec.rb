require 'webmock/rspec'
require 'asaas-ruby'

RSpec.describe Asaas::Customer do
  before do
    Asaas::Configuration.token = '544333290e93b9bbcd8107b3d9586e3bef774fb41584790a5ff061e4e0392ed5'
    Asaas::Configuration.api_version = 3
  end

  let(:example_response) { File.read('spec/fixtures/list_anticipations.json') }

  it 'gets anticipations' do
    asaas_client = Asaas::Client.new

    params = {}

    stub_request(:get, "https://sandbox.asaas.com/api/v3/anticipations")
      .with(
        query: params,
        headers: {
          'Access-Token' => Asaas::Configuration.token,
          'Content-Type' => 'application/json',
          'User-Agent' => 'Typhoeus - https://github.com/typhoeus/typhoeus'
        }
      )
      .to_return(status: 200, body: example_response, headers: {'Content-Type' => 'application/json'})

    list = asaas_client.anticipations.list(params)

    expect(list).to be_a(Asaas::Entity::Meta)
    expect(list.data).to be_a(Array)
    expect(list.data.first).to be_a(Asaas::ReceivableAnticipation)
  end
end
