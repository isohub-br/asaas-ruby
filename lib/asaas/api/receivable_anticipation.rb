module Asaas
  module Api
    class ReceivableAnticipation < Asaas::Api::Base
      def initialize(token, api_version)
        super(token, api_version, '/anticipations')
      end

      def create(body)
        @default_class = Asaas::ReceivableAnticipation

        @response = RestClient.post(
          parse_url, 
          body,
          {
            'Content-Type': 'multipart/form-data',
            'access_token': @token || Asaas::Configuration.token
          }
        )

        parse_response
      end

      def simulate(body)
        @route = '/anticipations/simulate'
        @default_class = Asaas::ReceivableAnticipation

        request(:post, {}, body)
        parse_response
      end

      def sign_agreement
        @route = '/anticipations/agreement/sign'

        request(:post, {}, {agreed: true})
        parse_response
      end
    end
  end
end
