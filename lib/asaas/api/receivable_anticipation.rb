module Asaas
  module Api
    class ReceivableAnticipation < Asaas::Api::Base
      def initialize(token, api_version)
        super(token, api_version, '/anticipations')
      end

      def create(body)
        @response = Typhoeus::Request.new(
          parse_url,
          method: :post,
          body: body,
          headers: {
            'access_token': @token || Asaas::Configuration.token,
            'Content-Type': 'multipart/form-data'
            },
          verbose: Asaas::Configuration.debug
        ).run

        parse_response
      end

      def simulate(body)
        @route = '/anticipations/simulate'

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
