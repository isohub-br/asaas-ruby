require 'webmock/rspec'
require 'asaas-ruby'

RSpec.describe Asaas::Customer do
  before { Asaas::Configuration.token = '544333290e93b9bbcd8107b3d9586e3bef774fb41584790a5ff061e4e0392ed5' }

  let(:example_response) { File.read('spec/fixtures/get_financial_transactions.json') }

  it 'gets financial transactions' do
    asaas_client = Asaas::Client.new

    params = { startDate: Date.new(2023,1,3), endDate: Date.new(2023,2,3), order: 'asc' }

    stub_request(:get, "https://sandbox.asaas.com/api/v3/financialTransactions")
      .with(
        query: params,
        headers: {
          'Access-Token' => Asaas::Configuration.token,
          'Content-Type' => 'application/json',
          'User-Agent' => 'Typhoeus - https://github.com/typhoeus/typhoeus'
        }
      )
      .to_return(status: 200, body: example_response, headers: {'Content-Type' => 'application/json'})

    list = asaas_client.financial_transactions.list(params)

    expect(list).to be_a(Asaas::Entity::Meta)
    expect(list.data).to be_a(Array)
    expect(list.data.first).to be_a(Asaas::FinancialTransaction)
  end
end
