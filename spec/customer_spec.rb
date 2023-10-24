require 'webmock/rspec'
require 'asaas-ruby'

RSpec.describe Asaas::Customer do
  let(:customer_token) { 'a97d808e77b51653df429b6f9eecf90e3034d6ae35393509fefa5c202bfeb8f9' }

  before do 
    Asaas::Configuration.token = '544333290e93b9bbcd8107b3d9586e3bef774fb41584790a5ff061e4e0392ed5'
  end

  let(:example_response) { File.read('spec/fixtures/create_customer_success_response.json') }

  it 'can create a new customer' do
    params = { name: 'Marcos Junior', cpfCnpj: '34960665807', notificationDisabled: false }
    customer = Asaas::Customer.new(params)

    asaas_client = Asaas::Client.new(customer_token)
    expect(asaas_client.token).to eq(customer_token)

    stub_request(:post, "https://sandbox.asaas.com/api/v3/customers")
      .with(
        body: params.to_json,
        headers: {
          'Access-Token' => customer_token,
          'Content-Type' => 'application/json',
          'User-Agent' => 'Typhoeus - https://github.com/typhoeus/typhoeus'
        }
      )
      .to_return(status: 200, body: example_response, headers: {'Content-Type' => 'application/json'})

    created_customer = asaas_client.customers.create(customer)

    expect(created_customer).to be_a(Asaas::Customer)
  end
end
