module Asaas
  module Api
    class ReceivableAnticipation < Asaas::Api::Base
      def initialize(token, api_version)
        super(token, api_version, '/anticipations')
      end

      def simulate(params)
        @endpoint = '/anticipations/simulate'

        request(:post, params)
        parse_response
      end

      def sign_agreement
        @endpoint = 'anticipations/agreement/sign'

        request(:post, {agreed: true})
        parse_response
      end
    end
  end
end
