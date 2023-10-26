module Asaas
  module Api
    class FinancialTransaction < Asaas::Api::Base
      def initialize(token, api_version)
        super(token, 3, '/financialTransactions')
      end
    end
  end
end
