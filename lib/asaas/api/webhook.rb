module Asaas
  module Api
    class Webhook < Asaas::Api::Base

      def initialize(token, api_version)
        super(token, api_version, '/webhooks')
      end

    end
  end
end
