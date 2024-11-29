module Asaas
  module Api
    class Webhook < Asaas::Api::Base

      def initialize(token, api_version)
        super(token, api_version, '/webhooks')
      end

      def list(params = {})
        @default_class = Asaas::Webhook
        super
      end
    end
  end
end