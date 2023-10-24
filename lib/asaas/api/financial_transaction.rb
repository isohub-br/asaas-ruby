module Asaas
  module Api
    class FinancialTransaction < Asaas::Api::Base
      def initialize(token, api_version)
        super(token, api_version, '/financialTransactions')
      end
    end
  end
end
