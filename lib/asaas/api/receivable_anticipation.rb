module Asaas
  module Api
    class ReceivableAnticipation < Asaas::Api::Base
      def initialize(token, api_version)
        super(token, api_version, '/anticipations')
      end

      def simulate(body)
        @route = '/anticipations/simulate'

        request(:post, {}, body)
        parse_response
      end

      def sign_agreement
        @route = 'anticipations/agreement/sign'

        request(:post, {}, {agreed: true})
        parse_response
      end
    end
  end
end
